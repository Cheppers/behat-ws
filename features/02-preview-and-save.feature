Feature: Preview and save

Scenario: Success
  Given I visit "/node/add/idea"
  And   I fill in "Title" with "Heureka"
  And   I fill in "Body" with:
  """
  We shouldn't destroy the universe.
  """
  And   I press the "Preview" button
  Then  I should see "Preview trimmed version"
  And   I should see "Preview full version"
  Then  I press the "Save" button
  Then  I should see "Idea Heureka has been created."
