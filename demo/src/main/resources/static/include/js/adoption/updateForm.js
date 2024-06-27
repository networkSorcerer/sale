$(function(){
    $("#adoptionUpdateBtn").on("click", function(){
        if(!chkData("#adoptionTitle", "공고 제목을")) return;
        else if(!chkData("#animalId", "동물 ID를")) return;
        else if(!chkData("#adoptionContent", "공고내용을")) return;
        else if(!chkData("#adoptionLevel", "공고레벨을")) return;
        else if(!chkData("#adoptionStatus", "공고상태를")) return;
        else {
            if($("#file").val() != ""){
                if(!chkFile($("#file"))) return;
            }
            $("#f_updateForm").attr({
                "method": "post",
                "enctype": "multipart/form-data",
                "action": "/adoption/adoptionUpdate"
            });
            $("#f_updateForm").submit(); // 수정: 폼 ID를 올바르게 수정
        }
    });

    $("#adoptionCancelBtn").on("click", function(){
        $("#f_updateForm").each(function(){
            this.reset();
        });
    });

    $("#adoptionListBtn").on("click", function(){
        location.href = "/adoption/adoptionList"; // 수정: location.href를 사용
    });
});
