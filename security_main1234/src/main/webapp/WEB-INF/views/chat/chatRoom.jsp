<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>채팅룸</title>
	<script type="text/javascript">
	 var wsUri = "ws://localhost:8003/gurume365/websocket/echo";

     function init() {
         output = document.getElementById("output");
     }

     function send_message() {
         websocket = new WebSocket(wsUri);
         websocket.onopen = function(evt) {
             onOpen(evt)
         };

         websocket.onmessage = function(evt) {
             onMessage(evt)
         };
         websocket.onerror = function(evt) {
             onError(evt)
         };
     }


     function onOpen(evt) {
         writeToScreen("웹소켓 연결");
         doSend(textID.value);
     }

     function onMessage(evt) {

         writeToScreen("받은 메세지: " + evt.data);
     }

     function onError(evt) {

         writeToScreen('에러발생: ' + evt.data);
     }

     function doSend(message) {

         writeToScreen("보낸 메세지: " + message);
         websocket.send(message);

         //websocket.close();
     }

     function writeToScreen(message) {

         var pre = document.createElement("p");
         pre.style.wordWrap = "break-word";
         pre.innerHTML = message;
        
         output.appendChild(pre);
     }
     window.addEventListener("load", init, false);
 </script>
</head>
<body>
	<h1 style="text-align: center;">채팅방 구현</h1>
 	<br>
	 <div style="text-align: center;">
     <form action="">
         <input type="button" value="Send" onclick="send_message()"  >
         <input id="textID" name="message" type="text"><br>
     </form>
 	</div>

 	<div id="output">
 	
 	</div>

</body>
</html>