class AuthorizeRequest
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  private

  attr_reader :headers

  def user
    @user ||= User.find(auth_token[:user_id]) if auth_token
    @user || errors.add(:auth, 'Invalid Token') && nil
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  def http_token
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else errors.add(:auth, 'Missing Token')
    end
    nil
  end
end
