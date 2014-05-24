require 'spec_helper'

describe ContactsHelper do
  describe "#setup_contact" do
    it "assigns 3 numbers" do
      contact_mock = flexmock(:contact, address: nil, :address= => nil)
      contact_mock.should_receive("phone_numbers.build").times(3)
      ViewMock.new.setup_contact(contact_mock)
    end
  end
end

class ViewMock
  include ContactsHelper
end
