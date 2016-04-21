Feature: Idea submission

Scenario: Success
  Given I visit "/node/add/idea"
  And   I fill in "Title" with "Heureka"
  And   I fill in "Body" with:
  """
  We should destroy the universe.
  """
  And   I press the "Save" button
  Then  I should see "Idea Heureka has been created"

