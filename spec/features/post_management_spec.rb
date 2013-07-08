require "spec_helper"

# background is an alias for before
# scenario for it, 
# and given/given! aliases for let/let!
feature 'home page' do
  scenario 'Listing posts' do
    visit '/'
    page.should have_content('Listing posts')
  end
end

#feature "Widget management" do
#  scenario "User creates a new widget" do
#    visit "/widgets/new"

#    fill_in "Name", :with => "My Widget"
#    click_button "Create Widget"

#    expect(page).to have_text("Widget was successfully created.")
#  end
#end
