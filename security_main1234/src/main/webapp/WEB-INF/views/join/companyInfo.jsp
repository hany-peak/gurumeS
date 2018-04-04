<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>업체 정보</title>
<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAD_AQLECL4Gnp6L3gYZzFz8litKmsVZt8"></script>
<script>
	var map;
	var myCenter=new google.maps.LatLng(37.250943, 127.028854);
	
	function initialize()
	{
		var marker=new google.maps.Marker({
			position:myCenter,
			map: map,
			animation: google.maps.Animation.BOUNCE			
		});
		var mapApper={
			center: myCenter,
			zoom: 15,
			mapTypeId: google.maps.MapTypeId.ROADMAP
		};
		
		map=new google.maps.Map(document.getElementById("googleMap"),mapApper);
		
		google.maps.event.addListener(map, 'click', function(event){
			placeMarker(event.latLng);
		});
		marker.setMap(map);
	}
	google.maps.event.addDomListener(window,'load', initialize);
</script>
</head>
<body>
<div>
	<div class="company_name">
		상호명<input type="text" id="company_name">
	</div>
	<div class="position">
		위치<div id="googleMap" style="width:300px;height:250px"></div>
	</div>
	<div class="phone">
		연락처<input type="text" id="phone" >
	</div>
	<div class="shop_no">
		업체번호<input type="text" id="shop_no" >
	</div>
	<div class="company_no">
		사업자등록번호<input type="text" id="company_no">
	</div>
	<div class="time_of_open">
		영업시간<input type="text" id="time_of_open">
	</div>
	<div class="category">	
		업종<input type="text" id="category" >
	</div>
	<div class="introduce">
		소개 및 세부사항<textarea rows="5" cols="40" id="introduce"></textarea>
	</div>
</div>
</body>
</html>