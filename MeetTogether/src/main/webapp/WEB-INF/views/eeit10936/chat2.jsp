<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/eeit10936/css/chat2.css"
	type="text/css">
<script src="${pageContext.request.contextPath}/eeit10936/js/chat2.js"></script>
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
			var txt = document.getElementById("btn-input").value;
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
			xhttp.open("Get", "/MeetTogether/chat/record/" + from + "/" + to, true);
			xhttp.setRequestHeader("Pagram", true);
			xhttp.send();
			xhttp.onreadystatechange = function () {
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					var records = JSON.parse(xhttp.responseText);
					console.log(records);
					for(let record of records){
						insertText(record);
					}
				}
			}
		}

		document.addEventListener("DOMContentLoaded", function () {
			ajaxRecord();
			connect();
			document.getElementById("btn-chat").addEventListener("click", function () {
				sendPersonMsg();
				document.getElementById("btn-input").value="";
			});
		});
</script>
</head>
<body>
<input type="hidden" id="me" value="${userId}">
	<div class="container">
		<div class="row chat-window col-xs-5 col-md-3" id="chat_window_1"
			style="margin-left: 10px;">
			<div class="col-xs-12 col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading top-bar">
						<div class="col-md-8 col-xs-8">
							<h3 class="panel-title">
								<span class="glyphicon glyphicon-comment"></span>    ${friendName }
							</h3>
						</div>
						<div class="col-md-4 col-xs-4" style="text-align: right;">
							<a href="#"><span id="minim_chat_window"
								class="glyphicon glyphicon-minus icon_minim"></span></a> <a href="#"><span
								class="glyphicon glyphicon-remove icon_close"
								data-id="chat_window_1"></span></a>
						</div>
					</div>
					<div class="panel-body msg_container_base" id="msgContainer">
					</div>
					<div class="panel-footer">
						<div class="input-group">
							<input id="btn-input" type="text"
								class="form-control input-sm chat_input"
								placeholder="Write your message here..." /> <span
								class="input-group-btn">
								<button class="btn btn-primary btn-sm" id="btn-chat">Send</button>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="btn-group dropup">
			<button type="button" class="btn btn-default dropdown-toggle"
				data-toggle="dropdown">
				<span class="glyphicon glyphicon-cog"></span> <span class="sr-only">Toggle
					Dropdown</span>
			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="#" id="new_chat"><span
						class="glyphicon glyphicon-plus"></span> Novo</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-list"></span>
						Ver outras</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-remove"></span>
						Fechar Tudo</a></li>
				<li class="divider"></li>
				<li><a href="#"><span class="glyphicon glyphicon-eye-close"></span>
						Invisivel</a></li>
			</ul>
		</div>
	</div>

</body>
</html>