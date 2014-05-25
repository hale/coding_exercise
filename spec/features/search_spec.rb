require 'spec_helper'

describe "Searching for contacts" do
  it "Shows a search form on the homepage" do
    visit '/'
    expect(page).to have_selector("form#search_form")
  end

  it "can search on first names" do
    FactoryGirl.create(:contact, first_name: "Ka", last_name: "Jarek")
    visit '/'
    fill_in "search_input", with: "Ka"
    check "Contact first name"
    click_button "Search"
    expect(page).to have_content("Ka Jarek")
  end

  it "can search both first and last names" do
    FactoryGirl.create(:contact, first_name: "Ka")
    FactoryGirl.create(:contact, last_name: "Jarek")
    visit '/'
    fill_in "search_input", with: "Ka Jarek"
    check "Contact first name"
    check "Contact last name"
    click_button "Search"
    expect(page).to have_content("Ka Jarek")
  end

  it "can search addresses" do
    addr = FactoryGirl.create(:address, city: "Equestria")
    FactoryGirl.create(:contact, address: addr, first_name: "Snails")
    visit '/'
    fill_in "search_input", with: "Equestria"
    check "Address city"
    click_button "Search"
    expect(page).to have_content("Snails")
  end
end
