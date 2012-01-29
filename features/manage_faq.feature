Feature: Manage faqs
  In order to see FAQ
  wants to have following scenarios

  @wip
  Scenario: Visit FAQ page
    Given I am on the faq page
    And I should see "FAQ" within "#content"

  @wip
  Scenario: Visit FAQ page from home page
    Given I am on the home page
    And I should see "FAQ" within "#footer"
    When I follow "FAQ" within "#footer"
    Then I should see "FAQ" within "#content"
