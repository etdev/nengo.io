require "rails_helper"
RSpec.feature "User visits app download page" do
  scenario "successfully" do
    visit "/"
    click_link "Apps"
    expect(page).to have_content "Android"
    expect(page).to have_content "iPhone"
  end
end
