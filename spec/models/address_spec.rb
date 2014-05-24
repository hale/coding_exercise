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

    it { should allow_value("Boston").for(:city) }
    it { should allow_value("San Jóse").for(:city) }
    it { should_not allow_value("23rd city").for(:city) }
    it { should_not allow_value("Bo\nston").for(:city) }

    it { should allow_value("CA").for(:state) }
    it { should allow_value("Texas").for(:state) }
    it { should allow_value("West Virginia").for(:state) }

    it { should_not allow_value("texas").for(:state) }
    it { should_not allow_value("Nemadeupa").for(:state) }
    it { should_not allow_value("ZZ").for(:state) }

    it { should allow_value("12345").for(:zip_code) }
    it { should_not allow_value("123456").for(:zip_code) }
    it { should_not allow_value("1234").for(:zip_code) }
    it { should_not allow_value("12 45").for(:zip_code) }
    it { should_not allow_value("a2345").for(:zip_code) }

  end
end
