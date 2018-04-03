<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>등록 정보</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.1.js'/>"></script>
<script type="text/javascript">
	function addressPopup(){
		var url="jusoPopup"
		window.open(url,"","width=400,height=400,left=600");
	}
	function addressCallback(roadFullAddr,roadAddrPart1,addrDetail,
			roadAddrPart2,engAddr,jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,
			bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,
			lnbrMnnm,lnbrSlno,emdNo){
		
		document.form.roadAddrPart1.value=roadAddrPart1;
		document.form.addrDetail.value=addrDetail;
		
		var address = $('#address');
		var address2 = $('#address2');
		address.attr("value",roadAddrPart1);
		address2.attr("value",addrDetail);	
		self.close;
	}
</script>
</head>
<body>
<div>
<h1>등록 정보 확인</h1>
</div>
<form action="regUpdate" method="post" onsubmit="">
<div class="id">
이메일<input type="text" id="id" >
</div>
<div class="company_name">
업체명<input type="text" id="company_name" >
</div>
<div class="company_no">
사업자등록번호<input type="text" id="company_no" >
</div>
<div class="address">
주소<input type="text" id="address">
<input type="button" value="주소 검색" id="popup" onclick="addressPopup();">
</div>
<div class="address2">
상세 주소<input type="text" id="address2">
</div>
<div class="phone">
전화번호<input type="text" id="phone" >
</div>
<div class="shop_no">
가게번호<input type="text" id="shop_no" >
</div>
<div class="category">
업종<input type="text" id="category" >
</div>
<div class="time_of_open">
영업시간<input type="text" id="time_of_open">
</div>
<div class="shop_info">
가게 소개<textarea rows="5" cols="40"></textarea>
</div>
</form>
<div>
<div><input type="submit" value="수정"></div>
<div><input type="button" value="취소"></div>
</div>
</body>
</html>