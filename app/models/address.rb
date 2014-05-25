class Address < ActiveRecord::Base
  validates_format_of :line_1, with: /\A[\p{L}\d ]*\z/
  validates_format_of :line_2, with: /\A[\p{L}\d ]*\z/

  validates_format_of :city, with: /\A[\p{L} ]*\z/

  validates_inclusion_of :state, in: Constants::STATES.flatten

  validates_format_of :zip_code, with: /\A[\d]{5}\z/

  has_one :contact

  include PgSearch
  pg_search_scope :search, lambda { |on, query|
    {
      against: on,
      query: query
    }
  }
end
