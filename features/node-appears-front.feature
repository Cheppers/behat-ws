Feature: The content appears on the front page.

Scenario: The content appears on the front page.
  Given I visit "/node/add/idea"
  And   I fill in "Title" with "Heureka front"
  And   I fill in "Body" with:
  """
  We should destroy the universe.
  """
  And   I press the "Save" button
  And 	I am at "/"
  Then I should see "Heureka front"