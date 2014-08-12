Given(/^I am in the homepage$/) do
  visit '/'
end

Then(/^I can see the Sack claim$/) do
  expect(page).to have_content "Infoxication sucks!"
end

When(/^I click the "(.*?)" link$/) do |text|
  click_on text
end

Then(/^I can sign up with Google$/) do
  expect(page).to have_link "Sign up with Google"
end