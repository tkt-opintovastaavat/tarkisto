Feature: Manage exams
     In order to do all exam actions
     wants to have following scenarios
  
     Scenario: Show all exams
          Given I am on the exams page of course 1
          And I should see "Laskennan mallit" within "#tab-content"
          And I should see "Erilliskoe" within "#tab-content"
          And I should see "Kurssikoe" within "#tab-content"
          And I should see "Uusintakoe" within "#tab-content"

     Scenario: Show one exam page
          Given I am on the exams page of course 1
          And I should see "Laskennan mallit" within "#tab-content"
          And I should see "Erilliskoe" within "#tab-content"
          When I follow "Erilliskoe" within "#tab-content"
          Then I should see "Laskennan mallit" within "#tab-content"
          And I should see "Erilliskoe" within "#tab-content"
          And I should see "Selitä äärellisestä automaatista" within "#tab-content"

     Scenario: Add new exam
          Given I am on the new exam page of course 1
          And I should see "Laskennan mallit" within "#tab-content"
          And I should see "Lisää uusi tentti" within "#tab-content"

     Scenario: Generate practice exam
          Given I am on the generate practice exam page of course 1
          And I should see "Laskennan mallit" within "#tab-content"
          And I should see "Generoi harjoitustentti" within "#tab-content"
