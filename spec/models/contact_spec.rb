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

  it { should accept_nested_attributes_for(:address) }
  it { should accept_nested_attributes_for(:phone_numbers) }

  describe "#as_json" do
    it "combines first and last name" do
      c = FactoryGirl.create(:contact, first_name: "foo", last_name: "bar")
      expect(c.as_json).to eq({ "full_name" => "foo bar", "id" => c.id })
    end

    it "works on collections" do
      cs = FactoryGirl.create_pair(:contact, first_name: "foo", last_name: "bar")
      expect(cs.as_json).to include(
        { "full_name" => "foo bar", "id" => cs[0].id },
        { "full_name" => "foo bar", "id" => cs[1].id }
      )
    end
  end
end
