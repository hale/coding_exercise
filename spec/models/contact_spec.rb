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
end
