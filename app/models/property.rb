class Property < ApplicationRecord
  has_many :applications, foreign_key: :property_id, dependent: :delete_all
  belongs_to :user, optional: true
  validates :name, presence: true
  validates :property_type, presence: true
  validates :number_of_units, presence: true
  validates :agent, presence: true
  validates :number_of_rooms, presence: true
  validates :number_of_bathrooms, presence: true
  validates :address, presence: true
  validates :size, presence: true
  validates :terms_available, presence: true
  validates :earliest_start_date, presence: true
  validates :application_fee, presence: true
  validates :monthly_rent, presence: true
end
