Feature: Add item

  Scenario: Bad url
    Given I am in the app
    When I fill it with "badurl"
    And I click "Add"
    Then I should see "Bad url"