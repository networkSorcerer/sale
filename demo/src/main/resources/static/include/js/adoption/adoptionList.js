$(function(){
	$(".goDetail").on("click", function(){
		let adoptionId= $(this).parents("tr").attr("data-num");
		$("#adoptionId").val(adoptionId);
		$("#detailForm").attr({
			"method":"get",
			"action":"/adoption/adoptionDetail"
		});
		$("#detailForm").submit();
	});

	 
	$("#adoptionListBtn").click(function(){
		location.href="/adoption/adoptionList";
	});
	
	$("#insertFormBtn").on("click", ()=> {
		location.href="/adoption/writeForm";
	});
	
	$("#keyword").bind("keydown", function(event){
		if(event.keyCode == 13) {
			event.preventDefault();
		}
	});
	
	$("#search").on("change", function(){
		if($("search").val()=="all"){
			$("#keyword").val("전체 목록을 조회합니다");
		}else if ($("#search").val()!="all"){
			$("#keyword").val("");
			$("#keyword").focus();
		}
	});
	
	$("#searchData").on("click", function(){
		if($("#search").val()!="all"){
			if(!chkData("#keyword","검색어를"))return;
		}
		goPage();
	});
	
	$(".page-item a").on("click", function(e){
		e.preventDefault();
		$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
		goPage();
	});
});

function goPage(){
	if($("#search").val()=="all"){
		$("keyword").val("");
	}
	$("#f_search").attr({
		"method":"get",
		"action":"/adoption/adoptionList"
	});
	$("#f_search").submit();
}