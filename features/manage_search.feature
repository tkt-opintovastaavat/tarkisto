Feature: Manage searches
     In order to have functional search
     wants to have following scenarios
  
     Scenario: See a search result
          Given I search with keyword "lama"
          And I should see "Hakusi oli: lama" within "#content"
          And I should see "Laskennan mallit" within "#content"

     Scenario: See another search result
          Given I search with keyword "tira"
          And I should see "Hakusi oli: tira" within "#content"
          And I should see "Tietorakenteet" within "#content"
