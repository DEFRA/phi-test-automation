@regression
Feature: Validate the Annex 6 rules for prohibited and Not prohibited plants

  @prohibited
  Scenario Outline: Validate that the plant name - '<SearchString>' is prohibited as '<serviceFormat>' from '<country>'
    Given url 'https://phi-etl-fera-backend.test.cdp-int.defra.cloud/workflow'
    And request {"plantDetails": {"hostRef": <hostref>,"serviceFormat": <serviceFormat>,"country": <country>}}
    When method POST
    Then status 200
    And print 'response returned by API:', response
    And match response.annexSixRule == '<Annex6>'
    And match response.outcome == '<Outcome>'

    Examples:
      | SearchString                | hostref | serviceFormat       | country       | Annex6    | Outcome    |
      | Solanum Tuberosum           | 23916   | Plants for planting | Russia        | 6A15      | prohibited |
      | Solanum Tuberosum           | 23916   | Plants for planting | Mexico        | 6A15      | prohibited |
      | Taxus brevifolia            | 25063   | Isolated Bark       | United States | 6C2       | prohibited |
      | Solanum Andigenum           | 23774   | Plants for planting | Mexico        | 6A15      | prohibited |
      | Tsuga                       | 25982   | Parts of a plant    | Canada        | 6A1       | prohibited |
      | Pinus                       | 19114   | Parts of a plant    | Canada        | 6A1       | prohibited |
      | Vitis                       | 26870   | Plants for planting | Mexico        | 6A10      | prohibited |
      | Phoenix                     | 18794   | Parts of a plant    | Algeria       | 6A13      | prohibited |
      | Castanea                    | 5202    | Isolated Bark       | United States | 6A4       | prohibited |
      | Quercus                     | 20685   | Isolated Bark       | Canada        | 6A5       | prohibited |
      | Quercus                     | 20685   | Isolated Bark       | United States | 6A5 + 6C2 | prohibited |
      | Acer Saccharum              | 481     | Isolated Bark       | Canada        | 6A6       | prohibited |
      | Populus                     | 19832   | Isolated Bark       | Canada        | 6A7       | prohibited |
      | Ullucus Tuberosus           | 26112   | Plants for planting | Mexico        | 6B2       | prohibited |
      | Polymnia sonchifolia        | 19775   | Plants for planting | New Zealand   | 6B3A      | prohibited |
      | Tsuga                       | 25982   | Produce             | Russia        | 6B5       | prohibited |
      | Pinus                       | 19114   | Produce             | Russia        | 6B5       | prohibited |
      | Acer macrophyllum           | 442     | Isolated Bark       | United States | 6C2       | prohibited |
      | Solanum andigenum           | 23774   | Plants for planting | Egypt         | 6A15      | prohibited |
      | Solanum tuberosum           | 23916   | Plants for planting | Egypt         | 6A15      | prohibited |
      | Sapium sebiferum            | 22677   | Plants for planting | Mexico        | INNS      | Prohibited |
      | Salvinia molesta            | 22600   | Plants for planting | United States | INNS      | Prohibited |
      | Prosopis juliflora          | 20104   | Plants for planting | Canada        | INNS      | Prohibited |
      | Persicaria perfoliata       | 19729   | Plants for planting | New Zealand   | INNS      | Prohibited |
      | Pennisetum setaceum         | 18388   | Plants for planting | Algeria       | INNS      | Prohibited |
      | Baccharis                   | 2993    | Parts of a plant    | Algeria       | INNS      | Prohibited |
      | Asclepias syriaca           | 2558    | Parts of a plant    | Algeria       | INNS      | Prohibited |
      | Andropogon                  | 1802    | Parts of a plant    | Russia        | INNS      | Prohibited |
      | Alternanthera philoxeroides | 1384    | Parts of a plant    | Mexico        | INNS      | Prohibited |
      | Ailanthus altissima         | 1043    | Parts of a plant    | New Zealand   | INNS      | Prohibited |
      | Acacia saligna              | 245     | Parts of a plant    | Canada        | INNS      | Prohibited |

  @Notprohibited
  Scenario Outline: Validate that the plant name - '<SearchString>' is not prohibited as '<serviceFormat>' from '<country>'
    Given url 'https://phi-etl-fera-backend.test.cdp-int.defra.cloud/workflow'
    And request {"plantDetails": {"hostRef": <hostref>,"serviceFormat": <serviceFormat>,"country": <country>}}
    When method POST
    Then status 200
    And print 'response returned by API:', response
    And match response.annexSixRule == '<Annex6>'
    And match response.outcome == '<Outcome>'

    Examples:
      | SearchString                  | hostref | serviceFormat       | country | Annex6 | Outcome       |
      | Quercus suber                 | 20819   | Isolated Bark       | Canada  | 6A5    | un-prohibited |
      | Acnistus arborescens          | 581     | Plants for planting | Algeria | 6A18   | un-prohibited |
      | Solanum acaule                | 23766   | Produce             | Egypt   | 6A17   | un-prohibited |
      | Uniola latifolia              | 26155   | Plants for planting | Syria   | 6A14   | un-prohibited |
      | Solanum andigenum             | 23774   | Produce             | Egypt   | 6A17   | un-prohibited |
      | Solanum tuberosum             | 23916   | Produce             | Egypt   | 6A17   | un-prohibited |
      | Spartina Schreb               | 24170   | Plants for planting | Morocco | 6A14   | un-prohibited |
      | Shibataea                     | 23491   | Plants for planting | Egypt   | 6A14   | un-prohibited |
      | Poaceae                       | 11729   | Plants for planting | Syria   | 6A14   | un-prohibited |
      | Phalaris                      | 18631   | Plants for planting | Jordan  | 6A14   | un-prohibited |
      | Panicoideae                   | 17879   | Plants for planting | Algeria | 6A14   | un-prohibited |
      | Molinia                       | 16370   | Plants for planting | Algeria | 6A14   | un-prohibited |
      | Hystrix                       | 13006   | Plants for planting | Israel  | 6A14   | un-prohibited |
      | Hakonechloa                   | 13006   | Plants for planting | Lebanon | 6A14   | un-prohibited |
      | Glyceria                      | 11549   | Plants for planting | Morocco | 6A14   | un-prohibited |
      | Cortaderia                    | 7048    | Plants for planting | Tunisia | 6A14   | un-prohibited
      | Calamagrostis                 | 4348    | Plants for planting | Tunisia | 6A14   | un-prohibited |
      | Buchloe                       | 4137    | Plants for planting | Tunisia | 6A14   | un-prohibited |
      | Bouteloua                     | 3833    | Plants for planting | Tunisia | 6A14   | un-prohibited |
      | Arthrostylidium capillifolium | 2473    | Plants for planting | Egypt   | 6A14   | un-prohibited |
      | Solanum biflorum              | 23785   | Plants for planting | Germany | 6A16   | un-prohibited |
