class PaymentsController < ApplicationController
  before_filter :autentica, :load_box_package
  skip_before_filter :verify_authenticity_token
  
  def efetuado
    return unless request.post?
      pagseguro_notification do |notification|
        if notification.valid?(:force)
          transaction = Transaction.find(notification.order_id)
          transaction.tipo_pagamento = notification.payment_method
          transaction.status = notification.status
          transaction.save
          
          if transaction.status.to_s.include? 'completed'
            Email.deliver_enviar(transaction.email, "site@fasterm.com.br", "Teste do envio", "<b>Nome:</b>#{transaction.nome}")
          end
          
          #SETA QUOTES COMO INDIPONIVEL
          carts = Cart.all(:conditions => ['session_id = ?', transaction.session_id])
          carts.each do |c|
            q = Quote.find(c.quote_id)
            q.indisponivel = true
            #q.save
          end
        end
      end
        render :nothing => true
  end
  
  def show
    
  end
end
