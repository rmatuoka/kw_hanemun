class Email < ActionMailer::Base
  #Se precisar os parametros sao
  #Email.deliver_padrao(corpo, "Assunto", email para
  #enviar(destino), email para resposta)
  
#  def padrao(corpo, assunto, email = 
#    "bsilva@korewa.com.br", responder =
#    "silva_v_bruno@hotmail.com")
#  recipiets email
#  from "Email de Teste<bsilva@korewa.com.br>"
#  subject assunto
#  reply_to responder
#  body :corpo => corpo
#  end


  def enviar(para, de, assunto, mensagem)
  recipients para
  from de
  subject assunto
  body mensagem
  end
end
