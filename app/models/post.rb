class Post < ActiveRecord::Base
	belongs_to :exhibit
	belongs_to :user
	validates_presence_of :user, :exhibit
end
