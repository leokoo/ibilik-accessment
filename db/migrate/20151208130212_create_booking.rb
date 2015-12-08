class CreateBooking < ActiveRecord::Migration
	def change
		create_table :bookings do |t|
			t.integer :length
			t.belongs_to :user, index:true 
			t.belongs_to :property, index:true 
			t.timestamps null: false			
		end
	end
end
