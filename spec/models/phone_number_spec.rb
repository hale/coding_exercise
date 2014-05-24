require 'spec_helper'

describe PhoneNumber, :type => :model do
  it { should validate_presence_of :number }
  it { should allow_value("123-123-1234").for(:number) }
  it { should_not allow_value("1231231234").for(:number) }
  it { should_not allow_value("123.123.1234").for(:number) }
  it { should_not allow_value("abc.123.1234").for(:number) }
  it { should_not allow_value("123-1-3-1234").for(:number) }
  it { should_not allow_value("123-1\n3-1234").for(:number) }
end
