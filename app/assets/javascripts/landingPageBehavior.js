
/* Index Navigation Buttons
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
};*/
/*End Navigation Buttons*/

function doStore(){
	window.location.href='/store/index'; //go to store/index
	$("#side").css("display", "block");
	$("#clock").css("display", "block");
};

$(document).ready(function() {
	/*Shrinking Header*/
	$(function(){
		$('#header-fixed').data('size','big'); //Get image size & store it in 'big'
	});

	$(window).scroll(function(){
		var $nav = $('#header-fixed');		
		if ($('body').scrollTop() > 110) {	//Set action trigger to 110px
			if ($nav.data('size') == 'big') {	//if element is it's normal size after the trigger
				$nav.data('size','small').stop().animate({	//set element to 50px
					height:'52px',
					padding:'0px 0px 0px 0px'
				}, 600);
				$(".bigLogo").toggleClass("medLogo");
			}
		} else {
			if ($nav.data('size') == 'small') {
				$nav.data('size','big').stop().animate({
					height:'160px',
					padding:'20px 0px 0px 20%'
				}, 300);
				$(".bigLogo").toggleClass("medLogo");
			}
		}
	});
	/*End Shrinking Header*/
});