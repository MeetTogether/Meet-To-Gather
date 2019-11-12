function formatAMPM(date) {
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? 'PM' : 'AM';
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    minutes = minutes < 10 ? '0'+minutes : minutes;
    var strTime = hours + ':' + minutes + ' ' + ampm;
    return strTime;
}            


function insertChat(who, text, time){
    if (time === undefined){
        time = 0;
    }
    var control ;
    var date = formatAMPM(new Date());
    console.log(who);
    var me = document.getElementById("me").value;
    console.log(me);
    if (who == me){
        
        control = 
        	"<div class='container darker'>" +
        		"<img src='/MeetTogether/getImage?type=member&id="+ who +"' alt='Avatar' class='right'>" +
        		"<p>" + text +"</p>" +
        		"<span class='time-right'>"+ time +"</span>" + 
			"</div>";             
    }else{
        control = 
        	"<div class='container'>" +
    		"<img src='/MeetTogether/getImage?type=member&id="+ who +"' alt='Avatar'>" +
				"<p>" + text +"</p>" +
				"<span class='time-left'>" + time + "</span>" + 
			"</div>";         
    }
    
    document.getElementById("txt").innerHTML += control;
    
}