	window.onload = function(){
		var birthday = new Date("${pet.petBirth}");
		var age = calculateAge(birthday);
		document.getElementById('petAge').innerText = age;
	};

	function calculateAge(birthday){
	    var diff_ms = Date.now() - birthday.getTime();
	    var age_dt = new Date(diff_ms);
	    return Math.abs(age_dt.getUTCFullYear()-1970);
	}

	function toggleDisplay(contentId, buttonId) {
		   var element = document.getElementById(contentId);
		   var button = document.getElementById(buttonId);
		   if (element.style.display === 'none') {
		       element.style.display = 'block';
		       button.innerText = '내용 닫기';
		   } else {
		       element.style.display = 'none';
		       button.innerText = '펼치기';
		   }
		}