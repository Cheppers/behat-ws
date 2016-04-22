Feature: Missing title validation

Scenario: Success
  Given I visit "/node/add/idea"
  And   I fill in "Body" with:
  """
  We should destroy the universe.
  """
  And   I press the "Save" button
  Then  I should see "Title field is required."

