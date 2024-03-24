document.addEventListener("DOMContentLoaded", function(){
	 
	var hopital = document.getElementById("hopital");
	var product = document.getElementById("product");
	var exprience = document.getElementById("exprience");
	var customer = document.getElementById("customer");
	
	if(hopital) {
		hopital.addEventListener("click", function(){
			alert("병원관리자 회원가입 페이지로 이동합니다.");
		});
	} 
	
	if(product) {
		product.addEventListener("click", function(){
			alert("상품관리자 회원가입 페이지로 이동합니다.")
		});
	} 
	
	if(exprience){
		exprience.addEventListener("click", function(){
			alert("체험단 회원가입 페이지로 이동합니다.");
		});
	}
	
	if(customer){
		customer.addEventListener("click", function(){
			alert("일반 회원가입 페이지로 이동합니다.");
		})
	}
});