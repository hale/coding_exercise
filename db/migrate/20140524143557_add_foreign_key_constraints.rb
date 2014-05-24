class AddForeignKeyConstraints < ActiveRecord::Migration
  def change
    add_foreign_key "contacts", "addresses"
    add_foreign_key "phone_numbers", "contacts", dependent: :delete
  end
end
