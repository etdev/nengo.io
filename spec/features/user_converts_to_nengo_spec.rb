require "rails_helper"
RSpec.feature "User converts seireki year to nengo" do
  scenario "successfully" do
    visit root_path
    binding.pry
    fill_in "西暦の年", with: "2014"
    page.find("#submit_seireki").click
    #expect(page).to have_content "平成"
    #expect(page).to have_css(")
  end
end
