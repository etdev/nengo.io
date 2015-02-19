require "rails_helper"

RSpec.feature "User views navbar" do
  scenario "successfully" do
    visit root_path
    expect(page).to have_css("[role=navbar]", text: "nengo")
  end
end

RSpec.feature "User views navbar links" do
  scenario "successfully" do
    visit root_path
    expect(page).to have_content "年号"
    expect(page).to have_content "年齢"
    expect(page).to have_content "干支"
    expect(page).to have_content "祝日"
    expect(page).to have_content "アプリ"
  end
end

