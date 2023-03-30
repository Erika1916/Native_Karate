@all
Feature: API PESA Default

  Background:
    * url baseUrl
    * header Content-Type = 'application/json'
    * header Authorization = authorization

  @default
  Scenario:  Get default
    Given path '/api/v1'
    When  method GET
    Then  status 200
    And   print response

  @default
  Scenario: Get confirm email
    Given  path '/confirm-email'
    When   method GET
    Then   status 200
    And    print response

  @default
  Scenario: Post reset password
    Given   path '/api/v1/reset-password'
    And     request {"email": "francine.okourou@gmail.com"}
    When    method POST
    Then    status 201
    And     print response

  @default
  Scenario: Post product sale
    Given   path '/api/v1/product-sale'
    And     def reqBody = read ('data/requestBody2.json')
    And     request reqBody
    When    method POST
    Then    status 201
    And     print response



