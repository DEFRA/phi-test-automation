@regression
Feature: Validate post operation for pest search API

  @pestSearch
  Scenario Outline: Validate POST for pestSearch API for "<SearchString>"
    Given url 'https://phi-etl-fera-backend.test.cdp-int.defra.cloud/search/pests?'
    And request {  "search" : "<SearchString>" }
    When method POST
    Then status 200
    And print 'Response:', response.pest_detail[0].results[0]

    Examples:
      | read('pestNames.csv') |





