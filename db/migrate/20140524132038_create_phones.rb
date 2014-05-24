class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number
      t.boolean :primary, default: false, null: false

      t.timestamps
    end
  end
end
