

$(document).ready(function() {
    $("#addButton").click(function(event) {
        event.preventDefault();
        
        var amount = $("#amount").val();
        var personId = $("#personId").val(); // personId를 가져올 요소가 필요합니다. 해당하는 요소의 ID를 확인해주세요.
        
        $.ajax({
            type: 'post',
            url: '/123team/products/addcart',
            dataType: 'json',
            data: {
                "amount": amount,
                "personId": personId
            },
            success: function(result) {
                if (result === true) {
                    alert("상품이 추가되었습니다.");
                } else {
                    alert("해당 상품은 추가할 수 없는 상품입니다.");
                }
            },
            error: function(request, error, status){
                console.log(error);
            }
        });
    });
});


