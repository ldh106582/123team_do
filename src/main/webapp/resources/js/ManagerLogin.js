
window.onload = function() {
    var form = document.querySelector("form.form-signin");
	
    form.addEventListener("submit", function(e){
        var id = document.getElementById("id").value;
        var pw = document.getElementById("pw").value;
        if(id === "" || pw === ""){
            alert("아이디와 비밀번호를 입력해주세요.");
            e.preventDefault();
        }
    });
	
    var error = "아이디와 비밀번호를 확인해주세요";
    var firstLoad = true;
    if(error && !firstLoad){
        alert(error);
    }
    firstLoad = false;
};

document.addEventListener("DOMContentLoaded", function(){
	var allmember = document.getElementById("allmember");
	allmember.addEventListener("click", function(){
		alert("관리자 회원가입 페이지로 이동합니다.");
	});
		
});