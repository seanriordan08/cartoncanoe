function updateClock()
     {
     var currentTime = new Date ();
     var currentHours = currentTime.getHours ();
     var currentMinutes = currentTime.getMinutes ();
     var currentSeconds = currentTime.getSeconds ();
	 
	 //Calculate Hours Postition
	var currentHoursPosition = 17;
	if ( 0 < currentHours < 13){
		if (currentHours <= 6 ){ currentHoursPosition = 17;}
		else if (currentHours == 7 ){ currentHoursPosition = 15; }
		else if (currentHours == 8 ){ currentHoursPosition = 30; }
		else if (currentHours == 9 ){ currentHoursPosition = 65; }
		else if (currentHours == 10 ){ 
			currentHoursPosition = 98;  
			alert("check");
		}
		else if (currentHours == 11 ){ currentHoursPosition = 132; }
		else if (currentHours == 12 ){ currentHoursPosition = 166; }
		else { currentHoursPosition = 17; }
	}
	else { 
		currentHoursPosition = 166;
		$("#counterBG1").css( "color", "#666666");
	}
	 
	 /*Calculate Minutes Postition
	var currentMinutesPosition = Math.round(currentMinutes / 2);
	if ( 0 < currentHours < 7 ){ currentMinutesPosition = 0; }
	else if (currentHours < 7){ currentMinutesPosition = currentMinutesPosition; }
	else if (currentHours > 11){ currentMinutesPosition = 0; }  */
	 
	 var updatedValue = 0;
	 var position = 0;
	 var updatedValue = currentHoursPosition;
	 var position = updatedValue + "px";
	 
     $("#counterNeedle").css(  "top",  position);
         
  }

 $(document).ready(function()
{
    setInterval('updateClock()', 1000);
});