Feature: Manage dashboard
     In order to use dashboard
     wants to have following scenarios
  
     Scenario: Visit dashboard page
          Given I am on the home page
          And I should see "Kurssit" within "#content"

     Scenario: View courses
          Given I have a course 581325 "Ohjelmoinnin perusteet" (5op) which is in "Perusopinnot"
          And I have a course 582206 "Laskennan mallit" (6op) which is in "Aineopinnot"
          And I have a course 582313 "Bioinformatiikan perusteet" (4op) which is in "Syventävät opinnot"
          When I am on the home page 
          Then I should see "Ohjelmoinnin perusteet" within "#basic_studies"
          And I should see "Laskennan mallit" within "#intermediate_studies"
          And I should see "Bioinformatiikan perusteet" within "#advanced_studies"

