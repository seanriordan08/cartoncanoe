﻿function updateClock(){

var currentTime = new Date ();
var currentHours = currentTime.getHours ();
var currentMinutes = currentTime.getMinutes ();
var currentSeconds = currentTime.getSeconds ();

//Calculate Hours Postition
var currentHoursPosition = 0;
if ( currentHours > 0 && currentHours < 13){
	if (currentHours < 8 ){ 
		currentHoursPosition = 0;
		$("#counterBG1").css( "color", "#990000");
	}
	else if ( currentHours === 8 ){ 
		currentHoursPosition = 0;
	}
	else if (currentHours === 9 ){ 
		currentHoursPosition = 0;//30
		$("#counterBG1").css( "color", "#990000");
	}
	else if (currentHours === 10 ){ 
		currentHoursPosition = 0;//65
		$("#counterBG1").css( "color", "#990000");
	}
	else if (currentHours === 11 ){ 
		currentHoursPosition = 0;//98
	}
	else if (currentHours === 12 ){ 
		currentHoursPosition = 0;//132
	}
	else { 
		currentHoursPosition = 0;
		$("#counterBG1").css( "color", "#990000");
	}
}
else { 
	currentHoursPosition = 0;//166
	$("#counterBG1").css( "color", "#666666");
}

//Calculate Minutes Postition
var currentMinutesPosition = 0;
if ( currentHours > 8 && currentHours < 12){
	currentMinutesPosition = Math.round( parseInt(currentMinutes) / 2); 
}
else{
	currentMinutesPosition = 0;
}

var updatedValue = 0;
var position = 0;
var updatedValue = String(parseInt(currentHoursPosition) + parseInt(currentMinutesPosition));

var position = updatedValue + "px";
$("#counterNeedle").css(  "top",  position);	 
}

$(document).ready(function(){
	setInterval('updateClock()', 1000);
});