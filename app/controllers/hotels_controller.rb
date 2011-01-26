class HotelsController < ApplicationController
  before_filter :autentica, :load_box_package
  
  def index
    @hotels = @user.hotels.all
  end
  
  def new
    @hotel = @user.hotels.new
  end
  
  def create
    @hotel = @user.hotels.create(params[:hotel])
    if @hotel.update_attributes(params[:scrapbook])
      flash[:notice] = "Successfully updated hotel."
      redirect_to hotels_path
    else
      render :action => 'edit'
    end
  end
  
  def edit
    @hotel = @user.hotels.find(params[:id])
  end
  
  def update
    @hotel = @user.hotels.find(params[:id])
    if @hotel.update_attributes(params[:scrapbook])
      flash[:notice] = "Successfully updated hotel."
      redirect_to hotels_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
    flash[:notice] = "Hotel excluído com sucesso."
    redirect_to hotels_url
  end
end
