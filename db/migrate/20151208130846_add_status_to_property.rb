class AddStatusToProperty < ActiveRecord::Migration
	def change
		add_column :properties, :status, :boolean, default: true
	end
end
