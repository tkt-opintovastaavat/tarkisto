require "#{Rails.root}/db/seeds.rb"

Given /^I have a course ([0-9]+) "([^"]*)" \(([0-9]+)op\) which is in "([^"]*)"$/ do |code, name, credits, level|
  Level.find_by_name_fi(level).courses.create! :code => code, :name_fi => name, :credits => credits
end

