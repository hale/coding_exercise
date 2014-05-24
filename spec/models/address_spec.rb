require 'spec_helper'

describe Address, :type => :model do
  describe "validations" do
    [:line_1, :line_2].each do |street_addr|
      it { should allow_value("34 Jute Street").for(street_addr) }
      it { should allow_value("23 Jétçe タカ").for(street_addr) }

      it { should_not allow_value("!").for(street_addr) }
      it { should_not allow_value("23\nsomething").for(street_addr) }
      it { should_not allow_value("street!").for(street_addr) }
    end

  end
end
