class ImagesController < ApplicationController

  def destroy
  	@post = Post.find(Image.find(params[:id]).post_id)
    @image = Image.find(params[:id])
    @image.destroy

    redirect_to edit_post_path(@post)
  end
end
