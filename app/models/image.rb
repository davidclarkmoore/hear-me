class Image < ActiveRecord::Base
	belongs_to :post

	has_attached_file :photo, :styles => { :large => "1500x1500>", :medium => "800x800>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
