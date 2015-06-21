class Post < ActiveRecord::Base
	belongs_to :exhibit
	belongs_to :user
	validates_presence_of :user, :exhibit

 has_attached_file :image, :styles => { :medium => "800x800>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
