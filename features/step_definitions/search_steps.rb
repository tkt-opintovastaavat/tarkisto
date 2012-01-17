Given /^I search with keyword "([^\"]*)"$/ do |keyword|
  visit "/search?query=#{keyword}"
end

Given /^I have a course called "([^"]*)"$/ do |name|
  Course.create! :name_fi => name, :credits => 0, :code => 1234
end
