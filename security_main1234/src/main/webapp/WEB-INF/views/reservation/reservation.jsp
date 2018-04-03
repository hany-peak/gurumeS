<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="<c:url value='/resources/css/jquery.minical.css' />" rel="stylesheet" type="text/css">
<script src="<c:url value='/resources/js/jquery-3.2.1.js' />"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
ul, li { list-style: none; }
.container { margin: 10px auto; }
select,input,.form-control {
    width: 200px;
    height: 30px;
    padding-left: 10px;
    font-size: 18px;
    color: #006fff;
    border: 1px solid #006fff;
    border-radius: 3px;
}
textarea{
	padding-left: 10px;
    font-size: 18px;
    color: #006fff;
    border: 1px solid #006fff;
    border-radius: 3px;
}
</style>
</head>

<body>

<div class="container">
  <div class="row">
    <div class="col-lg-4">
      <form class="demo-1">
        <input type='text' class="form-control">
      </form>
    </div>
    <div>
    	<select>
    		<option>방문시간</option>
    	</select>
    </div>
    <div>
    	<select>
    		<option>이용시간</option>
    	</select>
    </div>
    <div>
    	<select>
    		<option>인원수</option>
    	</select>
    </div>
    <div>
    	<textarea rows="10" cols="30">
    		메모1
    	</textarea>
    </div>
	<div>
    	<textarea rows="10" cols="30">
    		메모2
    	</textarea>
    </div>
    <div>
    	<input type="text" value="add customer">
    </div>
    <div>
    	<input type="text" value="add order">
    </div>
  </div>
</div>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script> 
<script src="<c:url value='/resources/js/jquery.minical.js' />"></script>
<script>
$("form.demo-1 :text").minical();
</script>





</body>
</html>