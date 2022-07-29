Feature: New accounts Scenarios 
  Background: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    * def generatedToken = response.token
  #Scenario: Create new Account Happy pass
    #Given path "/api/accounts/add-primary-account"
    #And request {"email": "zakiakrami@gmail.com","title": "Mr.","firstName": "Zaki","lastName": "Akrami","gender": "MALE","maritalStatus": "MARRIED","employmentStatus": "student","dateOfBirth": "1982-03-05"}
#       And header Authorization = "Bearer "+generatedToken
#       When method post
    #Then status 201
    #* def generatedId = response.id
    #And print generatedId
    #And print response
    Scenario: Add new Account with Existing Email address
        Given path "/api/accounts/add-primary-account"
        And request {"email": "zakiakrami276@hotmail.com","title": "Mr.","firstName": "Zaki","lastName": "Akrami","gender": "MALE","maritalStatus": "MARRIED","employmentStatus": "Quality Assurance Engineer","dateOfBirth": "1982-03-05"}
        And header Authorization = "Bearer "+generatedToken
        When method post
        Then status 400
        * def errorCode = response.errorCode
        * def httpStatus = response.httpStatus
        * def dataBaseResponse = response.errorMessage
        And assert errorCode =="ACCOUNT_EXIST"
        And assert httpStatus =="BAD_REQUEST"
        And assert dataBaseResponse =="Account with Email zakiakrami276@hotmail.com is exist"
        And print response
    Scenario: Add car to existing Account
        Given path "/api/accounts/add-account-car"
        And param primaryPersonId = 2525
        And request {"primaryPerson": {"email": "zakiakrami276@hotmail.com","title": "Mr.","firstName": "Zaki","lastName": "Akrami","gender": "MALE","maritalStatus": "MARRIED","employmentStatus": "Quality Assurance Engineer","dateOfBirth": "1982-03-05"},"make": "Toyota","model": "Corolla","year": "2021","licensePlate": "YLF-2505"}
        And header Authorization = "Bearer "+generatedToken
        When method post
        Then status 201
        And print response
    Scenario: Add Phone Number to Existing Account
        Given path "/api/accounts/add-account-phone"
        And param primaryPersonId = 2525
        And request {"phoneNumber": "5403986868","phoneExtension": "N/A","phoneTime": "Evening","phoneType": "Mobile"}
        And header Authorization = "Bearer "+generatedToken
        When method post
        Then status 201
        And print response
    Scenario: Add Address to Existing Account
        Given path "/api/accounts/add-account-address"
        And param primaryPersonId = 2525
        And request {"addressType": "Apartment","addressLine1": "2 Devonshire Drive","city": "Fredericksburg","state": "Virginia","postalCode": "22401","countryCode": "+1"}
        And header Authorization = "Bearer "+generatedToken
        When method post
        Then status 201
        And print response