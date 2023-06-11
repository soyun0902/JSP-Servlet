
<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    div#popup {
        position: absolute; top:100px; left:50px; color:yellow;  
        width:270px; height:100px; background-color:gray;
    }
    div#popup>div {
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
</style>
<script>
window.onload = function(){
	if(typeof closeBtn != 'undefined'){
		
	closeBtn.onclick = function(){
		// 체크박스가 체크 되었으면 popFrm 폼을 submit 처리 -> 쿠키 생성
		// 쿠키를 생성 후 Main1로 sendRedirect 해준다
		if(document.querySelector("#inactiveToday").checked){
			popFrm.submit();   // Y 이기 때문에 폼 창 안보인다	
		} else{
			popup.style.display = 'none';
			}
			
		}
	
	}
	
}
</script>
<title>쿠키를 이용한 팝업창 제어 ver 1.0 </title>
</head>
<body>

	<h3>쿠키를 이용한 팝업창 제어</h3>
	
	<%
	// 쿠키에 popupClose 값이 등록 되어 있지 않으면 팝업창을 보여준다
	String cValue = CookieManager.readCookie(request, "PopupClose");
	
	if(! "Y".equals(cValue)){
	%>
	
    <div id="popup">
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right">
	        <form name="popFrm" action="PopupCookie.jsp">
	            <input type="checkbox" id="inactiveToday" value="1" /> 
	            하루 동안 열지 않음
	            <input type="button" value="닫기" id="closeBtn" /> 
	        </form>
        </div>
    </div>
    <% } %>
</body>
</html>