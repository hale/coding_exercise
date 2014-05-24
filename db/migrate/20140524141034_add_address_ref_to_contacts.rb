class AddAddressRefToContacts < ActiveRecord::Migration
  def change
    add_reference :contacts, :address, index: true
  end
end
