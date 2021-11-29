<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctx = request.getContextPath(); // 컨텍스트명 얻어오기
	response.setHeader("Pragma-directive", "no-cache");
	response.setHeader("Cache-directive", "no-cache");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function changeCaptcha(){
		$('#captcha').html('<img src="<%=ctx%>/captcha_mod/CaptChaImg.jsp?rand=' + Math.random() + '"/>');
	}
	
	function winPlayer(objUrl){
		$('#audiocatpch').html('<bgsound src="' + objUrl + '">');
	}
</script>
</head>
<body>

</body>
</html>