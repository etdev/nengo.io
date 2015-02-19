require "rails_helper"
RSpec.feature "User visits eto page" do
  scenario "successfully" do
    visit "/"
    click_link "干支"
    expect(page).to have_content "干支ページ"
  end
end
