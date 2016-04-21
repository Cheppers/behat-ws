<?php

use Drupal\DrupalExtension\Context\RawDrupalContext;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawDrupalContext implements SnippetAcceptingContext
{
    /**
     * Initializes context.
     *
     * Every scenario gets its own context instance.
     * You can also pass arbitrary arguments to the
     * context constructor through behat.yml.
     */
    public function __construct()
    {
    }

  /**
   * @see \Drupal\DrupalExtension\Context\MinkContext->assertButton()
   *
   * @Then I should not see the button :button
   * @Then I should not see the :button button
   */
  public function assertNoButton($button) {
    $element = $this->getSession()->getPage(); # Mink element, with DOM manipulation methods
    $buttonObj = $element->findButton($button);
    if (!empty($buttonObj)) {
      throw new \Exception(sprintf("The button '%s' was found on the page %s", $button, $this->getSession()->getCurrentUrl()));
    }
  }
}
