/*
 * register.jsp input check
 */
$(document).ready(function () {
    $("#memberEmail").blur(checkEmail);
    $("#memberName").blur(checkName);
    $("#memberPassword").blur(checkPwd);
    $("#memberPassword2").blur(checkPwdSame);
    $("#mChecksum").blur(checksum);
    $("#regis").click(checkError);
    $("#uploadphoto").change(function () {
		var filepath = $("input[name='uploadphoto']").val();
		var extStart = filepath.lastIndexOf(".");
		var ext = filepath.substring(extStart, filepath.length).toUpperCase();
		if (ext != ".BMP" && ext != ".PNG" && ext != ".GIF" && ext != ".JPG" && ext != ".JPEG") {
			$("#msg_mPhoto").html("<span class='msgWrong'>圖片限於bmp, png, gif, jpeg, jpg格式</span>");
			return false;
		} else { 
			var file_size = this.files[0].size;
			var size = file_size / 1024;
			if (size > 1024) {
				$("#msg_mPhoto").html("<span class='msgWrong'>上傳的圖片大小不能超過1M</span>");
			} else {
				$("#msg_mPhoto").html("");
				return true;
			} 
		}
	});
    $("#backToLogin").click(function() {
		top.location.href = "./";
	});
});

let flag = 0;
let thePwd;

function checkEmail() {
    let theEmail = document.getElementById("memberEmail").value;
    if (theEmail == "" || theEmail.length == 0) {
        document.getElementById("msg_mEmail").innerHTML = "<span class='msgWrong'>不可空白</span>";
        flag += 1;
    } else {
    	let re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if (re.test(theEmail)) {
        	document.getElementById("msg_mEmail").innerHTML = "";
        	flag = 0;
        }
        else {
        	document.getElementById("msg_mEmail").innerHTML = "<span class='msgWrong'>Email格式不正確</span>";
        	flag += 1;
        }
    }
}

function checkName() {
	let theName = document.getElementById("memberName").value;
    if (theName == "" || theName.length == 0) {
    	document.getElementById("msg_mNickname").innerHTML = "<span class='msgWrong'>不可空白</span>";
    	flag += 1;
    } else {
    	document.getElementById("msg_mNickname").innerHTML = "";
    	flag == 0;
    }
}

function checksum() {
	let theCS = document.getElementById("mChecksum").value;
    if (theCS == "" || theCS.length == 0) {
    	document.getElementById("msg_mChecksum").innerHTML = "<span class='msgWrong'>不可空白</span>";
	    flag += 1;
    } else {
		document.getElementById("msg_mChecksum").innerHTML = "";
		flag == 0;
    }
}

function checkPwd() {
	thePwd = document.getElementById("memberPassword").value;
    let re = /^[a-zA-Z0-9!@#$%^&*]{6,}$/;
    if (thePwd.length == "") {
    	document.getElementById("msg_mPwd").innerHTML = "<span class='msgWrong'>不可空白</span>";
    	flag += 1;
    } else {
    	if (re.test(thePwd)) {
    		document.getElementById("msg_mPwd").innerHTML = "";
    	} else {
    		document.getElementById("msg_mPwd").innerHTML = "<span class='msgWrong'>密碼格式不正確</span>";
        	flag += 1;
    	}
    }
}

function checkPwdSame() {
	thePwd2 = document.getElementById("memberPassword2").value;
	if (thePwd2 == "" || thePwd2.length == 0) {
		document.getElementById("msg_mPwd2").innerHTML = "<span class='msgWrong'>不可空白</span>";
    	flag += 1;
	} else {
		if (thePwd2 != thePwd) {
			document.getElementById("msg_mPwd2").innerHTML = "<span class='msgWrong'>與上方設定密碼不一致</span>";
			flag += 1;
		} else {
			document.getElementById("msg_mPwd2").innerHTML = "";
			flag = 0;
		}
	}
}

function checkError() {
	let errorMsg = "<span class='msgWrong'>不可空白</span>";
	
	if($("#memberEmail").val()=="") {
		$("#msg_mEmail").empty().append(errorMsg).focus();
		flag += 1;
	} 
	if($("#memberName").val()=="") {
		$("#msg_mNickname").empty().append(errorMsg).focus();
		flag += 1;
	} 
	if($("#memberPassword").val()=="") {
		$("#msg_mPwd").empty().append(errorMsg).focus();
		flag += 1;
	} 
	if($("#memberPassword2").val()=="") {
		$("#msg_mPwd2").empty().append(errorMsg).focus();
		flag += 1;
	} 
	if($("#mChecksum").val()=="") {
		$("#msg_mChecksum").empty().append(errorMsg).focus();
		flag += 1;
	} 
	if($("#uploadphoto").val()=="") {
		$("#msg_mPhoto").empty().append(errorMsg).focus();
		flag += 1;
	}
	if(flag == 0) {
		document.getElementById("registerForm").submit();
//		document.href();
	} else {
//		;
	}
}

