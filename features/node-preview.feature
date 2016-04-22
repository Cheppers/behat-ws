Feature: Preview the node and save

Scenario: Preview the node and save
  Given I visit "/node/add/idea"
  And   I fill in "Title" with "Heureka"
  And   I fill in "Body" with:
  """
  We should destroy the universe.
  """
  And   I press the "Preview" button
  And 	I should see "Preview"
  And   I press the "Save" button
  Then  I should see "Idea Heureka has been created"