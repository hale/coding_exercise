class Address < ActiveRecord::Base
  validates_format_of :line_1, with: /\A[\p{L}\d ]*\z/
  validates_format_of :line_2, with: /\A[\p{L}\d ]*\z/
end
