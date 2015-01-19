require 'bcrypt'
class User

  include DataMapper::Resource

  property :id, Serial
	property :email, String, :unique => true, :message => "This email is already taken"
	property :password_digest, Text
  property :username, String, :unique => true, :message => "This username is already taken"

	attr_reader :password
	attr_accessor :password_confirmation
	validates_confirmation_of :password, :message => "Sorry, your passwords don't match"
	validates_uniqueness_of :email
  # validates_uniqueness_of :username

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, username, password)
    user = first(:email => email, :username => username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
  
end