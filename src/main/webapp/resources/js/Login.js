
    document.getElementById("login").addEventListener("click", function(event) {
        var username = document.getElementById("id").value;
        var password = document.getElementById("pw").value;
        
        if (username === "" || password === "") {
            alert("아이디와 비밀번호를 모두 입력해주세요.");
            event.preventDefault(); // 폼 제출을 중단합니다.
        }
    });
    
