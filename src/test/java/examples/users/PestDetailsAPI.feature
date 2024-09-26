@regression
Feature: Validate post operation for plant Detail API

  Background:
    * def expectedPestDetailResp = read('classpath:examples/users/Payload/expectedPestDetailResp.json')


  @pestDetails
  Scenario Outline: Validate POST for plant detail API for '<SearchString>'
    Given url 'https://phi-etl-fera-backend.test.cdp-int.defra.cloud/search/pestdetails?'
    And request { "pestDetails": { "cslRef": <cslref> } }
    When method POST
    Then status 200
    And print 'Response:', response.pest_detail[0]

    Examples:
      | SearchString            | cslref |
      | Dendroctonus micans     | 8644   |
      | Alternaria mali         | 12264  |
      | Clavibacter sepedonicus | 10954  |
      | Synchytrium endobioticum| 12046  |
