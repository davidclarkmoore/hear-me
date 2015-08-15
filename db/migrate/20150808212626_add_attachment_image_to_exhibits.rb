class AddAttachmentImageToExhibits < ActiveRecord::Migration
  def self.up
    change_table :exhibits do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :exhibits, :image
  end
end
