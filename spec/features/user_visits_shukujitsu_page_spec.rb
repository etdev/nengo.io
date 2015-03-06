require "rails_helper"
RSpec.feature "User visits 祝日 page" do
  scenario "successfully" do
    visit "/"
    click_link "祝日"
    expect(page).to have_content "祝日ページ"
  end
end


