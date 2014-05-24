require 'spec_helper'

describe "Creating contacts" do
  it "has a form for creating contacts" do
    visit '/contacts/new'
    expect(page).to have_content("New Contact")
  end
end
