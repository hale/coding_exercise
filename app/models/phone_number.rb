class PhoneNumber < ActiveRecord::Base
  validates_presence_of :number
  validates_format_of :number, with: /\A[\d]{3}-[\d]{3}-[\d]{4}\z/

  belongs_to :contact
end
