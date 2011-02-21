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

  def agradecimento(para)
    recipients para
    from "Email de Resposta<resposta@vanessaefabiano.com.br>"#Email configurado no SMTP
    subject "Agradecimento"
    body :agradecimento => "Obrigado!"
  end


  def pedido(para,mensagem) #E-mail enviado para os noivos
    recipients para
    from "Email de Resposta<resposta@vanessaefabiano.com.br>"#Email configurado no SMTP
    subject "Presentes"
    body :pedido => mensagem
  end

  
  def confpresenca(para,mensagem)
    recipients para
    from "Email de Resposta<resposta@vanessaefabiano.com.br>"#Email configurado no SMTP
    subject "Confirmação de Presença"
    body :confpresenca => mensagem
  end
  
  
  def presenca(para,mensagem) #E-mail enviado para os noivos
    recipients para
    from "Email de Resposta<resposta@vanessaefabiano.com.br>"#Email configurado no SMTP
    subject "Presença Confirmada"
    body :confirmacao => mensagem
  end
  
  
end
