@ProductAPIs @all
Feature: WALLET API Demo

  Background:
    * url  baseUrl
    * header Content-type = 'application/json'
    * header Authorization = authorization
    * def walletId = "64230347657461aff079139c"
    * def  Iid = read("datas/test_api/data/id_product.json")

  @produit
  Scenario: Test add product Pesa API
    Given path '/api/v1/product'
    And def requestBody = read("test_api/data/add_product.json")
    And request requestBody
    When method POST
    Then status 201
    And print response

  @produit
  Scenario: Test get all products Pesa API
    Given path '/api/v1/product'
    When method GET
    Then status 200
    And print response

  @produit
  Scenario: Test get product Pesa API
    Given path "/api/v1/product/641b4e0c8b679aadf33bf558"
    When method GET
    Then status 200
    And print response

  @produit
  Scenario: Test delete product Pesa API
    Given path '/api/v1/product/641b4e0c8b679aadf33bf558'
    When method DELETE
    Then status 200

  @produit
  Scenario: Test patch product Pesa API
    Given path '/api/v1/product/64255f13657461aff0791448'
    When method PATCH
    And def requestBody = read("datas/test_api/data/update_product.json")
    Then status 200
    And print response