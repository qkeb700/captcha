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
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Imagetoolbar" content="no"/>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script type="text/javascript">
	function changeCaptcha(){
		$('#catpcha').html('<img src="<%=ctx%>/captcha_mod/CaptChaImg.jsp?rand=' + Math.random() + '"/>');
		
	}
	
	function winPlayer(objUrl){
		$('#audiocatpch').html('<bgsound src="' + objUrl + '">');
	}
	
	function audioCaptcha(){
		var uAgent = navigator.userAgent;
		var soundUrl = 'CaptChaAudio.jsp';
		if(uAgent.indexOf('Trident') > -1 || uAgent.indexOf('MSIE')>-1){
			// IE일 경우 호출
			winPlayer(soundUrl + '?agent=msie&and=' + Math.random());
		} else if(!!document.creatElement('audio').canPlayType){
			// chrome 일 경우 호출
			try{
				new Audio(soundUrl).play();
			}catch(e){
				winPlayer(soundUrl);
			}
		}else window.open(soundUrl, '', 'width=1, height=1');
	}
	
	//화면 호출시 가장 먼저 호출되는 부분
	$(document).ready(function(){
		changeCaptcha(); // Captcha image 요청
		 $('#reLoad').click(function(){
			 changeCaptcha(); // 새로고침 버튼의 클릭 시 changeCaptcha() 호출
		 });
		$('#soundOn').click(function(){
			audioCaptcha(); // 음성듣기 버튼 클릭 시 audioCaptcha() 호출
		});
		
		// 확인 버튼 클릭 시
		$('#frmSubmit').click(function(){
			if(!$('#answer').val()){
				alert("이미지에 보이는 숫자 또는 스피커를 통해 들리는 숫자를 입력해 주세요.");
			} else{
				$.ajax({
					url: 'CaptchaSubmit.jsp',
					type; 'POST',
					dataType: 'text',
					data: 'answer=' + $('#answer').val(),
					async: false,
					success: function(resp){
						alert(resp);
						$('#reLoad').click();
						$('#answer').val('');
					}
				});
			}
		});
	});
</script>
</head>
<body>
	<div id="catpcha">Wait...</div>
	<div id="audiocatpch" style="display:none;"></div>
	<input type="button" id="reLoad" value="새로고침" />
	<input type="button" id="soundOn" value="음성듣기" />
	<br/>
	<input type="text" id="answer" name="answer" value="" />
	<input type="button" id="frmSubmit" value="확인" />
	
</body>
</html>