Feature: New content appears on front

Scenario: Success
  Given I visit "/node/add/idea"
  And   I fill in "Title" with "Front page content"
  And   I fill in "Body" with:
  """
  We shouldn't destroy the universe.
  """
  And   I visit "/"
  Then  I should see "Front page content"
