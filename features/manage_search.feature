Feature: Manage searches
     In order to have functional search
     wants to have following scenarios
  
     Scenario: See a search result
          Given I search with keyword "laskennan mallit"
          And I should see "Hakusi oli: Laskennan mallit" within "#content"
          And I should see "Laskennan mallit" within "#content"
