class Contact < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name

  validates_format_of :first_name, with: /\A[\p{L}]*\z/
  validates_format_of :last_name, with: /\A[\p{L}]*\z/

  has_many :phone_numbers
end
