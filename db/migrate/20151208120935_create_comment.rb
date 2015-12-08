class CreateComment < ActiveRecord::Migration
	def change
		create_table :comments do |t|
			t.string :reply
			t.belongs_to :user, index:true 
			t.belongs_to :property, index:true 
			t.timestamps null: false			
		end
	end
end
