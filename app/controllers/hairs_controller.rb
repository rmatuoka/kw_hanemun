class HairsController < ApplicationController
  before_filter :autentica, :load_box_package
  
  def index
    @hairs = @user.hairs.all
  end
  
  def show
    @hair = @user.hairs.find(params[:id])
  end
  
  def new
    @hair = @user.hairs.build
  end
  
  def create
    @hair = @user.hairs.create(params[:hair])
    if @hair.save
      flash[:notice] = "Successfully created hair."
      redirect_to hairs_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @hair = @user.hairs.find(params[:id])
  end
  
  def update
    @hair = @user.hairs.find(params[:id])
    if @hair.update_attributes(params[:hair])
      flash[:notice] = "Successfully updated hair."
      redirect_to hairs_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @hair = Hair.find(params[:id])
    @hair.destroy
    flash[:notice] = "Successfully destroyed hair."
    redirect_to hairs_url
  end
end
