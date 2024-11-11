@regression
Feature: Validate pest details API when accessing a pest information from the plant page

#  Background:
#    * def expectedPestDetailResp = read('classpath:examples/users/Payload/expectedPestDetailResp.json')

  @pestDetails
  Scenario Outline: Validate POST for pest detail API for '<SearchString>'
    Given url 'https://phi-etl-fera-backend.test.cdp-int.defra.cloud/search/pestdetails?'
    And request { "pestDetails": { "cslRef": <cslref> } }
    When method POST
    Then status 200
    And print 'Response:', response.pest_detail[0]

    Examples:
      | SearchString                                   | cslref |
      | Dendroctonus micans                            | 8644   |
      | Alternaria mali                                | 12264  |
      | Clavibacter sepedonicus                        | 10954  |
      | Synchytrium endobioticum                       | 12046  |
      | Chrysodeixis eriosoma                          | 2745   |
      | Curculio elephas                               | 3164   |
      | Spodoptera exempta                             | 4603   |
      | Xiphinema diversicaudatum                      | 7721   |
      | Chaetosiphon fragaefolii                       | 8375   |
      | Conotrachelus nenuphar                         | 8467   |
      | Creontiades pallidus                           | 8532   |
      | Corythucha ciliata                             | 8548   |
      | Chrysolina americana                           | 8564   |
      | Monochamus alternatus                          | 9594   |
      | Monochamus obtusus                             | 9596   |
      | Monochamus titillator                          | 9598   |
      | Neophyllaphis grobleri                         | 9668   |
      | Acrobasis pirivorella                          | 9714   |
      | Oncometopia (Oncometopia) nigricans            | 9762   |
      | Chionaspis pinifoliae                          | 9937   |
      | Maconellicoccus hirsutus                       | 9941   |
      | Phyrdenus muriceus                             | 9975   |
      | Phyllocoptes fructiphilus                      | 10001  |
      | Phyllocnistis citrella                         | 10010  |
      | Pissodes fasciatus                             | 10038  |
      | Planococcus lilacinus                          | 10058  |
      | Porphyrophora tritici                          | 10123  |
      | Pratylenchus penetrans                         | 10135  |
      | Gymnosporangium libocedri                      | 10993  |
      | Leveillula taurica                             | 11004  |
      | Peach mosaic virus (American)                  | 11032  |
      | Mexican periwinkle virescence phytoplasma      | 11047  |
      | Pear bark split agent                          | 11061  |
      | Burkholderia caryophylli                       | 11064  |
      | Pseudomonas syringae pv. morsprunorum          | 11065  |
      | Ralstonia solanacearum                         | 11066  |
      | Potato virus T                                 | 11073  |
      | Tomato yellow vein streak begomovirus          | 11112  |
      | Xanthomonas citri subsp. citri                 | 11122  |
      | Apple stem grooving virus                      | 11131  |
      | Beet leaf curl virus                           | 11133  |
      | Diplocarpon mali                               | 11146  |
      | Erwinia pyrifoliae                             | 11149  |
      | Fusarium oxysporum f.sp. cubense               | 11151  |
      | Alternaria gaisen                              | 11208  |
      | Bean golden mosaic virus                       | 11217  |
      | Cronartium comptoniae                          | 11236  |
      | Citrus blight agent                            | 11237  |
      | Citrus tatter leaf virus                       | 11238  |
      | Grapevine leafroll-associated virus 3          | 11261  |
      | Melampsora farlowii                            | 11278  |
      | Prune dwarf virus                              | 11293  |
      | Phialophora cinerescens                        | 11299  |
      | Phytophthora cambivora                         | 11309  |
      | Rhizoctonia solani                             | 11329  |
      | Squash leaf curl virus                         | 11338  |
      | Caulimovirus venafragariae                     | 11344  |
      | Xanthomonas fragariae                          | 11360  |
      | Beet necrotic yellow vein virus                | 11367  |
      | Plenodomus tracheiphilus                       | 11378  |
      | Elsinoe fawcettii                              | 11380  |
      | Grapevine ajinashika virus                     | 11385  |
      | Colletotrichum linicola                        | 11746  |
      | Clavibacter michiganensis subsp. michiganensis | 11751  |
      | Cronartium coleosporioides                     | 11756  |
      | Cronartium kamtschaticum                       | 11757  |
      | Phomopsis vaccinii                             | 11775  |
      | Elsinoe australis                              | 11785  |
      | Cronartium harknessii                          | 11787  |
      | Erwinia amylovora                              | 11792  |
      | Pantoea stewartii subsp. stewartii             | 11794  |
      | Nepovirus foliumflabelli                       | 11817  |
      | Helicobasidium purpureum                       | 11836  |
      | Entoleuca mammata                              | 11840  |
      | 'Candidatus Liberibacter africanus'            | 11853  |
      | Monilinia fructicola                           | 11877  |
      | Mycodiella laricis-leptolepidis                | 11887  |
      | Ophiostoma novo-ulmi                           | 11904  |
      | Neofabraea vagabunda                           | 11920  |
      | Stagonosporopsis andigena                      | 11928  |
      | Candidatus Phytoplasma prunorum                | 11939  |
      | Peach rosette phytoplasma                      | 11941  |
      | Ceratitis quinaria                             | 14104  |
      | Chilo partellus                                | 14180  |
      | Choristoneura pinus pinus                      | 14213  |
      | Chrysobothris femorata                         | 14220  |
      | Chrysodeixis chalcites                         | 14254  |
      | Clastoptera achatina                           | 14315  |
      | Colaspis chlorites                             | 14415  |
      | Percolaspis ornata                             | 14417  |
      | Conoderus exsul                                | 14454  |
      | Acanthoscelides obtectus                       | 14554  |
      | Corythucha arcuata                             | 14609  |
      | Sternochetus mangiferae                        | 14638  |
      | Grapholita inopinata                           | 14690  |
      | Cylas formicarius                              | 14693  |
      | Dacus ciliatus                                 | 14733  |
      | Bactrocera minax                               | 14734  |
      | Bactrocera dorsalis                            | 14735  |
      | Bactrocera tsuneonis                           | 14739  |
      | Dendroctonus adjunctus                         | 14799  |
      | Dendrolimus pini                               | 14805  |
      | Dendrolimus superans                           | 14807  |
      | Diabrotica speciosa speciosa                   | 14847  |
      | Diabrotica undecimpunctata howardi             | 14848  |
      | Diabrotica virgifera subsp. virgifera          | 14849  |
      | Diabrotica virgifera subsp. zeae               | 14850  |
      | Singhiella citrifolii                          | 14859  |
      | Dinoderus minutus                              | 14907  |
      | Disonycha conjugata                            | 14940  |
      | Ditylenchus dipsaci                            | 14949  |
      | Diaphania nitidalis                            | 14977  |
      | Drosophila suzukii                             | 15001  |
      | Earias vittella                                | 15038  |
      | Echinothrips americanus                        | 15048  |
      | Rhagoletis completa                            | 18130  |
      | Rhagoletis pomonella                           | 18132  |
      | Rhagoletis suavis                              | 18133  |
      | Ripersiella hibisci                            | 18156  |
      | Rhopalosiphum rufiabdominale                   | 18179  |
      | Rhynchophorus ferrugineus                      | 18191  |
      | Scaphoideus (Scaphoideus) luteolus             | 18282  |
      | Scirtothrips aurantii                          | 18315  |
      | Agrilus mali                                   | 18659  |
      | Tetranychus evansi                             | 18786  |
      | Eotetranychus sexmaculatus                     | 18792  |
      | Tetranychus urticae                            | 18795  |
      | Agrypnus variabilis                            | 18816  |
      | Thaumetopoea pinivora                          | 18830  |
      | Thrips australis                               | 18830  |
      | Thrips imaginis                                | 18864  |
      | Thrips parvispinus                             | 18866  |
      | Tinocallis takachihoensis                      | 18870  |
