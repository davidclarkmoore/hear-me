class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]


  # GET /posts
  # GET /posts.json
  def index

    @posts = Post.where("exhibit_id = ?", Exhibit.friendly.find(params[:exhibit_id])).order(updated_at: :desc)
    @exhibit = Exhibit.friendly.find(params[:exhibit_id])

    render :layout => 'admin' 
  end

  # GET /posts/1
  # GET /posts/1.json
  def show

     @post = Post.find(params[:id])
     post = Post.find(params[:id])
     @exhibit = Exhibit.friendly.find(Post.find(post.id).exhibit_id)
    @organization = Organization.find(@exhibit.organization_id)
    @postimages = Image.where(post_id: (params[:id]))
  end

  # GET /posts/new
  def new
  
    @exhibit = Exhibit.friendly.find(params[:exhibit_id])
    @post = Post.new
    @path = ([@exhibit, @post])
    3.times {@post.images.build}
  
      render :layout => 'admin' 

    # 3.times { @post.images.build } # ... and this
  end

  # GET /posts/1/edit
  def edit
    @exhibit = Post.find(params[:id]).exhibit_id
    @post = Post.find(params[:id])
    @path = (@post)
    1.times {@post.images.build}

    render :layout => 'admin' 
    # 3.times { @post.images.build } # ... and this

  end

  # POST /posts
  # POST /posts.json
  def create
    @exhibit = Exhibit.friendly.find(params[:exhibit_id])
    @post = @exhibit.posts.new(post_params)
    @post.user_id = current_user.id


    respond_to do |format|
      if @post.save

      # if params[:photos]
      #   #===== The magic is here ;)
      #   params[:photos].each { |photo|
      #     @post.images.create(image: photo)
      #   }
      # end

        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update

    @exhibit = Post.find(params[:id]).exhibit_id
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update(post_params)

      #   if params[:photos]
      #   #===== The magic is here ;)
      #   params[:photos].each { |photo|
      #     @post.images.create(image: photo)
      #   }
      # end


        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @exhibit = Post.find(params[:id]).exhibit_id
    @post.destroy
    respond_to do |format|
      format.html { redirect_to exhibit_posts_path(@exhibit), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :exhibit_id, :post_id, :published, images_attributes: [:photo, :id])
    end
end
