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

      it { should have_selector("input#contact_address_attributes_line_1") }
      it { should have_selector("input#contact_address_attributes_line_2") }
      it { should have_selector("input#contact_address_attributes_city") }
      it { should have_selector("input#contact_address_attributes_state") }
      it { should have_selector("input#contact_address_attributes_zip_code") }
    end

    describe "Phone numbers" do
      it "has a section for the numbers" do
        expect(page).to have_content("Phone Numbers")
      end

      it { expect(page).to have_selector("input#contact_phone_numbers_attributes_0_number") }
    end

    describe "creating a contact" do
      it "can be submitted with valid attributes" do
        visit '/contacts/new'
        fill_in "contact_first_name", with: "Sue"
        fill_in "contact_last_name", with: "Gherkins"
        fill_in "contact_address_attributes_line_1", with: "32"
        fill_in "contact_address_attributes_line_2", with: "Edmonson Street"
        fill_in "contact_address_attributes_city", with: "San Jose"
        fill_in "contact_address_attributes_state", with: "NY"
        fill_in "contact_address_attributes_zip_code", with: "143278"
        fill_in "contact_phone_numbers_attributes_0_number", with: "231-242-2211"
        click_on "Create Contact"
      end
    end
  end

end
