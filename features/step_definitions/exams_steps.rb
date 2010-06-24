Then /^I should see publish button$/ do
    response.should have_tag("input[type=submit][value=#{I18n.t 'pages.exams.forms.publish.submit'}]")
end
