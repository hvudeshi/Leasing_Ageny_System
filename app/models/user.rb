class User < ApplicationRecord
  has_secure_password
  has_many :properties, foreign_key: :agent, dependent: :nullify
  has_many :properties, foreign_key: :occupied_by, dependent: :nullify
  has_many :applications, foreign_key: :applicant_id,dependent: :delete_all
  validates :email_address, presence: true, uniqueness: true
  validates :name, presence: true
  validates :phone_number, presence: true
end
