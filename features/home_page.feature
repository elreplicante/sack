Feature: Home Page

  Background:
    Given I am in the homepage

  Scenario: Sack claim
    Then I can see the Sack claim

  Scenario: Sack claim
    When I click the "Sign up" link
    Then I can sign up with Google
