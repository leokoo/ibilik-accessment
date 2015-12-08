class Property < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :title,
		presence: true
# Associations
	belongs_to :user
	has_many :comments
	has_one :booking
end