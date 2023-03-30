@UserAPIs @all
Feature: User API

  Background:
    * url  baseUrl
    * header Content-type = 'application/json'
    * header Authorization = authorization
    * def requestBody = read("datas/test_api/data/user.json")


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

  @user
  Scenario: create a user
    Given  path '/api/v1/user/register'
    And    def reqBody = read ("datas/requestBody3.json")
    And    request reqBody
    When   method POST
    Then   status 201
    And    print response

#  @user
#  Scenario:  create user from csv file with key user_asset
#    Given   path '/api/v1/user/register-csv'
#    And     request
#    When    method POST
#    Then    status 201
#    And     print response

  @user
  Scenario: Test get product Pesa API
    Given path '/api/v1/user/641b15358b679aadf33bf43e'
    When method PATCH
    And request requestBody
    Then status 200
    And print response

  @user
  Scenario: Test delete user Pesa API
    Given path '/api/v1/user/641b15358b679aadf33bf43e'
    When method DELETE
    Then status 200
    And print response