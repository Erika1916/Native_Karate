@UserAPIs@all
Feature: WALLET API Demo

  Background:
    * url  baseUrl
    * header Content-type = 'application/json'
    * header Authorization = authorization


  @user
  Scenario: GET all users
    Given path '/api/v1/user'
    When method GET
    Then print response
    And status 200
    And match response[0].last_name != null
    And print responseStatus

  @user
  Scenario: GET USER BY UserID
    Given path '/api/v1/user/641c70438b679aadf33bf5bf'
    When method GET
    Then print response
    And status 200
    And match response._id == "641c70438b679aadf33bf5bf"
    And print responseStatus