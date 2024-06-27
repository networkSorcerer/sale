 /**함수명 : chkData(유효성 체크 대상, 메시지 내용)
  * 출력영역 : alter로.
  * 예시 : if (!chkData("#keyword", "검색어를")) return;
  */
 function chkData(item, msg) {
	 // 알림으로 출력하게 해줌
	 if($(item).val().replace(/\s/g,"") == "") {
		 alert(msg+" 입력해 주세요.");
		 $(item).val("");
		 $(item).focus();
		 return false;
	 } else {
		 return true;
	 }
 }
 
 function chkFile(item) {
	 /* 참고사항
	 	jQurey.inArray(찾을 값, 검색대상의 배열) : 배열내의 값을 찾아 인덱스를 반환(요소가 없을 경우 -1 반환)
	 	pop() : 배열의 마지막 요소를 제거한 후, 제거한 요소를 반환
	  */
	 let ext = item.val().split('.').pop().toLowerCase();
	 if(jQuery.inArray(ext, ['gif', 'png', 'jpg']) == -1) {
		 alert('gif, png, jpg 파일만 업로드 할 수 있습니다');
		 item.val('');
		 return false;
	 } else {
		 return true;
	 }
 }
 
 /* 
 함수명 : checkForm(유효성 체크 대상, 메시지 내용)
 출력 영역 : placeholder 속성을 이용.
 예시 : if(!checkForm("#keyword", "검색어를")) reutnr;
  */
 
 function checkForm(item,msg) {
	 let message = "";
	 if($(item).val().replace(/\s/g, "") == "") {
		 message = msg + "입력해 주세요.";
		 $(item).attr("placeholder", message);
		 return false;
	 } else {
		 return true;
	 }
 }
 
 /* dataCheck(유효성 체크 대상, 출력 영역, 메시지 내용) */
 function dataCheck(item, out, msg) {
	 // 영역을 받아와 출력하도록 해줌
	 if($(item).val().replace(/\s/g, "") == "") {
		 $(out).html(msg + " 입력해 주세요");
		 $(item).val("");
		 return false;
	 } else {
		 return true;
	 }
 }
 
 
function chkFile(item) {
	let ext = item.val().split('.').pop().toLowerCase();
	if(jQuery.inArray(ext, ['gif','png','jpg']) == -1) {
		item.val("");
		return false;
	}else {
		return true;
	}
}