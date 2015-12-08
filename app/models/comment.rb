class Comment < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :reply,
		presence: true

# Associations
	belongs_to :user
	belongs_to :property
end