Feature: New posts
  Scenario: Creating a new post
    When I go to the new post page
    And I type "best post in the world" in the "Post title" field
    And I type "srsly its good" in the "Subtitle" field
    And I type "this is the content" in the "Write your post" field
    And I click the "Save" button
    Then I should be redirected to my new post

    When I go to the post index page
    Then I should see the post titled "best post in the world"

  Scenario: Only show 5 posts on the first page
    Given there are 5 posts
    When I go to the post index page
    Then I should see links to the last 5 posts
    And I should see a link to the first post

    When I create a new post
    And I go to the post index page
    Then I should see links to the last 5 posts
    And I should not see a link to the first post
