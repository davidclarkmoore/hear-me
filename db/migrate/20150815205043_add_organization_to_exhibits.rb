class AddOrganizationToExhibits < ActiveRecord::Migration
  def change
    add_reference :exhibits, :organization, index: true, foreign_key: true
  end
end
