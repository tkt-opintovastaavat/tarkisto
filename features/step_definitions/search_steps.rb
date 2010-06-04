Given /^I search with keyword "([^\"]*)"$/ do |keyword|
     visit "/search?q=#{keyword}"
end
