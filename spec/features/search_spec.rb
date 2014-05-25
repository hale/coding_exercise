require 'spec_helper'

describe "Searching for contacts" do
  it "Shows a search form on the homepage" do
    visit '/'
    expect(page).to have_selector("form#search_form")
  end

  context "search first names" do
    it "returns some results" do
      FactoryGirl.create(:contact, first_name: "Ka", last_name: "Jarek")
      visit '/'
      fill_in "search_input", with: "Ka"
      click_button "Search"
      expect(page).to have_content("Ka Jarek")
    end
  end
end
