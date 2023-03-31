@productsubAPIs @all
Feature: Products Subscription

  Background:
    * url baseUrl
    * header Authorization = authorization
    * def reqBody = read ("datas/requestBody1.json")

@productsub
  Scenario: Get all record of product subscription
    Given path '/api/v1/product-subscription'
    When  method GET
    Then  status 200
    And   print response
@productsub
  Scenario:  Get specific product subcription by user_id
    Given  path '/api/v1/product-subscription/user/641b15358b679aadf33bf43e'
    When   method GET
    Then   status 200
    And    print response
@productsub
  Scenario: Get specific product subscription by product_id
    Given  path '/api/v1/product-subscription/product/63d7e4a30d128e9ea1d4d4b8'
    When   method GET
    Then   status 200
    And    print response
@productsub
  Scenario: Get one record of product subscription by id
    Given  path '/api/v1/product-subscription/63d8e97774b498d160b20197'
    When   method GET
    Then   status 200
    And    print response
@productsub
Scenario: create a product subscription
  Given path '/product-subscription'
  And   request reqBody
  When  method POST
  Then  status 201
  And   print response