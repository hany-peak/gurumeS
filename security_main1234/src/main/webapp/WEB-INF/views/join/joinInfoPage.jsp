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
<div class="password">
비밀번호<input type="password" id="password">
</div>
<div class="password2">
비밀번호 확인<input type="password" id="password2">
</div>
<div class="name">
이름<input type="text" id="name">
</div>
<div>
생년월일<input type="text" id="date_of_birth">
</div>
<div class="phone">
전화번호<input type="text" id="phone" >
</div>
</form>
<div>
<div><input type="submit" value="수정"></div>
<div><input type="button" value="취소"></div>
</div>
</body>
</html>