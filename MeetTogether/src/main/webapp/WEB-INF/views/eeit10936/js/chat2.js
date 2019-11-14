$(document).on('click', '.panel-heading span.icon_minim', function (e) {
    var $this = $(this);
    if (!$this.hasClass('panel-collapsed')) {
        $this.parents('.panel').find('.panel-body').slideUp();
        $this.addClass('panel-collapsed');
        $this.removeClass('glyphicon-minus').addClass('glyphicon-plus');
    } else {
        $this.parents('.panel').find('.panel-body').slideDown();
        $this.removeClass('panel-collapsed');
        $this.removeClass('glyphicon-plus').addClass('glyphicon-minus');
    }
});
$(document).on('focus', '.panel-footer input.chat_input', function (e) {
    var $this = $(this);
    if ($('#minim_chat_window').hasClass('panel-collapsed')) {
        $this.parents('.panel').find('.panel-body').slideDown();
        $('#minim_chat_window').removeClass('panel-collapsed');
        $('#minim_chat_window').removeClass('glyphicon-plus').addClass('glyphicon-minus');
    }
});
$(document).on('click', '#new_chat', function (e) {
    var size = $( ".chat-window:last-child" ).css("margin-left");
     size_total = parseInt(size) + 400;
    alert(size_total);
    var clone = $( "#chat_window_1" ).clone().appendTo( ".container" );
    clone.css("margin-left", size_total);
});
$(document).on('click', '.icon_close', function (e) {
    //$(this).parent().parent().parent().parent().remove();
    $( "#chat_window_1" ).remove();
});

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
    var me = document.getElementById("me").value;
    console.log("who:"+who + " me:" +me);
    if (who == 0){
        control = "";            
    }else if(who == me){
        control = 
        	"<div class='row msg_container base_sent'>"+
        		"<div class='col-xs-10 col-md-10'>"+
        			"<div class='messages msg_sent'>"+
        				"<p>"+text+"</p>"+
        				"<time datetime='2009-11-13T20:00'>"+time+"</time>"+
        			"</div>"+
        		"</div>"+
        		"<div class='col-md-2 col-xs-2 avatar'>"+
    				"<img class=' img-responsive ' src='/MeetTogether/getImage?type=member&id="+ who+"'>"+
        		"</div>"+
        	"</div>";           
    }
    else{
        control = 
        	"<div class='row msg_container base_receive'>"+
        		"<div class='col-md-2 col-xs-2 avatar'>"+
        			"<img class=' img-responsive ' src='/MeetTogether/getImage?type=member&id="+ who+"'>"+
        		"</div>"+
        		"<div class='col-xs-10 col-md-10'>"+
        			"<div class='messages msg_receive'>"+
        				"<p>"+text+"</p>"+
        				"<time datetime='2009-11-13T20:00'>"+time+"</time>"+
        			"</div>"+
        		"</div>"+
        	"</div>";
    }
    document.getElementById("msgContainer").innerHTML += control;   
}