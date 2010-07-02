Then /^I should see publish button$/ do
    response.should have_tag("input[type=submit][value=#{I18n.t 'pages.exams.forms.publish.submit'}]")
end

Given /^I have "([^"]*)" type of exam on course ([0-9]+)$/ do |type, code|
     Course.find_by_code(code).exams.published.create :type_id => Type.find_by_name_fi(type).id, :maximum_points => 60, :date => Date.today
end
