
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
	
	//city selection popup
	$("#triangle").hide();
	$("#cityFee").hide();
	//good to here
	$("select[name='order[city]']").change(function() {
		$(this).focus();
		$("#triangle").hide();
		$("#cityFee").hide();
		
		var val = $(this).val();
		var txt = "Please select your city";
		var pos = $("select[name='order[city]']").position();
		
		if (val == 'Boulder'){
			txt = "Delivery here is free!";
		}
		else if (val == 'Gunbarrel'){
			txt = "Extended delivery range to Gunbarrel is an additional $10";
		}
		else if (val == 'Longmont'){
			txt = "Extended delivery range to Longmont is an additional $15";
		}
		else if (val == 'Louisville'){
			txt = "Extended delivery range to Louisville is an additional $15";
		}
		else if (val == 'Superior'){
			txt = "Extended delivery range to Superior is an additional $15";
		}
		else if (val == 'N/A'){
			txt = "Extended delivery outside of Boulder (proper) is an additional $15";
		}
		
		//Create div popup
		$("#triangle").css({
			top: pos.top + 20 + "px",
			left: pos.left + 40 + "px"
		});
		$("#cityFee").css({
			top: pos.top + 32 + "px",
			left: pos.left + 30 + "px"
		});
		$("#cityFee").html(txt);
		
		//Show div popup
		$("#triangle").fadeIn(300, 'easeOutQuad');
		$("#cityFee").fadeIn(300, 'easeOutQuad');		
	});

	$("select[name='order[city]']").on("blur",function() {
		$("#triangle").fadeOut(800);
		$("#cityFee").fadeOut(800);
	});
});