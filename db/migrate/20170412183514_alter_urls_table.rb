class AlterUrlsTable < ActiveRecord::Migration
	def change
		change_table :urls do |t|
			add_column :urls, :click_count, :integer
		end
	end
end
