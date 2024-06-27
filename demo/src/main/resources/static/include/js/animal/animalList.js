$(function(){
	$(".goDetail").on("click", function(){
		let animalId = $(this).parents("tr").attr("data-num");
		$("#animalId").val(animalId);
		$("#detailForm").attr({
			"method":"get",
			"action":"/animal/animalDetail"
		});
		$("#detailForm").submit();
	});
	
	$(".page-item a").on("click", function(e){
		e.preventDefault();
		$("f_search").find("input[name='pageNum']").val($(this).attr("href"));
		goPage();
	});
	$("#animalListBtn").click(function(){
		location.href="/animal/animalList";
	});
	
	
	$("#insertFormBtn").on("click", ()=>{
		location.href = "/animal/writeForm";
	});
	
	
	//
	$("#keyword").bind("keydown", function(event){
		if(event.keyCode == 13) {
			event.preventDefault();
		}
	});
	
	//검색 대상이 변경 될 때마다 처리 이벤트
	$("#search").on("change", function(){
		if($("#search").val()=="all"){
			$("#keyword").val("전체 목록을 조회합니다");
		}else if($("#search").val()!="all"){
			$("#keyword").val("");
			$("#keyword").focus();
		}
	});
	
	
	//검색 버튼 클릭시 처리 이벤트
	$("#searchData").on("click", function(){
		if($("#search").val()!="all"){
			if(!chkData("#keyword","검색어를 "))return;
		}
		goPage();
	});
});

function goPage(){
	if($("#search").val()=="all"){
		$("#keyword").val("");
	}
	$("#f_search").attr({
		"method":"get",
		"action":"/animal/animalList"
	});
	$("#f_search").submit();
}