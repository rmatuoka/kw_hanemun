function adiciona_carrinho(id)
{
	$.ajax({
		type:     "GET",
		dataType: "html",
		url:      "carrinho/adicionar",
		data:     "quote_id="+ id,
		success: function(msg){
			//alert(msg);
			$("#ajaxCarrinho").html(msg);
			//$("#formpagseguro").submit();
            //alert(msg);
		}
	});
}

function remove_carrinho(id)
{
	$.ajax({
		type:     "GET",
		dataType: "html",
		url:      "carrinho/remover",
		data:     "quote_id="+ id,
		success: function(msg){
			//alert(msg);
			$("#ajaxCarrinho").html(msg);
			//$("#formpagseguro").submit();
            //alert(msg);
		}
	});
}

function mostra_cota(x)
{
	if($("#Cotas" + x).hasClass('hide'))
	{
		//MOSTRA
		$("#Cotas" + x).slideDown('slow');
		$("#Cotas" + x).removeClass('hide')
	}
	else
	{
		//ESCONDE\
		$("#Cotas" + x).slideUp('slow');
		$("#Cotas" + x).addClass('hide')
	}
}