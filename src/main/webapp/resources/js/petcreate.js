var Idcheck = false;

function idDuplicateCheck(event)
{
	event.preventDefault();
	
	var userId = document.getElementById("petId").value;

	if(userId === "")
	{
		alert("아이디를 입력해주세요");
		return;
	}
	
	$.ajax({
		type: "get",
		url: "/123team/petId/p_userId?userId=" + encodeURIComponent(userId),
		contentType: 'applicate/json',
		success: function(result)
		{
			if(result === true)
			{
				alert("사용할 수 있는 아이디입니다.");	
				Idcheck = true;
			}
			else
			{
				alert("이미 사용중인 아이디입니다.");				
			}
		},
		error: function(request, status, error)
		{
			console.log(request);	
		}
	});
}

function combineAddr(event){
	
	if(Idcheck === true)
	{
		alert("회원가입 되었습니다.");
	} 
	else
	{
		alert("아이디 중복체크를 해주세요");
		event.preventDefault();
	}
}

