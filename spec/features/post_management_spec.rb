require "spec_helper"

# background is an alias for before
# scenario for it, 
# and given/given! aliases for let/let!
feature 'Home page' do
  scenario 'Listing posts' do
    visit '/'
    page.should have_content('Listing posts')
  end
end

feature "Post management" do
  scenario "User creates a new post" do
    visit "/posts/new"
    fill_in "Title", :with => "My Post"
    fill_in "Description", :with => "My Description"
    page.check('Published')
    click_button "Create Post"

    expect(page).to have_text("Post was successfully created.")
  end
end

