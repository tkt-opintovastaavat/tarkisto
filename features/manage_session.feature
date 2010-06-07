Feature: Manage sessions
     In order to do log in and log out
     wants to have following scenarios
  
     Scenario: Log in
          Given I am on the home page
          When I press "Log in"
          Then I should see "Log out"
          When I follow "Log out"
          Then I should not see "Log out"
