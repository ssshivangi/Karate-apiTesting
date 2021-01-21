@toprated
Feature: GET: Top rated movies Validations

  Background: 
    * url url

  Scenario: Validate results of top rated movies

    Given path 'movie/top_rated'
    And param api_key = "83bc3b78a4707e2e42bd01a349617861" 
    And param language = "en-US"
    And param page = 1
    And header Content-Type = 'application/json'
    When method GET
    Then status 200
     And json responseJSON = response
    * def results = get responseJSON.results[*].vote_average
    * print results
    #* def sorted_results = get responseJSON.results[*].vote_average
    #* print results
    #* def sorted = call sortArray sorted_results
    #* print sorted
    #* print sorted_results
    #* match sorted_results == results
    #* match each posts == { postId: 10, id: '#number', name: '#string', email: '#regex ^\\S+@\\S+$', body: '#string' }
    
   Scenario: Validate 401 error code

    Given path 'movie/top_rated'
    And param api_key = "123465789" 
    And param language = "en-US"
    And param page = 1
    And header Content-Type = 'application/json'
    And request ''
    When method GET
    Then status 401
    
   Scenario: Validate 422 error code

    Given path 'movie/top_rated'
    And param api_key = "83bc3b78a4707e2e42bd01a349617861" 
    And param language = "en-US"
    And param page = 0
    And header Content-Type = 'application/json'
    And request ''
    When method GET
    Then status 422
    
    