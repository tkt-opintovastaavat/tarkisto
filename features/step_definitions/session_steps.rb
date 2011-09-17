def do_login
  fill_in I18n.t('pages.session.form.username'), :with => "john"
  fill_in I18n.t('pages.session.form.password'), :with => "password"
  click_button I18n.t('pages.session.form.submit')
end

When /^I log in with valid user$/ do
  do_login
end
