class AlbumsController < ApplicationController
  before_filter :autentica, :load_box_package
  
  def index
    @albums = @user.albums.paginate :all, :page=> params[:page], :per_page => 3
    @total_de_albums = @user.albums.all.count
  end
  
  def new
    @album = @user.albums.build
  end
  
  def show
    @album = @user.albums.find(params[:id])
    @fotos = @album.fotos.all
    @total_de_fotos = @album.fotos.all.count
  end
  
  def create
    @album = @user.albums.create(params[:album])
    if @album.save
       flash[:notice] = "Successfully updated poll question."
       redirect_to albums_path
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    flash[:notice] = "Album excluído com sucesso."
    redirect_to albums_url
  end
end
