require 'bcrypt'

class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	# users.password_hash in the database is a :string include BCrypt
	has_secure_password

	validates :email, 
		uniqueness: true,
		format: { :with => /\w+(.)*\w+@\w+(.)*\w+/}
	validates :password, length: { minimum: 4 }
	
	def self.authenticate(email, password)
		# puts email
		User.find_by(email: email).try(:authenticate, password)

	has_many :properties
	end
end
