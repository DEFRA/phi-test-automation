Feature: Validate Annex 6 and Annex 11 rules for partially prohibited with clarifications and exemptions


  @ppwithSubformatException
  Scenario Outline: Validate POST for plant detail API for '<SearchString>'
    Given url 'https://phi-etl-fera-backend.test.cdp-int.defra.cloud/workflow'
    And request {"plantDetails": {"hostRef": <hostref>,"serviceFormat": <serviceFormat>,"country": <country>}}
    When method POST
    Then status 200
    And print 'response returned by API:', response
    And match response.outcome == '<Outcome>'
    And match response.annexSixRule == '<Annex6>'
    And match response.A11_RULE == '<Annex11>'

    Examples:
      | SearchString      | hostref | serviceFormat       | country       | Outcome              | Annex6          | Annex11 |
      | Phoenix           | 18794   | Plants for planting | Algeria       | partially-prohibited | 6A13            | 11A04   |
      | Photinia          | 18822   | Plants for planting | United States | partially-prohibited | 6A12            | 11A04   |
      | Poncirus          | 19824   | Plants for planting | India         | partially-prohibited | 6A11            | 11C25   |
      | Malus             | 15575   | Plants for planting | Australia     | partially-prohibited | 6A8 + 6A9 + 6B1 | 11A04   |
      | Malus             | 15575   | Plants for planting | United States | partially-prohibited | 6A8 + 6A9 + 6B1 | 11A04   |
      | Prunus            | 20152   | Plants for planting | Jordan        | partially-prohibited | 6A8 + 6A9 + 6B1 | 11A26   |
      | Prunus            | 20152   | Plants for planting | United States | partially-prohibited | 6A8 + 6A9 + 6B1 | 11A26   |
      | Pinus Thunbergi   | 19213   | Parts of a plant    | Japan         | partially-prohibited | 6A1             | 11A26   |
      | Juniperus         | 13695   | Parts of a plant    | South Korea   | partially-prohibited | 6A1             |         |
      | Ullucus tuberosus | 26112   | Produce             | Canada        | partially-prohibited | 6B2             | 11A05   |
      | Phoenix           | 18794   | Produce             | Algeria       | partially-prohibited | 6A13            | 11A13   |

  @ppwithClarification
  Scenario Outline: Validate POST for plant detail API for '<SearchString>'
    Given url 'https://phi-etl-fera-backend.test.cdp-int.defra.cloud/workflow'
    And request {"plantDetails": {"hostRef": <hostref>,"serviceFormat": <serviceFormat>,"country": <country>}}
    When method POST
    Then status 200
    And print 'Expected Response is:', <expectedPlantDetailResp>
    And print 'response returned by API:', response
    And match response.outcome == '<Outcome>'
    And match response.annexSixRule == '<Annex6>'
    And match response.A11_RULE == '<Annex11>'

    Examples:
      | SearchString | hostref | serviceFormat       | country     | Outcome              | Annex6          | Annex11 |
      | Momordica    | 16387   | Produce             | Algeria     | partially-prohibited | 6B3             | 11A19   |
      | Fraxinus     | 10970   | Plants for planting | France      | partially-prohibited | 6A21            | 11A04   |
      | Fraxinus     | 10970   | Parts of a plant    | France      | partially-prohibited | 6A21            | 11A17   |
      | Solanum      | 23765   | Produce             | Australia   | partially-prohibited | 6A17            |         |
      | Solanum      | 23765   | Plants for planting | Australia   | partially-prohibited | 6A16            | 11A04   |
      | Juniperus    | 13695   | Plants for planting | South Korea | partially-prohibited | 6A1             | 11A04   |
      | Fragaria     | 10947   | Plants for planting | Russia      | partially-prohibited | 6A9             | 11A04   |
      | Crataegus    | 7196    | Plants for planting | Russia      | partially-prohibited | 6A8 + 6B1       | 11A04   |
      | Prunus       | 20152   | Plants for planting | Russia      | partially-prohibited | 6A8 + 6A9 + 6B1 | 11A26   |
      | Uniola       | 26154   | Plants for planting | Canada      | partially-prohibited | 6A14            | 11A04   |
      | Shibataea    | 23491   | Plants for planting | Russia      | partially-prohibited | 6A14            | 11A04   |
      | Cedrus Trew  | 5364    | Parts of a plant    | Russia      | partially-prohibited | 6A1             |         |

