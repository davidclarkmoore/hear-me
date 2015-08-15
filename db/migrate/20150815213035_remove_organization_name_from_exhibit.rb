class RemoveOrganizationNameFromExhibit < ActiveRecord::Migration
	def change
		remove_column :exhibits, :organization_name, :string
	end
end
