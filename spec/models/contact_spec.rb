require 'spec_helper'

describe Contact, :type => :model do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }

  [:first_name, :last_name].each do |name|
    it { should allow_value("John").for(name) }
    it { should allow_value("amy").for(name) }
    it { should allow_value("بالعربي").for(name) }

    it { should_not allow_value("G4m3r").for(name) }
  end

  it { should have_many(:phone_numbers).dependent(:destroy) }
  it { should belong_to :address }

  describe "Phone numbers" do
    it "first phone number entered becomes primary" do
      contact = FactoryGirl.create(:contact)
      phone_number = FactoryGirl.create(:phone_number, contact: contact)
      expect(phone_number.primary).to eq(true)
    end

    it "second phone number entered is not primary" do
      contact = FactoryGirl.create(:contact)
      FactoryGirl.create(:phone_number, contact: contact)
      phone_number = FactoryGirl.create(:phone_number, contact: contact)
      expect(phone_number.primary).to eq(false)
    end

    it "makes another number primary when primary number is destroyed" do
      contact = FactoryGirl.create(:contact)
      primary = FactoryGirl.create(:phone_number, contact: contact)
      normal = FactoryGirl.create(:phone_number, contact: contact)
      primary.destroy
      expect(normal.reload.primary).to eq(true)
    end
  end
end
