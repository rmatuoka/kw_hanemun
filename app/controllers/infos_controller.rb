class InfosController < ApplicationController
  before_filter :autentica, :load_box_package
  def show
    @info = @user.infos.find(params[:id])
  end
  
  def edit
    @info = @user.infos.find(params[:id])
  end
  
  def update
    @info = @user.infos.find(params[:id])
    if @info.update_attributes(params[:info])
      flash[:notice] = "Successfully updated info."
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end
end
