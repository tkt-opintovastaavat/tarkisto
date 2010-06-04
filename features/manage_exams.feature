Feature: Manage exams
     In order to do all exam actions
     wants to have following scenarios
  
     Scenario: Show all exams
          Given I am on the exams page of course 1
          And I should see "Laskennan mallit"
          And I should see "Erilliskoe"
          And I should see "Kurssikoe"
          And I should see "Uusintakoe"

     Scenario: Show one exam page
          Given I am on the exams page of course 1
          And I should see "Laskennan mallit"
          And I should see "Erilliskoe"
          When I follow "Erilliskoe"
          Then I should see "Laskennan mallit"
          And I should see "Erilliskoe"
          And I should see "Selitä äärellisestä automaatista"

     Scenario: Add new exam
          Given I am on the new exam page of course 1
          And I should see "Laskennan mallit"
          And I should see "Lisää uusi tentti"

     Scenario: Generate practice exam
          Given I am on the generate practice exam page of course 1
          And I should see "Laskennan mallit"
          And I should see "Generoi harjoitustentti"
