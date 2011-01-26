class PackagesController < ApplicationController
  before_filter :autentica, :load_box_package
  
  def index
    @packages = @user.packages.all
  end
  
  def show
    @package = @user.packages.find(params[:id])
  end
  
  def new
    @package = @user.packages.build
  end
  
  def create
    @package = @user.packages.create(params[:package])
    if @package.save
      flash[:notice] = "Successfully created package."
      redirect_to packages_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @package = @user.packages.find(params[:id])
  end
  
  def update
    @package = @user.packages.find(params[:id])
    if @package.update_attributes(params[:package])
      flash[:notice] = "Successfully updated package."
      redirect_to packages_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @package = @user.packages.find(params[:id])
    @package.destroy
    flash[:notice] = "Successfully destroyed package."
    redirect_to packages_url
  end
end
