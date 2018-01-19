class AuthUser
  prepend SimpleCommand

  def initialize(username, password)
    @username = username
    @password = password

    def call
      JsonWebToken.encode(user_id: user_id) if user
    end

    private

    attr_accessor :username, :password

    def user
      user = User.find_by_username(username)
      return user if user && user.authenticate(password)

      errors.add :user_auth, 'Invalid Username or Password'
      nil
    end
  end 
