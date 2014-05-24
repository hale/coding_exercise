require 'spec_helper'

describe "Creating contacts" do

  before(:each) { visit '/contacts/new' }

  it "has a form for creating contacts" do
    expect(page).to have_content("New Contact")
  end

  describe "form has field for name" do
    subject { page }
    it { should have_selector("input#contact_first_name") }
    it { should have_selector("input#contact_last_name") }
  end

  describe "address" do
    it "has a section for the address" do
      expect(page).to have_content("Address")
    end

    describe "form has the required fields" do
      subject { page }

      it { should have_selector("input#contact_address_first_line") }
      it { should have_selector("input#contact_address_second_line") }
      it { should have_selector("input#contact_address_city") }
      it { should have_selector("input#contact_address_state") }
      it { should have_selector("input#contact_address_zip_code") }
    end

    describe "Phone numbers" do
      it "has a section for the numbers" do
        expect(page).to have_content("Phone Numbers")
      end

      it { expect(page).to have_selector("input#contact_phone_numbers_number") }
    end

  end

end
