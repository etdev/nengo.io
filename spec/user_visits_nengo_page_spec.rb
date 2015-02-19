require "rails_helper"
RSpec.feature "User visits nengo page" do
  scenario "successfully" do
    visit "/"
    click_link("年号")
    expect(page).to have_content "nengoへようこそ"
  end
end
