@regression
Feature: Validate post operation for plant search API

  @plantSearch
  Scenario Outline: Validate POST for plantSearch API for "<SearchString>"
    Given url 'https://phi-etl-fera-backend.test.cdp-int.defra.cloud/search/plants'
    And request {  "search" : "<SearchString>" }
    When method POST
    Then status 200
    And print 'Response:', response.plant_detail[0].results[0]

    Examples:
      | read('plantName.csv') |





