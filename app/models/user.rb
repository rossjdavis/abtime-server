class User < ApplicationRecord
  has_secure_password

  validates_presence_of :username, :password_digest
  validates :username, uniqueness: true

  has_many :logs

  def self.from_token_request request
    username = request.params["auth"] && request.params["auth"]["username"]
    self.find_by username: username
  end
end
