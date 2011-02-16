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
	window.location="/carrinho";
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
	window.location="/carrinho";
}

function mostra_cota(x)
{
	if($("#Lista_compra" + x).hasClass('hide'))
	{
		//MOSTRA
		$("#Lista_compra" + x).slideDown('slow');
		$("#Lista_compra" + x).removeClass('hide')
	}
	else
	{
		//ESCONDE\
		$("#Lista_compra" + x).slideUp('slow');
		$("#Lista_compra" + x).addClass('hide')
	}
}

function show_descricao(descricao)
{
	$("#PopPacotes").html(descricao)
	$('#PopPacotes').attr("style", "top:"+  +"px; left:"+  +";px");
	$("#PopPacotes").fadeIn()
}

function hide_descricao()
{
	$("#PopPacotes").fadeOut()
	$("#PopPacotes").hide()
}

jQuery(document).ready(function(){

	$(".Titulo4").mouseover(function(e){
		$("#PopPacotes").html($(this).attr("title"))
		var top = e.pageY - 50
		$('#PopPacotes').attr("style", "top:"+ top +"px; left:"+ e.pageX +"px;");
	    $("#PopPacotes").fadeIn()
	});
	
	$(".Titulo4").mouseout(function(e){
	    $("#PopPacotes").fadeOut()
	});
})