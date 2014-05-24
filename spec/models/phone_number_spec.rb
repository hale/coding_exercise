require 'spec_helper'

describe PhoneNumber, :type => :model do
  it { should validate_presence_of :number }
  it { should allow_value("123-123-1234").for(:number) }
  it { should_not allow_value("1231231234").for(:number) }
  it { should_not allow_value("123.123.1234").for(:number) }
  it { should_not allow_value("abc.123.1234").for(:number) }
  it { should_not allow_value("123-1-3-1234").for(:number) }
  it { should_not allow_value("123-1\n3-1234").for(:number) }

  it { should belong_to(:contact) }

  describe "Setting the primary phone numbers" do
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
