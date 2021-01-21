@rateMovie
Feature: POST: Rate movies Validations

  Background: 
    * url url
    * def movie_id = 755812

  Scenario: Validate status of movie
    Given path 'authentication/guest_session/new'
    And param api_key = "83bc3b78a4707e2e42bd01a349617861"
    And header Content-Type = 'application/json'
    When method GET
    Then status 200
    * def sessionId = response.guest_session_id
    * print sessionId
    
    #Verify the status for movie Id
    Given path 'movie/'+ movie_id+'/rating'
    And param api_key = "83bc3b78a4707e2e42bd01a349617861"
    And param guest_session_id = sessionId
    And header Content-Type = 'application/json'
    And request '{"value": 8.5 }'
    When method POST
    Then status 201
    * def status = response
    * match status == { "success": true, "status_code": 1, "status_message": '#string' }
    
    #Validate 400 error code
    Given path 'movie/'+ movie_id+'/rating'
    And param api_key = "83bc3b78a4707e2e42bd01a349617861"
    And param guest_session_id = sessionId
    And header Content-Type = 'application/json'
    And request '{"value": 100 }'
    When method POST
    Then status 400
    * def status = response
    * match status == { "success": false, "status_code": 18, "status_message": "Value too high: Value must be less than, or equal to 10.0."}
    
    #Validate 401 error code for invalid api key
    Given path 'movie/'+ movie_id+'/rating'
    And param api_key = "1245678456"
    And param guest_session_id = sessionId
    And header Content-Type = 'application/json'
    And request '{"value": 8.5 }'
    When method POST
    Then status 401
    * def status = response
    * match status == { "status_code": 7, "status_message": "Invalid API key: You must be granted a valid key.", "success": false }
    
    #Validate 401 error code for invalid session Id
    Given path 'movie/'+ movie_id+'/rating'
    And param api_key = "1245678456"
    And param guest_session_id = sessionId
    And header Content-Type = 'application/json'
    And request '{"value": 8.5 }'
    When method POST
    Then status 401
    * def status = response
    * match status == { "success": false, "status_code": 7, "status_message": "Invalid API key: You must be granted a valid key." }
    
