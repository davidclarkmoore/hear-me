class Post < ActiveRecord::Base
	belongs_to :exhibit
	belongs_to :user
	validates_presence_of :user, :exhibit
	has_many :images, :dependent => :destroy

	accepts_nested_attributes_for :images

end
