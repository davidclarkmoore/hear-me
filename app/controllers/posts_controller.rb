class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.where("exhibit_id = ?", Exhibit.find(params[:exhibit_id]))
    @exhibit = Exhibit.find(params[:exhibit_id])
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @exhibit = Post.find(params[:id]).exhibit_id
     @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @exhibit = Exhibit.find(params[:exhibit_id])
    @post = Post.new
    @path = ([@exhibit, @exhibit.posts.build])
  end

  # GET /posts/1/edit
  def edit
    @exhibit = Post.find(params[:id]).exhibit_id
     @post = Post.find(params[:id])
    @path = (@post)

  end

  # POST /posts
  # POST /posts.json
  def create
    @exhibit = Exhibit.find(params[:exhibit_id])
    @post = @exhibit.posts.create(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
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
    @post.update(post_params)

    respond_to do |format|
      if @post.update(post_params)
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
      params.require(:post).permit(:title, :description, :exhibit_id, :post_id, :image)
    end
end
