<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
setInterval(function(){
	var addr1= document.getElementById("addr1").value;
	var addr2= document.getElementById("addr2").value;
	opener.document.getElementById("address").value = addr1;
	opener.document.getElementById("address2").value = addr2;
	window.close();
}, 100);

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" value="${addr1}" id="addr1">
<input type="hidden" value="${addr2}" id="addr2">


</body>
</html>