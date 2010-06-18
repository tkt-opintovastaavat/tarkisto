Feature: Manage faqs
     In order to see FAQ
     wants to have following scenarios
  
     Scenario: Visit FAQ page
          Given I am on the faq page
          And I should see "FAQ" within "#content"
  
     Scenario: Visit FAQ page from home page
          Given I am on the home page
          And I should see "FAQ" within "#navi"
          When I follow "FAQ" within "#navi"
          Then I should see "FAQ" within "#content"
