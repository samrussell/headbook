Feature: New posts
  Scenario: Creating a new post
    When I go to the new post page
    And I type "best post in the world" in the "Post title" field
    And I type "srsly its good" in the "Subtitle" field
    And I type "this is the content" in the "Write your post" field
    And I click the "Save" button

    When I go to the post index page
    Then I should see the post titled "best post in the world"
