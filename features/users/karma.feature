Feature: Karma points
  As app admin
  In order to see each users engagement in The community
  I would like to assign karma points to users for activities and interactions

  Background:
    Given I am a new user
    And I am logged in
    And the following projects exist:
      | title       | description          | status   |
      | hello world | greetings earthlings | active   |
      | hello mars  | greetings aliens     | inactive |
    And there are no videos

  Scenario: User should have no karma by default
    Given I am on "profile" page for user "me"
    Then I should have "0" karma points

  Scenario: Gaining karma by joining projects
    Given I am not a member of project "hello mars"
    And I am on the "Show" page for project "hello mars"
    And I click the very stylish "Join Project" button
    When I visit my "profile" page
    Then I should have "1" karma points

  Scenario: Gaining karma by adding articles
    Given I am on the "Articles" page
    And I click the very stylish "New Article" button
    Then I should see "Create a New Article"
    When I fill in "Title" with "Hello, Uranus!"
    And I fill in "Content" with "**An example of** ``Markdown``"
    And I click the "Create" button
    When I visit my "profile" page
    Then I should have "1" karma points

  Scenario: Gaining karma by adding videos
    Given my YouTube Channel ID with some videos in it
    And my YouTube channel is connected
    When I visit my "profile" page
    Then I should have "10" karma points