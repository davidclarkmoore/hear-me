class Organization < ActiveRecord::Base
	has_many :exhibits
	belongs_to :user

	has_attached_file :image, :styles => { :medium => "800x800>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  	  accepts_nested_attributes_for :exhibits

end
