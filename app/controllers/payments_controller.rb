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
        end
      end
        render :nothing => true
  end
  
  def show
  end
end
