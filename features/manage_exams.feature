Feature: Manage exams
     In order to do all exam actions
     wants to have following scenarios
  
     Scenario: Show all exams
          Given I have a course 581325 "Ohjelmoinnin perusteet" (5op) which is in "Perusopinnot"
          And I am on the exams page of course 581325
          And I should see "Ohjelmoinnin perusteet" within "#mainbody"
          And I should see "Erilliskoe" within "#mainbody"
          And I should see "Kurssikoe" within "#mainbody"
          And I should see "Uusintakoe" within "#mainbody"

     Scenario: Show one exam page
          Given I have a course 581325 "Ohjelmoinnin perusteet" (5op) which is in "Perusopinnot"
          And I am on the exams page of course 581325
          And I should see "Ohjelmoinnin perusteet" within "#mainbody"
          And I should see "Erilliskoe" within "#mainbody"
          When I follow "Erilliskoe" within "#mainbody"
          Then I should see "Ohjelmoinnin perusteet" within "#mainbody"
          And I should see "Erilliskoe" within "#mainbody"
          #And I should see "Selitä äärellisestä automaatista" within "#mainbody"

     Scenario: Add new exam
          Given I have a course 581325 "Ohjelmoinnin perusteet" (5op) which is in "Perusopinnot"
          And I am on the new exam page of course 581325
          And I should see "Ohjelmoinnin perusteet" within "#mainbody"
          And I should see "Lisää uusi tentti" within "#mainbody"

     Scenario: Generate practice exam
          Given I have a course 581325 "Ohjelmoinnin perusteet" (5op) which is in "Perusopinnot"
          And I am on the generate practice exam page of course 581325
          And I should see "Ohjelmoinnin perusteet" within "#mainbody"
          And I should see "Generoi harjoitustentti" within "#mainbody"
