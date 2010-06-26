Then /^I should see publish button$/ do
    response.should have_tag("input[type=submit][value=#{I18n.t 'pages.exams.forms.publish.submit'}]")
end

Given /^I have "([^"]*)" type of exam on course ([0-9]+)$/ do |examtype, code|
     Course.find_by_code(code).exams.published.create :exam_type_id => ExamType.find_by_name(examtype).id, :maximum_points => 60, :date => Date.today
end
