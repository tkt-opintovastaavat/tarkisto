Feature: Manage exams
  In order to do all exam actions
  wants to have following scenarios

  @wip
  Scenario: Show all exams
    Given I have a course 581325 "Ohjelmoinnin perusteet" (5op) which is in "Perusopinnot"
    And I have "Erilliskoe" type of exam on course 581325
    And I have "Kurssikoe" type of exam on course 581325
    And I have "Uusintakoe" type of exam on course 581325
    And I am on the exams page of course 581325
    And I should see "Ohjelmoinnin perusteet" within "#mainbody"
    And I should see "Erilliskoe" within "#mainbody"
    And I should see "Kurssikoe" within "#mainbody"
    And I should see "Uusintakoe" within "#mainbody"

  @wip
  Scenario: Show one exam page
    Given I have a course 581325 "Ohjelmoinnin perusteet" (5op) which is in "Perusopinnot"
    And I have "Erilliskoe" type of exam on course 581325
    And I am on the exams page of course 581325
    And I should see "Ohjelmoinnin perusteet" within "#mainbody"
    And I should see "Erilliskoe" within "#mainbody"
    When I follow "Erilliskoe" within "#mainbody"
    Then I should see "Ohjelmoinnin perusteet" within "#mainbody"
    And I should see "Erilliskoe" within "#mainbody"

  @wip
  Scenario: Add new exam
    Given I have a course 581325 "Ohjelmoinnin perusteet" (5op) which is in "Perusopinnot"
    And I am on the exams page of course 581325
    And I log in with valid user
    And I am on the new exam page of course 581325
    And I should see "Ohjelmoinnin perusteet - Lisää uusi tentti" within "#mainbody"
    When I select "Erilliskoe" from "Koetyyppi"
    And I fill in "Päivämäärä" with "25.01.2009"
    And I fill in "Maksimipisteet" with "60"
    And I press "Jatka"
    Then I should see "Erilliskoe 25.01.2009"

  @wip
  Scenario: Generate practice exam
    Given I have a course 581325 "Ohjelmoinnin perusteet" (5op) which is in "Perusopinnot"
    And I am on the generate practice exam page of course 581325
    And I should see "Ohjelmoinnin perusteet" within "#mainbody"
    And I should see "Generoi harjoitustentti" within "#mainbody"
