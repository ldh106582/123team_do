
var park = document.getElementById("park");
var review = document.getElementById("review");

var parkmap = document.getElementById("parkmap");
var reviews = document.getElementById("reviewadd");
var reviews1 = document.getElementById("reviewadd1");

reviews.style.display = "none";
reviews1.style.display = "none";

park.addEventListener("click", function(){
	console.log("도착");
    parkmap.style.display = "block";
    reviews.style.display = "none";
    reviews1.style.display = "none";
});

review.addEventListener("click", function(){
	console.log("ehckr");
    parkmap.style.display = "none";
    reviews.style.display = "block";
    reviews1.style.display = "block";

});

