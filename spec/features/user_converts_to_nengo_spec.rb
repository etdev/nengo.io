require "rails_helper"
RSpec.feature "User converts seireki year to nengo" do
  scenario "successfully" do
    visit root_path
    fill_in "西暦の年", with: "2015"
    click_button "変換"
    expect(page).to have_content "平成"
    expect(page).to have_content "27"
  end
end
