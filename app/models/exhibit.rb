class Exhibit < ActiveRecord::Base
	has_many :posts
	belongs_to :user
	belongs_to :organization

	has_attached_file :image, :styles => { :medium => "800x800>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	extend FriendlyId
		friendly_id :name, use: :slugged

end
