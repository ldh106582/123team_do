$(document).ready(function() {
    // 초기 콘텐츠 로드
    loadNav();

    // 일정한 시간 간격으로 새로고침
    setInterval(function() {
        loadNav();
    }, 180000); // 3초마다 새로고침
});

function loadNav() {
    $.ajax({
        url: "header", // 새로고침할 JSP 페이지의 URL
        method: "GET",
        success: function(response) {
            $("#header").html(response); // 새로운 내용으로 nav 영역 업데이트
        }
    });
}