Given(/^I am in the app$/) do
  visit '/'
end

When(/^I read the title$/) do

end

Then(/^it reads 'Sack'$/) do
  page.has_title? 'Sack'
end

