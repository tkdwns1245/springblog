function idCheck(id){
	if(id == ""){
			alert("아이디를 입력해 주세요.");
			document.joinForm.id.focus();
	}
	else{
		var popWidth = 300;
		var popHeight = 200;
		var winHeight = document.body.clientHeight; //현재 창의 높이
		var winWidth = document.body.clientWidth; //현재 창의 너비
		var winX = window.screenLeft; //현재 창의 x 좌표
		var winY = window.screenTop; //현재 창의 y 좌표
		var popX = winX + (winWidth - popWidth)/2;
		var popY = winY + (winHeight - popHeight)/2;
		url="idCheck.jsp?id="+id;
		window.open(url, "post",
				"left="+popX+",top="+popY+",width="+popWidth+", height="+popHeight);
	}
}

function inputCheck() {
	if(document.joinForm.id.value==""){
		alert("아이디를 입력해 주새오.");
		document.joinForm.id.focus();
		return;
	}
	if(document.joinForm.password.value==""){
		alert("비밀번호를 입력해 주새오.");
		document.joinForm.password.focus();
		return;
	}
	if(document.joinForm.repassword.value==""){
		alert("비밀번호 확인해 주새오.");
		document.joinForm.repassword.focus();
		return;
	}
	if(document.joinForm.name.value=""){
		alert("이름을 입력해주세요.");
		document.joinForm.name.foucs();
		return;
	}
	if(document.joinForm.password.value != document.joinForm.repassword.value){
		alert("비밀번호가 일치하지 안ㅇ습니다.");
		document.joinForm.repassword.focus();
		return;
	}
	if(document.joinForm.email.value==""){
		alert("이메일을 입력해 주새오.");
		document.joinForm.email.focus();
		return;
	}
	
	var str = document.joinForm.email.value;
	var atPos = str.indexOf('@');
	var atLastPos = str.lastIndexOf('@');
	var dotPos = str.indexOf('.');
	var spacePos = str.indexOf(' ');
	var commaPos = str.indexOf(',');
	var eMailSize = str.length;
	if(			atPos > 1 &&
			atPos == atLastPos &&
			dotPos > 3 &&
			spacePos == -1 &&
			commaPos == -1 &&
			atPos + 1 < dotPos &&
			dotPos + 1 < eMailSize
		);
	else{
		alert('E-mail 주소 형식이 잘못되었습니다.\n\r다시 입력해 주새오!');
		document.joinForm.email.focus();
		return;
	}
	document.joinForm.submit();
}

function updateCheck() {
	if(document.joinForm.password.value==""){
		alert("비밀번호를 입력해 주세요.");
		document.modifyForm.password.focus();
		return;
	}
	if(document.joinForm.repassword.value==""){
		alert("비밀번호가 일치하지 않습니다.");
		document.joinForm.repassword.focus();
		return;
	}
	if(document.joinForm.email.value==""){
		alert("이메일을 입력해 주세요.");
		document.joinForm.email.focus();
		return;
	}
	
	var str=document.joinForm.email.value;
	var atPos = str.indexOf('@');
	var atLastPos = str.lastIndexOf('@');
	var dotPos = str.indexOf('.');
	var spacePos = str.indexOf(' ');
	var commaPos = str.indexOf(',');
	var eMailSize = str.length;
	if(	atPos > 1 &&
		atPos == atLastPos &&
		dotPos > 3 &&
		spacePos == -1 &&
		commaPos == -1 &&
		atPos + 1 < dotPos &&
		dotPos + 1 < eMailSize);
	else{
		alert('E-mail주소 형식이 잘못 되었습니다.\n\r다시 입력해 주세요!');
		document.joinForm.email.focus();
		return;
	}
	document.joinForm.submit();
}
function writeSave() {
	if(document.writeForm.subject.value == "") {
		alert("제목을 입력하세요.");
		document.writeForm.subject.focus();
		return false;
	}
	if(document.writeForm.content.value == "") {
		alert("내용을 입력하세요.");
		document.writeForm.content.focus();
		return false;
	}
}