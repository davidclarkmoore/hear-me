class AdminController < ApplicationController

  layout 'admin'

  def index

    @organizations = Organization.all
    @exhibits = Exhibit.all
    @users = User.all
    
  end

  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  

end
