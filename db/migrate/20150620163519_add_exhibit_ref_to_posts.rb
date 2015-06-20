class AddExhibitRefToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :exhibit, index: true, foreign_key: true
  end
end
