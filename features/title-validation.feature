Feature: Missing title field validation

Scenario: Missing title validation
  Given I visit "/node/add/idea"
  And   I fill in "Body" with:
  """
  We should destroy the universe.
  """
  And   I press the "Save" button
  Then  I should see "Title field is required."
