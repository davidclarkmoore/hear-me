class AddUserRefToExhibit < ActiveRecord::Migration
  def change
    add_reference :exhibits, :user, index: true, foreign_key: true
  end
end
