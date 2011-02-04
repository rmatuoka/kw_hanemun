class TransactionsController < ApplicationController
  before_filter :autentica, :load_box_package
  def new
    
  end
  
  def create
    @transaction = Transaction.new
    #GRAVAR TRANSACAO NO BANCO , OS ITENS COMPRADOS ESTAO GRAVADOS NO CARRINHO
    #VERIFICA SE EXISTE A TRANSACAO
    @transaction.user_id = @user.id
    @transaction.session_id = request.session_options[:id]
    @transaction.email = params[:transaction][:email]
    @transaction.nome = params[:transaction][:nome]
    @transaction.status = "INCOMPLETO"
    
    if !@transaction.save
      #erro
      flash[:notice] = "Erro ao gravar transação"
    else
      #GERAR PEDIDO
      @order = PagSeguro::Order.new(@transaction.id)
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
end
