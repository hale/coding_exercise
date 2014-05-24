module ContactsHelper
  def setup_contact(contact)
    contact.address ||= Address.new
    3.times { contact.phone_numbers.build }
    contact
  end
end
