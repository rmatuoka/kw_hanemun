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