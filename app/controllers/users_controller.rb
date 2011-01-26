class UsersController < ApplicationController  
  layout "login"
  uses_tiny_mce
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created user."
      
      #CRIA INFOS
      infos = @user.infos.build
      infos.data_cerimonia = Date.today
      infos.local_cerimonia = "INDEFINIDO"
      infos.data_festa = Date.today
      infos.local_festa = "INDEFINIDO"
      infos.save
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end
end
