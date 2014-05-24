class AddContactRefToPhoneNumbers < ActiveRecord::Migration
  def change
    add_reference :phone_numbers, :contact, index: true, null: false
  end
end
