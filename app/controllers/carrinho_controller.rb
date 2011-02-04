class CarrinhoController < ApplicationController
  before_filter :autentica, :load_box_package
  layout "application", :except => [:adicionar, :remover]
  
  def index
    
  end
  
  def create
    #GRAVAR TRANSACAO NO BANCO , OS ITENS COMPRADOS ESTAO GRAVADOS NO CARRINHO
    #VERIFICA SE EXISTE A TRANSACAO
    transaction = Transaction.new
    transaction.user_id = @user.id
    transaction.user_id = @user.id
    transaction.session_id = request.session_options[:id]
    transaction.email = params[:email]
    transaction.nome = params[:nome]
    transaction.status = "INCOMPLETO"
    
    if !transaction.save
      #erro
      flash[:notice] = "Erro ao gravar transação"
    else
      #GERAR PEDIDO
      @order = PagSeguro::Order.new(transaction.id)
      #PEGA ITENS DO CARRINHO E ADICIONA AO PEDIDO E FINALIZA
      cart = Cart.all(:conditions => ['session_id = ? AND finalizado = 0', request.session_options[:id]])
      cart.each do |c|
        c.finalizado = 1
        c.save
        q = Quote.find(c.quote_id)
        @order.add :id => c.quote_id, :price => q.valor, :description => q.descricao
      end
    end    
  end
  
  def adicionar
    if !params[:quote_id].blank?
      #verifica se existe o item no carrinho
      carts = Cart.first(:conditions => ['session_id = ? AND quote_id = ? AND finalizado = 0', request.session_options[:id], params[:quote_id]] )
      
      if !carts
        #ADICIONA ITEM NO BANCO
        item = Cart.new
        item.session_id = request.session_options[:id]
        item.quote_id = params[:quote_id]
        
        if !item.save
          #erro
          flash[:notice] = "Erro ao salvar item no carrinho. Contate o adminstrador do site"
        end
      end
    end
    
    gera_carrinho
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
