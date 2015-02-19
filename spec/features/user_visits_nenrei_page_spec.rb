require "rails_helper"
RSpec.feature "User visits 年齢 page" do
  scenario "successfully" do
    visit "/"
    click_link "年齢"
    expect(page).to have_content "年齢ページ"
  end
end
