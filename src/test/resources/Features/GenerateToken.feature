Feature: Token Generator CSR portal

# we are going to re-use a generate token feature.

Scenario: Prepare for test. generate token.

	Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response 