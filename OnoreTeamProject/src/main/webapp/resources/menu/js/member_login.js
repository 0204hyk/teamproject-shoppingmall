var urlParams = new URLSearchParams(window.location.search);
var message = urlParams.get('message');
if (message === "success") {
    alert("해당 이메일로 임시 비밀번호가 전송되었습니다.");
}