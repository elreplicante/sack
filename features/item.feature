Feature: Add item

  Scenario: Invalid url
    Given I am in the app
    When I fill it with "Bad url"
    And I click "Add"
    Then I should see "Bad url" within ".alert"

  Scenario: Valid url
    Given I am in the app
    When I fill it with "http://www.as.com"
    And I click "Add"
    Then I should see "URL added to the sack!" within ".alert"