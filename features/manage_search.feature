Feature: Manage searches
  In order to have functional search
  wants to have following scenarios

  Scenario: See a search result
    Given I have a course called "Laskennan mallit"
    Then I search with keyword "laskennan"
    And I should see "Hakusi oli: laskennan" within "#content"
    And I should see "Laskennan mallit" within "#content"
