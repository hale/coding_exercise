class PhoneNumber < ActiveRecord::Base
  validates_presence_of :number
  validates_format_of :number, with: /\A[\d]{3}-[\d]{3}-[\d]{4}\z/

  belongs_to :contact

  before_save :make_primary_if_first
  after_destroy :promote_another_if_primary

  include PgSearch
  include PgSearchScope

  private

  def make_primary_if_first
    self.primary = true unless contact.phone_numbers.any?
  end

  def promote_another_if_primary
    if contact && contact.phone_numbers.any? && contact.phone_numbers.where(primary: true).blank?
      contact.phone_numbers.first.update_attribute(:primary, true)
    end
  end
end
