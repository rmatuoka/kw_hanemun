class PresencasController < ApplicationController
  before_filter :autentica, :load_box_package
  
  def index
    redirect_to presencas_path
  end
  
  def new
    @presenca = @user.presencas.build
  end
  
  def create
    @presenca = @user.presencas.create(params[:presenca])
    if @presenca.save
      corpo = "
      <b>Convidado: </b>#{@presenca.convidado}<br />
      <b>Adulto(s): </b>#{@presenca.adulto}<br />
      <b>Criança(s): </b>#{@presenca.crianca}<br />
      <b>E-mail: </b>#{@presenca.email}<br />      
      <b>Telefone: </b>#{@presenca.telefone}<br />
      "
      Email.deliver_confpresenca(@presenca.email,corpo)
      Email.deliver_presenca(@user.email,corpo)
      flash[:notice] = "Successfully created scrapbook."
#      redirect_to mensagens_path
    else
      render :action => 'new'
    end

  end
end
