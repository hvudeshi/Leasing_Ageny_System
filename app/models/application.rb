class Application < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :property
  # add_index :applications, [:applicant_id, :property_id], :unique => true
  validates :applicant_id, presence: true
  validates :property_id, presence: true
  validates :applied_date, presence: true
  validates :status, presence: true
end
