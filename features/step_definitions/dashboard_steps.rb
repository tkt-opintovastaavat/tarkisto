require "#{Rails.root}/db/seeds.rb"

Given /^I have a course ([0-9]+) "([^"]*)" \(([0-9]+)op\) which is in "([^"]*)"$/ do |code, name, credits, level|
     CourseLevel.find_by_name(level).courses.create! :code => code, :name => name, :credits => credits
end

