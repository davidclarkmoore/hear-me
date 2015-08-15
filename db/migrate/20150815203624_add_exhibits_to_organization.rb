class AddExhibitsToOrganization < ActiveRecord::Migration
  def change
    add_reference :organizations, :exhibit, index: true, foreign_key: true
  end
end
