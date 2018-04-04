<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<style type="text/css">

	@import "/gurume365/resources/css/table-draggable.css";
	
	
	html { height: 100%; width: 100%; min-height: 600px; min-width: 800px; }
	body { height: inherit; width: inherit; margin: 0px; }
	
	#floor-edit
	{
		height: 100%;
		width: 75%;
		float: left;
	}
	
	
	
	#floor-div
	{
		height: 75%;
		width: 100%;
		background-color: green;
	}
	
	#flooricon-div
	{
		height: 25%;
		width: 100%;
		background-color: blue;
	}
	
	#info-div
	{
		height: 100%;
		width: 25%;
		float: left;
	}
	
	#tableinfo-div
	{
		height: 75%;
		width: 100%;
		background-color: yellow;
	}
		
	#floorinfo-div
	{
		height: 25%;
		width: 100%;
		background-color: red;
		
	}
	
	#floor-size
	{
		height: 100%;
		width: 150px;
		float: right;
		background-color: gray;
	}
	
	#floor-H,#floor-W
	{
		width: 40px;
	}
	
	#floor-enable
	{
		position: relative;
		width: 100px;
		height: 100px;
		background-color: purple;
	}
	#setSizeBtn
	{
		float: right;
		margin-right: 20px;
	}
	
</style>

<script type="text/javascript" src="/gurume365/resources/js/floor-edit.js"></script>


<title>Insert title here</title>


</head>
<body>


	<div id="floor-edit">
	
		<div id="floor-div">
		
			<div id="floor-enable">
							
			</div>
		
		</div>
		
		<div id="flooricon-div">
		
			<div id="floor-size">
				<ul>
					<li>
						세로:<input type="text" id="floor-H" placeholder=""> m
					</li>
					<li>
						가로:<input type="text" id="floor-W" placeholder=""> m
					</li>
					
				</ul>
				
				<button id="setSizeBtn">적용</button>
				
			</div>
			
			
		
		</div>
		
		<!-- <div id="draggable-circle">
			<div id="rotateable">
				<div id="rotate"></div>
			</div>
			<div id="drag"></div>
		</div> -->
		
			
	</div>

	<div id="info-div">
	
		<div id="tableinfo-div" align="center">
			<table id="table-info-table">
				<tr>
					<th>No.</th><th>shape</th><th>min</th><th>max</th><th>del</th>
				</tr>
			</table>
		</div>
		
		<div id="floorinfo-div">
			<br>
			<ul>
				<li id="floorSize-info">
					<%-- 세로&nbsp;길이&nbsp;:&nbsp;${floor_H},&nbsp;가로&nbsp;길이&nbsp;:&nbsp;${floor_W} --%>
				</li>
				<%-- <li>
					${}
				</li>
				<li>
					${}
				</li>
				<li>
					${}
				</li> --%>
				
			</ul>
		</div>
	
	</div>
	


</body>
</html>