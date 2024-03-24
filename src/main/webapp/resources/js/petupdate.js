
window.onload = function() {
    document.getElementById('cat').style.display = "none";
    document.getElementById('bird').style.display = "none";
    document.getElementById('rabbit').style.display = "none";
    document.getElementById('guineapig').style.display = "none";
    document.getElementById('reptile').style.display = "none";
    }

    document.getElementById('pet').addEventListener('change', function(){
        document.getElementById('dog').style.display = "none";
        document.getElementById('cat').style.display = "none";
        document.getElementById('bird').style.display = "none";
        document.getElementById('rabbit').style.display = "none";
        document.getElementById('guineapig').style.display = "none";
        document.getElementById('reptile').style.display = "none";

    if (this.value == "dog") {
        document.getElementById('dog').style.display = "block";
    } else if(this.value == "cat"){
        document.getElementById('cat').style.display = "block";
    } else if(this.value == "bird") {
        document.getElementById('bird').style.display = "block";
    } else if (this.value == "rabbit"){
        document.getElementById('rabbit').style.display = "block";
    } else if(this.value == "guineapig"){
        document.getElementById('guineapig').style.display = "block";
    } else if(this.value == "reptile") {
        document.getElementById('reptile').style.display = "block";
    }
});