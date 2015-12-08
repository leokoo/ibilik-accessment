class CreateProperty < ActiveRecord::Migration
	def change
		create_table :properties do |t|
			t.string :title
			t.integer :price
			t.string :location
			t.belongs_to :user, index:true 
			t.timestamps null: false
		end
	end
end
