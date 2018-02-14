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
    @user ||= User.find(decoded_auth_token[:user]) if decoded_auth_token
    @user ||= errors.add(:token, 'Invalid Token') && nil
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(authorization_head)
  end

  def authorization_head
    puts headers['Authorization']
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      puts 'token missing'
      errors.add(:token, 'Missing Token')
    end
    nil
  end
end
