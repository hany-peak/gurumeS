<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>

	<head>
		<title>GURUME365</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">
		<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/jquery.scrolly.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/jquery.scrollex.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/skel.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/util.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/main.js"/>"></script>
		
		<script type="text/javascript">
			var stmnLEFT = 10;//오른쪽여백
			var stmnGAP1 = 0;//위쪽 여백
			var stmnGAP2 = 150;//스크롤시 브라우저 위쪽과 떨어지는 거리
			var stmnBASE = 150;//스크롤 시작위치
			var stmnActivateSpeed = 35;//스크롤을 인식하는 딜레이(숫자 클수록 느림)
			var stmnScrollSpeed = 20;//스크롤 속도(클수록 느림)
			var stmnTimer;
			
			function RefreshStaticMenu() {
				var stmnStartPoint,stmnEndPoint;
				stmnStartPoint = parseInt(document.getElementById('STATICMENU').style.top, 10);
				stmnEndPoint = Math.max(document.documentElement.scrollTop, document.body.scrollTop)+stmnGAP2;
				if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP;
				if (stmnStartPoint != stmnEndPoint) {
					stmnScrollAmount = Math.ceil(Math.abs(stmnEndPoint - stmnStartPoint)/15);
					document.getElementById('STATICMENU').style.top = parseInt(document.getElementById('STATICMENU').style.top,10)+((stmnEndPoint < stmnStartPoint)?-stmnScrollAmount : stmnScrollAmount)+'px';
					stmnRefreshTimer = stmnScrollSpeed;
				}
				stmnTimer = setTimeout("RefreshStaticMenu();",stmnActivateSpeed);
			}
			function InitializeStaticMenu() {
				document.getElementById('STATICMENU').style.right = stmnLEFT + 'px';
				document.getElementById('STATICMENU').style.top = document.body.scrollTop + stmnBASE + 'px';
				RefreshStaticMenu();
			}
		</script>
		
		<script>
		//제이쿼리를 이용한 이미지 페이지 넘김
$(function() {
    var time = 500;
    var idx = idx2 = 0;
    var slide_width = $("#slider").width();
    var slide_count = $("#slider li").size();
    $("#slider li:first").css("display", "block");
    if(slide_count > 1)
        $(".btn").css("display", "inline");
 
    $("#prev_btn").click(function() {
        if(slide_count > 1) {
            idx2 = (idx - 1) % slide_count;
            if(idx2 < 0)
                idx2 = slide_count - 1;
            $("#slider li:hidden").css("left", "-"+slide_width+"px");
            $("#slider li:eq("+idx+")").animate({ left: "+="+slide_width+"px" }, time, function() {
                $(this).css("display", "none").css("left", "-"+slide_width+"px");
            });
            $("#slider li:eq("+idx2+")").css("display", "block").animate({ left: "+="+slide_width+"px" }, time);
            idx = idx2;
        }
    });
 
    $("#next_btn").click(function() {
        if(slide_count > 1) {
            idx2 = (idx + 1) % slide_count;
            $("#slider li:hidden").css("left", slide_width+"px");
            $("#slider li:eq("+idx+")").animate({ left: "-="+slide_width+"px" }, time, function() {
                $(this).css("display", "none").css("left", slide_width+"px");
            });
            $("#slider li:eq("+idx2+")").css("display", "block").animate({ left: "-="+slide_width+"px" }, time);
            idx = idx2;
        }
    });
});
</script>
		
	</head>
	
	<body onload="InitializeStaticMenu();">
		<!-- Banner -->
		<div id="STATICMENU">
			<!-- 배너 코드 -->
		</div>

		<!-- Header -->
			<header id="header" class="alt">
				
				<sec:authorize access="isAnonymous()">
					<a href="<c:url value="/login/loginForm" />">로그인</a>
					<a href="<c:url value="/join/joinPermission" />">회원가입</a>
				</sec:authorize>
							
				<sec:authorize access="isAuthenticated()">
					<a href="/gurume365/logout">로그아웃</a>
					<a href="/gurume365/chat/chatRoom">채팅 페이지 시험용</a>
				</sec:authorize>

			</header>
		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<header>
						<h1>GURUME 365</h1>
						<p>당신의 미식(美食)을 책임집니다!</p>
					</header>
					<a href="#main" class="button big scrolly" id="mainAtag">위치를 선택하세요</a>
				</div>
			</section>

		<!-- Main -->
			<div id="main">
								<p class="mainTitle" style="text-align: center; font-weight: bold;">당신은 지금 어디에 있나요?</p>
								<div class="w3-center">
  										<img src="<c:url value="/resources/img/seoul-1.jpg"/>" height="330px" width="417px" class="w3-hover-grayscale">
  										<img src="<c:url value="/resources/img/busan-1.jpg"/>" height="330px" width="417px" class="w3-hover-grayscale">
  										<img src="<c:url value="/resources/img/jeju-1.jpg"/>" height="330px" width="417px" class="w3-hover-grayscale" >
								</div>
								<div class="w3-center">
  										<img src="<c:url value="/resources/img/daegu.jpg"/>" height="250px" width="250px" class="w3-hover-grayscale">
  										<img src="<c:url value="/resources/img/daejeon.jpg"/>" height="250px" width="250px" class="w3-hover-grayscale">
  										<img src="<c:url value="/resources/img/inchon.jpg"/>" height="250px" width="250px" class="w3-hover-grayscale">
  										<img src="<c:url value="/resources/img/jeonju.jpg"/>" height="250px" width="250px" class="w3-hover-grayscale">
  										<img src="<c:url value="/resources/img/kwangju.jpg"/>" height="250px" width="250px" class="w3-hover-grayscale">
								</div>
			</div>
			<br><br><br><br>
		<!-- footer -->
			
			<footer>
				<div class="tail" style="color: white">
					<h2>GURUME365,</h2>
					<p>사업자는 노쇼를 줄이고</p>
					<p>손님은 더 저렴하게 예약할수 있습니다.</p>
					<p>당신의 방문을 환영합니다.</p>
					<p>&copy; GURUME365. All rights reserved.</p>
				</div>
				<div class="footMenu" style="color: white">
						<a href="">개발자 소개</a>
						<a href="">이용약관</a>
						<a href="">개인정보 취급방침</a>
				</div>
			</footer>

</body>
</html>
