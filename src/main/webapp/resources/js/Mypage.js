 
    document.getElementById('delete').addEventListener("click", function(e){
        if(!confirm("정말로 회원을 삭제하시겠습니까??")){
            e.preventDefault();
        }
    });
    
    document.getElementById('logout').addEventListener("click", function(e){
    	if(!confirm("로그아웃 하시겠습니까??")){
    		e.preventDefault();
    	}
    });

    