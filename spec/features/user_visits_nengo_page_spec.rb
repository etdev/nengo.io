require "rails_helper"
RSpec.feature "User visits nengo page" do
  scenario "successfully" do
    visit "/"
    click_link("Convert")
    expect(page).to have_content "西暦・和暦年号の変換"
  end
end
