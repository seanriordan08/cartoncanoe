var feeSelected = 0;
var feeFlag = 0; //thrown to ensure only one instance
var prevSelection = 0; //thrown to track & remove last instance
var cartCoverFlag = 0; //track if order form is in focus

//Phone form mask
function maskPhone(){
	$("#order_phone_number").mask("(999) 999-9999",{placeholder:" "});
};
/*End Phone form mask*/

//Terms of Service
function termsBoxInfo(){
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

//Cart Review
function cartReview(){
	$('#cartReview').dialog({
		autoOpen: true,
		show: 800,
		modal: true,
		title:  "Order Review",
		minWidth: 800,
		buttons: [{
			text: "Back to Details",
			click: function() {
			  $( this ).dialog( "close" );
			}
		}]
	});
};
/*End Cart Review*/

//Set order flag for cartCover
function setCover(){
	cartCoverFlag = 1;
};

//Clear order flag for cartCover
function clearCover(){
	cartCoverFlag = 0;
};

//Order flag for cartCover
function cartCover(){
	if (cartCoverFlag == 1){
		$('#cartCover').show();
	}
	else{
		$('#cartCover').hide();
	}
};
//Send Order to Store
function purchase(){
	$.ajax({
		type: "POST",
		url: '/orders',
		beforeSend: function(xhr){
			xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
		data: {remote: true},
		dataType: "script"
	});
};

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
			feeSelected = 0; //name of object description attribute
		}
		else if (val == 'Gunbarrel'){
			txt = "Extended delivery range to Gunbarrel is an additional $10";
			feeSelected = 80; //name of object description attribute
		}
		else if (val == 'Longmont'){
			txt = "Extended delivery range to Longmont is an additional $15";
			feeSelected = 81; //name of object description attribute
		}
		else if (val == 'Louisville'){
			txt = "Extended delivery range to Louisville is an additional $15";
			feeSelected = 81;
		}
		else if (val == 'Superior'){
			txt = "Extended delivery range to Superior is an additional $15";
			feeSelected = 81;
		}
		else if (val == 'N/A'){
			txt = "Extended delivery outside of Boulder (proper) is an additional $15";
			feeSelected = 81;
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
	$("select[name='order[city]']").focusout(function(event){ //function run 2x (reason unknown)
		if ((feeSelected == 0 || prevSelection == 80 || prevSelection == 81) && (feeFlag > 0)){//remove the previously added line_item
			$.ajax({
				type: "DELETE",
				url: '/line_items',
				beforeSend: function(xhr){
					xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
				data: {ajax_id: 1, remote: true},
				dataType: "script"
			});
		}
		prevSelection = feeSelected;
		if (feeSelected == 80 || feeSelected == 81){
			$.ajax({
				type: "POST",
				url: '/line_items',
				beforeSend: function(xhr){
					xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
				data: {product_id: feeSelected, remote: true},
				dataType: "script"
			});
		}
		feeFlag++;
		$("#triangle").fadeOut(800);
		$("#cityFee").fadeOut(800);
		
		setCover();
		cartCover();		
		return false(event);
	});
	
});
