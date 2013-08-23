var prodvarid;
var prodvarbrand;

//Index Navigation Buttons
function doHome(){
	$('html,body').animate({ scrollTop: $('html,body').offset().top}, 1500, 'easeOutExpo');
};
function doHealth(){
	$('html,body').animate({ scrollTop: $('#row1').offset().top - 80}, 1500, 'easeOutExpo');
};
function doTime(){
	$('html,body').animate({ scrollTop: $('#row2').offset().top - 80}, 1500, 'easeOutExpo');
};
function doMoney(){
	$('html,body').animate({ scrollTop: $('#row3').offset().top - 80}, 1500, 'easeOutExpo');
};
function doContact(){
	$('html,body').animate({ scrollTop: $('#row4').offset().top - 80}, 1500, 'easeOutExpo');
};
/*End Navigation Buttons*/

//Phone form mask
function maskPhone(){
	$("#order_phone_number").mask("(999) 999-9999",{placeholder:" "});
};
/*End Phone form mask*/

//Terms of Service
function showTerms(){
	$('#termsBoxInfo').dialog({
		autoOpen: true,
		show: 800,
		modal: true,
		title:  "Terms of Service",
		minWidth: 800,
		buttons: [{
			text: "Got It",
			click: function() {
			  $( this ).dialog( "close" );
			}
		}]
	});
};
/*End Terms of Service*/

//Draggable Items Function
$(document).ready(function(){
	//Rollover Maginfy
	$(function(){
		$('.entry').mouseover(function(){
			prodvarid = $(this).data('id'),
			prodvarbrand = $(this).data('brand')
		});
		
		$('.itemMagnify').click(function(){
			$('#storeItemZoom').css({"display":"block"});
			$("#itemBoxZoom[data-id='" + prodvarid + "']").dialog({
				autoOpen: true,
				show: 800,
				modal: true,
				title:  prodvarbrand,
				minWidth: 800,
				close: function(event, ui){
					$(this).dialog("destroy") //init'n removes the element, "destroy" restores element to pre init'n (fixes 'x' box).
					$('#storeItemZoom').css("display","none");
				},
				buttons: [{
					text: "Add to Cart",
					click: function() {
						$.ajax({
							type: "POST",
							url: '/line_items',
							beforeSend: function(xhr){
								xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
							data: {product_id: prodvarid, remote: true},
							dataType: "script"
						});
						$(this).dialog("destroy");
						$('#storeItemZoom').css("display","none");
					}
				}]
			});
		});
		
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
	
	//Effects
	function menuSlide(){
		$('#side').animate("slide",1000,'easeOutExpo');
	};

	//Warnings
	function emailWarningHide(){
		$('#emailWarning').hide();
	};
});