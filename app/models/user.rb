class User < ApplicationRecord
  belongs_to :organisation, optional: true
  has_many :shifts, dependent: :destroy
  has_secure_password
end
