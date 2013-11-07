var prodvarid;
var prodvarbrand;
var qtySelected = 1;

/*End Navigation Buttons*/
function doStore(){
	window.location.href='/store/index'; //go to store/index
	$("#side").css("display", "block");
	$("#clock").css("display", "block");
};
function doLandingPage(){
	$("#side").css("display", "none");
	$("#clock").css("display", "none");
};

//Draggable Items Function
$(document).ready(function(){

	$('#storeItemZoom').hide();
	$('#itemBoxZoom').hide();
	$('.btnQty').hide();
	$("#spinner[data-id='" + prodvarid + "']").hide();
	$(".btnQty[data-id='" + prodvarid + "'] label").hide();

	//Rollover Magnify
	$('.entry').mouseover(function(){
		prodvarid = $(this).data('id');
		prodvarbrand = $(this).data('brand');
		//$("#spinner[data-id='" + prodvarid + "']").spinner();
		
		$("#itemBoxZoom[data-id='" + prodvarid + "']").dialog({
			autoOpen: false,
			show: 400,
			modal: true,
			title:  prodvarbrand,
			minWidth: 800,
			close: function(event, ui){
				$(this).dialog("close");
			},
			buttons: [{
				text: "Add to Cart",
				click: function() {
					qtySelected = $("#quantity[data-id='" + prodvarid + "'] input").val();//inputValue check
					$.ajax({
						type: "POST",
						url: '/line_items',
						beforeSend: function(xhr){
							xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
						data: {product_id: prodvarid, qty_selected: qtySelected, remote: true},
						dataType: "script"
					});
					$("#quantity[data-id='" + prodvarid + "'] input").val(1); //reset default value on submit
					$(this).dialog("close");
				}
			}]
		});
	});
	
	$('.itemMagnify').click(function(){
		$("#itemBoxZoom[data-id='" + prodvarid + "']").dialog('open');
		var qty1 = $(".btnQty[data-id='" + prodvarid + "'] input").spinner();
		var lab1 = $(".btnQty[data-id='" + prodvarid + "'] label");
		$(qty1).prependTo($('.ui-dialog-buttonset'));
		$(lab1).prependTo($('.ui-dialog-buttonset'));
	});
	/*End Rollover Magnify*/

	//Drag & Drop Feature
	$('.entry').draggable({
		revert: false,
		containment: 'document', 
		zIndex: 100, 
		helper: "clone",
		start: function(e, ui){
			prodvarid = $(this).data('id');
		},
	});
	
	$('#cart').droppable({
		accept: '.entry',
		activeClass: 'active',
		hoverClass: 'hovered',
		drop: function( event, ui ){
			$.ajax({
				type: "POST",
				url: '/line_items',
				beforeSend: function(xhr){
					xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
				data: {product_id: prodvarid, remote: true},
				dataType: "script"
			});
		}
	});
	/*End Drag & Drop Feature*/
	
	/*
	//Effects
	function menuSlide(){
		$('#side').animate("slide",1000,'easeOutExpo');
	};

	//Warnings
	function emailWarningHide(){
		$('#emailWarning').hide();
	};*/
});