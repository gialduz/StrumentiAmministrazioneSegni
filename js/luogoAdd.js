
$('#addSubmit').click(function () {
    
    var valoriArray= $('#addForm').serializeArray();
    var arrayName=[];
    var arrayValue=[];

    $.each(valoriArray, function(i, formField){
        arrayName[i]=formField.name;
        arrayValue[i]=formField.value;
    });
    
    var popupVerifica = confirm("Vuoi davvero AGGIUNGERE il luogo: " + arrayValue[2] + "?");
    alert($("#descrizione").val())
    if (popupVerifica == true) {
        $.ajax({
            type: "POST",
            url: "../php/luogoAdd.php",
            data: { arrayValue: arrayValue, descrizione: $("#descrizione").val() }
        }).done(function() {
             //ricarica AJAX
            location.reload();
        });    
    } else {
        //ricarica AJAX
        location.reload();
    }
});
