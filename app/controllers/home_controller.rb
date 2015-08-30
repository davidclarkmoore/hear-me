class HomeController < ApplicationController

	def index
		@homeposts = Post.all
		@homeexhibits = Exhibit.all
	end
end
