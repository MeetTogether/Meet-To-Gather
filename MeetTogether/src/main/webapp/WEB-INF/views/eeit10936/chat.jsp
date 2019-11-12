<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>chat</title>
	<script src="${pageContext.request.contextPath}/eeit10936/js/chat.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/eeit10936/css/chat.css" type="text/css">
	<script src="https://cdn.bootcss.com/sockjs-client/1.1.4/sockjs.js"></script>
	<script src="http://cdn.bootcss.com/stomp.js/2.3.3/stomp.min.js"></script>

	<script type="text/javascript">
		var from = "${userId}"
		var to = '${friendId}';
		function connect() { //初始化连接
			var stompURL = "http://localhost:8080/MeetTogether/endpoint";
			var socket = new SockJS(stompURL);
			client = Stomp.over(socket)
			client.connect({}, function successCallback(frame) {
				console.log("連接成功");
				var subscribeUrl = '/chat/single/';
				to > from ? subscribeUrl += from + to : subscribeUrl += to + from;
				client.subscribe(subscribeUrl, function (result) {
					insertText(JSON.parse(result.body));
				});
			}, function errorCallback(frame) {
				console.log("連接失敗");
			});
		}
		function sendPersonMsg() {
			var txt = document.getElementById("text").value;
			console.log("txt : " + txt);
			console.log("from : " + from);
			console.log("to : " + to);

			client.send("/app/ptp/single/chat", {}, JSON.stringify({
				'content': txt,
				'to': to,
				'from': from,
				'time': new Date()
			})); //發送訊息

		}
		function insertText(body) {
			insertChat(body.from, body.content, new Date(body.time)
				.toLocaleString());
		}
		function ajaxRecord() {
			var xhttp = new XMLHttpRequest();
			xhttp.open("Get", "./record/" + from + "/" + to, true);
			xhttp.setRequestHeader("Pagram", true);
			xhttp.send();
			xhttp.onreadystatechange = function () {
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					var records = JSON.parse(xhttp.responseText);
					for(let record of records){
						insertText(record);
					}
				}
			}
		}

		document.addEventListener("DOMContentLoaded", function () {
			ajaxRecord();
			connect();
			document.getElementById("send").addEventListener("click", function () {
				sendPersonMsg();
			});
		});
	</script>


</head>

<body>
	<h2>${userId}</h2>
	<input type="hidden" id="me" value="${userId}">
	<div id="txt"></div>
	<div style="background: whitesmoke !important" class="container">
		<input class="container" placeholder="Type a message" id="text" />
		<input type="button" id="send" value="send" />
	</div>




</body>


</html>