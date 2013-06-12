class RenameColumnStoryToContent < ActiveRecord::Migration
	def change
		rename_column :journals, :story, :content
	end
end
