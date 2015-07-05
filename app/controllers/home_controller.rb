class HomeController < ApplicationController

	def index
		@homeposts = Post.all
	end
end
