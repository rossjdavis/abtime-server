class AuthenticateUser
  prepend SimpleCommand
  attr_accessor :username, :password

  def initialize(username, password)
    @username = username
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  def user
    user = User.find_by_username(username)
    return user if user && user.authenticate(password)

    errors.add :auth, 'Invalid Credentials'
    nil
  end
end
