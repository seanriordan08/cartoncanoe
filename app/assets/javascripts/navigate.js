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

$(document).ready(function(){
	//End Navigation Buttons
	
	$('.entry').draggable({ 
		revert: true , 
		containment: "document", 
		zIndex: 100, 
		helper: "clone"
	});
	
	$('#cart').droppable({
		accept: '.entry',
		activeClass: 'active',
		hoverClass: 'hovered',
		drop: function( event, ui ){
			var testable = "<%= escape_javascript(line_items_path)%>";
			alert(testable);
			//$.ajax({ url: "<%= line_items_path %>", data: {:product_id => product} })
		}
	});
	
	//("<%= escape_javascript(if @cart != nil render(@cart) end)%>");
	
	

	//Effects
	function menuSlide(){
		$('#side').animate("slide",1000,'easeOutExpo');
	};

	//Warnings
	function emailWarningHide(){
		$('#emailWarning').hide();
	};

});