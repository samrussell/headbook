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
