class CarrinhoController < ApplicationController
  before_filter :autentica, :load_box_package 
  layout "application", :except => [:remover]#:adicionar, 
  
  def index
    @total = 0
    @cart.each do |c|
      q = Quote.find(c.quote_id)
      @total += q.valor
    end
  end
  
  def new
    
  end
  
  def create
       
  end
  
  def adicionar
    if !params[:id].blank?
      #verifica se existe o item no carrinho
      carts = Cart.first(:conditions => ['session_id = ? AND quote_id = ? AND finalizado = 0', request.session_options[:id], params[:id]] )
      
      if !carts
        #ADICIONA ITEM NO BANCO
        item = Cart.new
        item.session_id = request.session_options[:id]
        item.quote_id = params[:id]
        
        if !item.save
          #erro
          flash[:notice] = "Erro ao salvar item no carrinho. Contate o adminstrador do site"
        end
      end
    end    
   # gera_carrinho
   redirect_to carrinho_path
  end
  
  def remover
    if !params[:quote_id].blank?
      #verifica se existe o item no carrinho
      carts = Cart.first(:conditions => ['session_id = ? AND quote_id = ? AND finalizado = 0', request.session_options[:id], params[:quote_id]] )
      
      if carts
        carts.destroy
      end
    end
    
    gera_carrinho
  end
  
  def excluir
    if !params[:id].blank?
      #verifica se existe o item no carrinho
      carts = Cart.first(:conditions => ['session_id = ? AND quote_id = ? AND finalizado = 0', request.session_options[:id], params[:id]] )
      
      if carts
        carts.destroy
      end
    end
    
    redirect_to carrinho_path
  end
  
  def gera_carrinho
    @out = ""
    cart = Cart.all(:conditions => ['session_id = ? AND finalizado = 0', request.session_options[:id]])
    cart.each do |c|
      q = Quote.find(c.quote_id)
      @out += "<div class='Boxmeucarrinho'>"
    	@out += 	"<h1 class='Titulo6'>" + q.nome
    	@out += 	"</h1><h1 class='Titulo5'>R$ "+ q.valor.to_s
    	@out +=  "</h1>"
    	@out += "<a href='javascript:remove_carrinho(" + q.id.to_s
    	@out += ")'><img alt='Trans' class='botao_carrinho_pacote' src='/images/trans.gif' /></a>"
    	@out += "</div>"
    end
    
    if cart.blank?
      @out = ""
      @out += "<div id='Boxnaohaitems'>"
    	@out += 	"<h1 class='Titulo5' style='margin:0px 0 0 18px;'>Não há items</h1>"
    	@out += "</div>"
    end
  end
  
  def finalizar
  end
end
