Feature: Manage dashboard
  In order to use dashboard
  wants to have following scenarios

  @wip
  Scenario: Visit dashboard page
    Given I am on the home page
    And I should see "Kurssit" within "#content"

  @wip
  Scenario: View courses
    Given I am on the home page
    And I should see "Perusopinnot" within "#basic_studies"
    And I should see "Aineopinnot" within "#intermediate_studies"
    And I should see "Syventävät opinnot" within "#advanced_studies"
    And I should see "Muut opinnot" within "#other_studies"

