require "rails_helper"
RSpec.feature "User views navbar links" do
  scenario "successfully" do
    visit welcome_path
    expect(page).to have_content "年号・西暦"
    expect(page).to have_content "年齢"
    expect(page).to have_content "干支"
  end
end
