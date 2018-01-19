class User < ApplicationRecord
  validates_presence_of :username, :password_digest
  validates :username, uniqueness: true

  has_secure_password
end
