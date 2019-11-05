<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>pair</title>
<script></script>
<script>
	function getage(birth) {
		let dateNow = new Date().getTime();
		let birthTime = new Date(birth).getTime();
		let age = new Date(dateNow - birthTime);
		return age.getFullYear() - 1970;
	}
	function myInnerText() {
		if (members[num]) {
			document.getElementById("name").innerText = members[num].memberBasic.memberName;
			document.getElementById("age").innerText = getage(members[num].memberBasic.memberBirth);
			document.getElementById("education").innerText = members[num].memberInfo.education;
			document.getElementById("drink").innerText = members[num].memberInfo.drink;
			members[num].memberInfo.smoking == 1 ? text = "是" : text = "否";
			document.getElementById("smoking").innerText = text;
			members[num].memberInfo.marriage == 1 ? text = "是" : text = "否";
			document.getElementById("marriage").innerText = text;
			document.getElementById("religion").innerText = members[num].memberInfo.religion;
			document.getElementById("salary").innerText = members[num].memberInfo.salary;
			document.getElementById("bodyType").innerText = members[num].memberInfo.bodyType;
			document.getElementById("memberCity").innerText = members[num].memberBasic.memberCity
					.trim();
			document.getElementById("interest").innerText = members[num].memberInterestList;
			document.getElementById("photo").src = "memberPhoto?mid= "+ members[num].memberBasic.memberId;
		} else {
			window.location.href = "/noMore.jsp";
		}
	}
	function binding() {
		let inputs = document.getElementsByTagName("input");
		for (let a = 0; a < inputs.length; a++) {
			inputs[a].addEventListener("click", function() {
				console.log(typeof jsonArray[num].mb.memberId);
				a == 0 ? url = "insertPairList?pairid="
						+ jsonArray[num].mb.memberId + "&status=0"
						: url = "insertPairList?pairid="
								+ jsonArray[num].mb.memberId + "&status=1";
				console.log(url);
				let xhttp = new XMLHttpRequest();
				xhttp.open("Get", url, true);
				xhttp.setRequestHeader("Pragma", true);
				xhttp.send();
				num++;
				myInnerText();
			});
		}
	}

	function pairAjax() {
		let xhttp = new XMLHttpRequest();
		xhttp.open("Get", "../pairs/showPairMember", true);
		xhttp.setRequestHeader("Pagram", true);
		xhttp.send();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				members = JSON.parse(xhttp.responseText);
				num = 0;
				console.log(members);
				console.log(members.length);
				myInnerText();
				binding();
			}
		}
	}

	document.addEventListener("DOMContentLoaded", function() {
		pairAjax();
	});
</script>
</head>

<body>
	<h2>${currentUser.memberBasic.memberId }</h2>
	<h2>${currentUser.memberBasic.memberName }</h2>
	<div id="container">
		<h2>配對</h2>
		<img src="" alt="" id="photo">
		<table>
			<tr>
				<td>姓名:</td>
				<td id="name"></td>
				<td>年齡:</td>
				<td id="age"></td>
			</tr>
			<tr>
				<td>城市</td>
				<td id="memberCity"></td>

				<td>學歷:</td>
				<td id="education"></td>
			</tr>
			<tr>
				<td>飲酒:</td>
				<td id="drink"></td>
				<td>抽菸:</td>
				<td id="smoking"></td>
			</tr>
			<tr>
				<td>結婚:</td>
				<td id="marriage"></td>
				<td>信仰:</td>
				<td id="religion"></td>
			</tr>
			<tr>
				<td>薪水:</td>
				<td id="salary"></td>
				<td>身材:</td>
				<td id="bodyType"></td>
			</tr>
			<tr>
				<td>興趣:</td>
				<td id="interest"></td>

			</tr>
			<tr>
				<td><input type="button" value="不喜歡" id="dontlike"></td>
				<td></td>
				<td><input type="button" value="喜歡" id="like"></td>
				<td></td>
			</tr>
		</table>
	</div>
</body>

</html>