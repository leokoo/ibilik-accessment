class Property < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :title,
		presence: true
	belongs_to :user
end