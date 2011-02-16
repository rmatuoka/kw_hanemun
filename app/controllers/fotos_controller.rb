class FotosController < ApplicationController
  before_filter :autentica, :load_album, :load_box_package, :except => ["ajax", "remover"]
  
  layout "blank", :except => "new"
  def show
    
  end
  
  def new
    @foto = @album.fotos.build
  end
  
  def create
    @foto = @album.fotos.create(params[:foto])
    if @foto.save
       flash[:notice] = "Successfully updated poll question."
       redirect_to album_path(@album)
    else
      render :action => 'new'
    end
  end
  
  def ajax
    if !params[:id_foto].blank?
      @foto = Foto.first(:conditions =>['id = ?', params[:id_foto]])
    end
  end
  
  def load_album
    @album = Album.find(params[:album_id])
  end
  
  def remover
    if !params[:id_foto].blank?
      foto = Foto.first(:conditions =>['id = ?', params[:id_foto]])
      
      if foto
        foto.destroy
        @out = "AHU"
      end
    end
  end
    
    
end
