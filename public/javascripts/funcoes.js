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