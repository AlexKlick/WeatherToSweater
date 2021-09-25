class User < ApplicationRecord
  validates :email, :api_key, presence: true, uniqueness: true
  validates :password, presence: true
  has_secure_password
end
