class Contact < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name

  validates_format_of :first_name, with: /\A[\p{L}]*\z/
  validates_format_of :last_name, with: /\A[\p{L}]*\z/

  validate :either_address_or_number

  has_many :phone_numbers, dependent: :destroy
  belongs_to :address

  accepts_nested_attributes_for :address, reject_if: :all_blank
  accepts_nested_attributes_for :phone_numbers, reject_if: :all_blank

  include PgSearch
  include PgSearchScope

  def as_json(options={})
    super({only: :id}.merge(options)).tap do |json|
      json["full_name"] = "#{first_name} #{last_name}"
    end
  end

  private

  def either_address_or_number
    if phone_numbers.empty? && address.nil?
      errors.add :base, "Must enter either an address or a phone number"
    end
  end

end
