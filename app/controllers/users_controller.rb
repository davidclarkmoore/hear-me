class UsersController < ApplicationController

  layout 'admin'

	def show
		@user = User.find(params[:id])
	end

	def index 
		@users = User.all
   
	end

  def update

      @user = User.find(params[:id])
     @user.update(user_params)

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @users, notice: 'Exhibit was successfully updated.' }
        format.json { render :show, status: :ok, location: @users }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

 def destroy
    @user = User.find(params[:id])

    if @user.destroy
        redirect_to root_url, notice: "User deleted."
    end
  end

  def make_admin

    @user = User.find(params[:id])
    @user.admin = true
    @user.save

    redirect_to users_path

  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:admin)
    end

end
