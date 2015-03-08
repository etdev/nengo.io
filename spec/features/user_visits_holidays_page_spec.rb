require "rails_helper"
RSpec.feature "User visits 祝日 page" do
  scenario "successfully" do
    visit_holidays_page
    expect(page).to have_content "祝日ページ"
  end

  scenario "and views holidays successfully" do
    visit_holidays_page
    expect(page).to have_css("table[data-role=holidays]")
    expect(page).to have_content("元日")
    expect(page).to have_content("天皇誕生日")
  end

  def visit_holidays_page
    visit "/"
    click_link "祝日"
  end
end


