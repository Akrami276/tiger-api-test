Feature: Create an account and add address to the account

# Setp 1) Get a token 
# Setp 2) Generate an Account
# Setp 3) add address to generated account

Background: Creat new Account.

 Given url "https://tek-insurance-api.azurewebsites.net"
* def result = callonce read('CreatAccountFeature.feature')
 And print result
* def primaryPersonId = result.response.id
* def token = result.result.response.token
@smoke3
Scenario: Add address to an account

Given path '/api/accounts/add-account-address'
Given param primaryPersonId = primaryPersonId
Given header Authorization = "Bearer " + token
Given request 
"""
{

  "id": 0,
  "addressType": "Home",
  "addressLine1": "2 Devonshire Drive",
  "city": "Fredericksburg",
  "state": "VA",
  "postalCode": "22401",
  "countryCode": "+1",
  "current": true

}

"""

When method post
Then status 201
And print response



