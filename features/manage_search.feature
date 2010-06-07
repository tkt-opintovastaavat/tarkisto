Feature: Manage searches
     In order to have functional search
     wants to have following scenarios
  
     Scenario: See the search results
          Given I search with keyword "lama"
          And I should see "Hakusi oli: lama" within "#content"
          And I should see "Laskennan mallit" within "#content"
