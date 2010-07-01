Feature: Manage exams
     In order to do all exam actions
     wants to have following scenarios
  
     Scenario: Show all exams
          Given I have a course 581325 "Ohjelmoinnin perusteet" (5op) which is in "Perusopinnot"
          And I am on the exams page of course 581325
          And I should see "Ohjelmoinnin perusteet" within "#tab-content"
          And I should see "Erilliskoe" within "#tab-content"
          And I should see "Kurssikoe" within "#tab-content"
          And I should see "Uusintakoe" within "#tab-content"

     Scenario: Show one exam page
          Given I have a course 581325 "Ohjelmoinnin perusteet" (5op) which is in "Perusopinnot"
          And I am on the exams page of course 581325
          And I should see "Ohjelmoinnin perusteet" within "#tab-content"
          And I should see "Erilliskoe" within "#tab-content"
          When I follow "Erilliskoe" within "#tab-content"
          Then I should see "Ohjelmoinnin perusteet" within "#tab-content"
          And I should see "Erilliskoe" within "#tab-content"
          #And I should see "Selitä äärellisestä automaatista" within "#tab-content"

     Scenario: Add new exam
          Given I have a course 581325 "Ohjelmoinnin perusteet" (5op) which is in "Perusopinnot"
          And I am on the new exam page of course 581325
          And I should see "Ohjelmoinnin perusteet" within "#tab-content"
          And I should see "Lisää uusi tentti" within "#tab-content"

     Scenario: Generate practice exam
          Given I have a course 581325 "Ohjelmoinnin perusteet" (5op) which is in "Perusopinnot"
          And I am on the generate practice exam page of course 581325
          And I should see "Ohjelmoinnin perusteet" within "#tab-content"
          And I should see "Generoi harjoitustentti" within "#tab-content"
