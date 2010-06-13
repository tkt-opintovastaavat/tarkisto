Feature: Manage sessions
     In order to do log in and log out
     wants to have following scenarios
  
     Scenario: Log in
          Given I am on the home page
          When I press "Kirjaudu"
          Then I should see "Kirjaudu ulos"
          When I follow "Kirjaudu ulos"
          Then I should not see "Kirjaudu ulos"
