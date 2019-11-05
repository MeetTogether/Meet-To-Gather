<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>login</title>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		let inputs = document.getElementsByTagName("input");
		for (let i = 0; i < inputs.length - 1; i++) {
			inputs[i].addEventListener("blur", function() {
				let value = this.value;
				let flag = true;
				let flag2 = true;
				let span = this.nextSibling;
				for (let i = 0; i < value.length; i++) {
					if (value.charCodeAt(i) > 0x4E00
							&& value.charCodeAt(i) < 0x9FA5) {
						flag = false;
						break;
					}
				}
				value.split(" ").length > 1 ? flag2 = false : flag2 = true;
				!flag ? span.innerText = "不得為中文"
						: !flag2 ? span.innerText = "不得有空格"
								: span.innerText = "";
			});
		}
	});
</script>
</head>
<body>
	<div id="container">
		<h2>登入</h2>
		<form action="loginAction" method="POST">
			帳號:<input type="text" name="email" /><span></span><br> 密碼:<input
				type="password" name="password" /><span></span> <br> <input
				type="submit" value="登入">

		</form>
	</div>
</body>

</html>