@WalletAPIs @all
Feature: WALLET API Demo

  Background:
    * url  baseUrl
    * header Content-type = 'application/json'
    * header Authorization = authorization
    * def requestData = read("datas/create.json")
    * def updateWallet = read("datas/update.json")
    * def walletId = "64230347657461aff079139c"

  @wallet
  Scenario Outline: Create a wallet
    Given path '/api/v1/wallet'
    And request { "user":<user_id>, "gestionnaire":<gestionnaire_id>,"isActive":<isActive>}
    When method POST
    Then status 201
    And print response
    * def walletId = response._id
    And print walletId
    Examples:
      |requestData  |

  @wallet
  Scenario Outline: update a specific wallet
    Given path '/api/v1/wallet/'+walletId
    And request { "user":<user>, "gestionnaire":<gestionnaire>,"isActive":<isActive>,"product":<product>,"quantity":<quantity>}
    When method PATCH
    Then status 201
    And print response
    Examples:
      |updateWallet  |

  @wallet
  Scenario: Delete a wallet
    Given path '/api/v1/wallet/6422c162657461aff0791372'
    When method DELETE
    Then print response
    And status 200
    And print responseStatus

  @wallet
    Scenario: GET all wallets
      Given path '/api/v1/wallet'
      When method GET
      Then print response
      And status 200
      And match response[0].initial_value == 0
      And match response[0]._id != null
      And print responseStatus

  @wallet
  Scenario: GET wallet BY ID
    Given path '/api/v1/wallet/63df5c36ad437ea9f60e8034'
    When method GET
    Then print response
    And status 200
    And match response.designation == "Default wallet"
    And match response._id == "63df5c36ad437ea9f60e8034"
    And assert response.length != null
    And print responseStatus

  @wallet
  Scenario: GET wallet BY UserID
    Given path '/api/v1/wallet/user/641b15358b679aadf33bf43e'
    When method GET
    Then print response
    And status 200
    And match response.designation == "Default wallet"
    And match response.user._id == "641b15358b679aadf33bf43e"
    And print responseStatus



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