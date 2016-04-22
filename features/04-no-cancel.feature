Feature: Cancel button available

Scenario: Success
  Given I visit "/node/add/idea"
  Then  I should see the "Cancel" button
