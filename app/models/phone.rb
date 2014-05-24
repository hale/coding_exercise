class Phone < ActiveRecord::Base
  validates_presence_of :number
  validates_format_of :number, with: /\A[\d]{3}-[\d]{3}-[\d]{4}\z/
end
