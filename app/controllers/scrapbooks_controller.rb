class ScrapbooksController < ApplicationController
  before_filter :autentica, :load_box_package
   
  def index
    @scrapbooks = @user.scrapbooks.all
  end
  
  def show
    @scrapbook = @user.scrapbooks.find(params[:id])
  end
  
  def new
    @scrapbook = @user.scrapbooks.build
  end
  
  def create
    @scrapbook = @user.scrapbooks.create(params[:scrapbook])
    if @scrapbook.save
      flash[:notice] = "Successfully created scrapbook."
      redirect_to mensagens_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @scrapbook = @user.scrapbooks.find(params[:id])
  end
  
  def update
    @scrapbook = @user.scrapbooks.find(params[:id])
    if @scrapbook.update_attributes(params[:scrapbook])
      flash[:notice] = "Successfully updated scrapbook."
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @scrapbook = Scrapbook.find(params[:id])
    @scrapbook.destroy
    flash[:notice] = "Successfully destroyed scrapbook."
    redirect_to root_path
  end
end
