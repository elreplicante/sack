Given(/^I am in the app$/) do
  visit '/'
end

When(/^I click "(.*?)"$/) do |add_button|
  click_on add_button
end

When(/^I fill it with "(.*?)"$/) do |url|
  fill_in "url", with: url
end