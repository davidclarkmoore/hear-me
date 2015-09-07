class AddSlugToExhibits < ActiveRecord::Migration
  def change
    add_column :exhibits, :slug, :string
  end
end
