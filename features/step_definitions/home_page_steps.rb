Given(/^I am in the homepage$/) do
  visit '/'
end

Then(/^I can see the Sack claim$/) do
  expect(page).to have_content "Infoxication sucks!"
end