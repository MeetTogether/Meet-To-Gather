/*
 * index.jsp input check
 */
$(document).ready(function() {
	$("#mEmail").blur(checkEmptyE);
	$("#mPwd").blur(checkEmptyP);
	$("#login").click(check);
});

let flag = 0;
let errorMsg = "<span class='msgWrong'>不可空白</span>";
function checkEmptyE() {
	if($("#mEmail").val()=="") {
		$("#msg_mEmail").empty().append(errorMsg).focus();
		flag += 1;
	} else { 
		$("#msg_mEmail").empty();
		flag = 0;
	}
}

function checkEmptyP() {
	if($("#mPwd").val()=="") {
		$("#msg_mPwd").empty().append(errorMsg).focus();
		flag += 1;
	} else {
		$("#msg_mPwd").empty();
		flag = 0;
	}
}

function check() {
	checkEmptyE();
	checkEmptyP();
	if(flag == 0) {
		$("#loginForm").submit();
	} else { ; }
}

