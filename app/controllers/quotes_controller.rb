class QuotesController < ApplicationController
  before_filter :autentica, :load_package, :load_box_package
  def index
    @quotes = @package.quotes.all
  end
  
  def show
    @quote = @package.quotes.find(params[:id])
  end
  
  def new
    @quote = @package.quotes.new
  end
  
  def create
    @quote = @package.quotes.create(params[:quote])
    if @quote.save
      flash[:notice] = "Successfully created quote."
      redirect_to package_quotes_path(@package)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @quote = @package.quotes.find(params[:id])
  end
  
  def update
    @quote = @package.quotes.find(params[:id])
    if @quote.update_attributes(params[:quote])
      flash[:notice] = "Successfully updated quote."
      redirect_to package_quotes_path(@package)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
    flash[:notice] = "Successfully destroyed quote."
    redirect_to quotes_url
  end
  
  def load_package
    @package = Package.find(params[:package_id])
  end
end
