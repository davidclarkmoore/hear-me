class ExhibitsController < ApplicationController
  before_action :set_exhibit, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  # GET /exhibits
  # GET /exhibits.json
  def index
    @exhibits = Exhibit.all
  end

  # GET /exhibits/1
  # GET /exhibits/1.json
  def show

    @exhibit = Exhibit.friendly.find(params[:id])
    @exposts = @exhibit.posts.where(published: "true")
    @organization = Organization.find(@exhibit.organization_id)  
    render :layout => 'application' 

  end

  # GET /exhibits/new
  def new
    @exhibit = Exhibit.new
  end

  # GET /exhibits/1/edit
  def edit
  end

  # POST /exhibits
  # POST /exhibits.json
  def create
    @exhibit = Exhibit.new(exhibit_params)
    @exhibit.user_id = current_user.id

    respond_to do |format|
      if @exhibit.save
        format.html { redirect_to @exhibit, notice: 'Exhibit was successfully created.' }
        format.json { render :show, status: :created, location: @exhibit }
      else
        format.html { render :new }
        format.json { render json: @exhibit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exhibits/1
  # PATCH/PUT /exhibits/1.json
  def update
    respond_to do |format|
      if @exhibit.update(exhibit_params)
        format.html { redirect_to @exhibit, notice: 'Exhibit was successfully updated.' }
        format.json { render :show, status: :ok, location: @exhibit }
      else
        format.html { render :edit }
        format.json { render json: @exhibit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exhibits/1
  # DELETE /exhibits/1.json
  def destroy
    @exhibit.destroy
    respond_to do |format|
      format.html { redirect_to exhibits_url, notice: 'Exhibit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def regenerate_slug

    @exhibittoregen = Exhibit.find(params[:id])
    @exhibittoregen.slug = nil
    @exhibittoregen.save!

    redirect_to edit_exhibit_path(@exhibittoregen)

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exhibit
      @exhibit = Exhibit.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exhibit_params
      params.require(:exhibit).permit(:name, :description, :image, :organization_id, :user_id, :slug)
    end
end
