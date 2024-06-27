let buttonCheck = 0;
$(function() {

    $("#updateFormBtn").on("click", () => {
        $("#f_data").attr({
            "method": "get",
            "action": "/adoption/updateForm"
        });
        $("#f_data").submit();
    });

    $("#DeleteBtn").on("click", () => {
        $("#f_data").attr({
            "method": "post",
            "action": "/adoption/adoptionDelete"
        });
        $("#f_data").submit();
        btnInit();
        buttonCheck = "deleteButton";
    });

    $("#insertFormBtn").click(function() {
        location.href = "/adoption/writeForm";
    });

    $("#adoptionListBtn").click(function() {
        location.href = "/adoption/adoptionList";
    });

    $("#couselingBtn").on("click", function() {
        actionProcess("GET", "/counseling/counselingWriteForm");
    });
});

function actionProcess(method, goUrl) {
    $("#f_data").attr({
        "method": method,
        "action": goUrl
    });
    $("#f_data").submit();
}
