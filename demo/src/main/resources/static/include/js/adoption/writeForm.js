$(function(){
	$("#adoptionInsertBtn").on("click", function(){
		if(!chkData("#adoptionTitle", "공고 제목을"))return;
		else if(!chkData("#animalId", "동물 ID를"))return;
		else if(!chkData("#adoptionContent", "공고 내용을"))return;
		
		else {
			if($("#file").val()!=""){
				if(!chkFile($("#file")))return;
			}
			$("#f_writeForm").attr({
				"method":"post",
				"enctype":"multipart/form-data",
				"action":"/adoption/adoptionInsert"
			});
			$("#f_writeForm").submit();
		}
	});
	
	$("#adoptionCancelBtn").on("click", function(){
		$("#f_writeForm").each(function(){
			this.reset();
		})
	});
	$("#adoptionListBtn").on("click",function(){
		locationhref="/adoption/adoptionList";
	})
})