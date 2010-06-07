Given /^I search with keyword "([^\"]*)"$/ do |keyword|
     visit "/search?query=#{keyword}"
end
