@WalletAPIs
Feature: WALLET API Demo

  Background:
    * url  baseUrl
    * header Content-type = 'application/json'
    * header Authorization = authorization

  @Get777
    Scenario: GET all wallets
      Given path '/api/v1/wallet'
      When method GET
      Then print response
      And status 200
      And match response[0].initial_value == 0
      And match response[0]._id != null
      And print responseStatus

  @Get777
  Scenario: GET wallet BY ID
    Given path '/api/v1/wallet/63df5c36ad437ea9f60e8034'
    When method GET
    Then print response
    And status 200
    And match response.designation == "Default wallet"
    And match response._id == "63df5c36ad437ea9f60e8034"
    And assert response.length != null
    And print responseStatus

  @Get777
  Scenario: GET wallet BY UserID
    Given path '/api/v1/wallet/user/641b15358b679aadf33bf43e'
    When method GET
    Then print response
    And status 200
    And match response.designation == "Default wallet"
    And match response.user._id == "641b15358b679aadf33bf43e"
    And print responseStatus
