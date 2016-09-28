When(/^I go to the new post page$/) do
  visit new_post_path
end

When(/^I type "([^"]*)" in the "([^"]*)" field$/) do |text, field_label|
  fill_in field_label, :with => text
end

When(/^I go to the post index page$/) do
  visit posts_path
end

And(/^I click the "([^"]*)" button$/) do |button_text|
  click_button button_text
end

Then(/^I should see the post titled "([^"]*)"$/) do |post_title|
  links = all(:css, "a")
  link_texts = links.map { |link| link.text }
  expect(link_texts).to include(post_title)
end

Then(/^I should be redirected to my new post$/) do
  expect(page).to have_current_path(post_path(Post.last.id))
end

Given(/^there are (\d+) posts$/) do |post_count|
  post_count.to_i.times do
    step %{I create a new post}
  end
end

Then(/^I should see links to the last (\d+) posts$/) do |post_count|
  recent_posts = Post.last(post_count.to_i)
  links = all(:css, "a")
  link_urls = links.map { |link| link["href"] }

  recent_posts.each do |post|
    expect(link_urls).to include(post_path(post))
  end
end

When(/^I create a new post$/) do
  steps %{
    When I go to the new post page
    And I type "best post in the world" in the "Post title" field
    And I type "srsly its good" in the "Subtitle" field
    And I type "this is the content" in the "Write your post" field
    And I click the "Save" button
  }
end

Then(/^I should( not)? see a link to the first post$/) do |modifier|
  first_post = Post.first

  links = all(:css, "a")
  link_urls = links.map { |link| link["href"] }

  if modifier
    expect(link_urls).to_not include(post_path(first_post))
  else
    expect(link_urls).to include(post_path(first_post))
  end
end
