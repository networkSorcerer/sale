<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>구매 목록</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
/*   .btn_open { padding: 5px 10px; background: #759587; border: 0; color: #fff; cursor: pointer; }
#mask { display: none; width: 100%; height: 100%; position: fixed; left: 0; top: 0; background: #000; -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)"; filter: alpha(opacity=50); zoom: 1; opacity: 0.5; z-index: 9998; }
* html #mask { position: absolute; }
.popup_box { display: none; width: 300px; height: 300px; position: fixed; top: 50%; left: 50%; background: #fff; border: 1px solid #000; z-index: 9999; }
* html .popup_box { position: absolute; }
.popup_cont { padding: 20px; }
.btn_close { width: 30px; height: 25px; position: absolute; top: 0px; right: 0px; background: #000; border: 0; color: #fff; cursor: pointer; }
  */
  
  .layerPop {
    display: none; /* 초기에는 숨김 상태로 설정 */
    position: fixed; /* 화면에 고정된 위치 */
    top: 50%; /* 화면의 상단에서 절반 위치 */
    left: 50%; /* 화면의 좌측에서 절반 위치 */
    transform: translate(-50%, -50%); /* 가운데 정렬을 위한 변형 */
    width: 600px; /* 원하는 너비 설정 */
    background-color: #fff; /* 배경색 설정 */
    border: 1px solid #000; /* 테두리 설정 */
    z-index: 1000; /* 다른 요소들 위에 표시하기 위한 z-index */
    padding: 20px; /* 내부 여백 설정 */
}
  
</style>
</head>
<body>
	
		  <div class="container">
        <h1 class="my-4">구매 목록</h1>
        
        <div>
            <a class="btnType blue" href="javascript:insertModal();" name="modal"><span>신규</span></a>
        </div>
        <br>
        <div>
            <label>상품 검색</label>
            <input type="text" id="searchProduct" name="searchProduct">
        </div>
        <br>
        <div>
            기간
            <input type="date" id="searchStDate" name="searchStDate">
            ~
            <input type="date" id="searchEdDate" name="searchEdDate">
            <a class="btnType red" href="javascript:void(0);" name="searchbtn" id="searchBtn"><span>검색</span></a>
            <a class="btnType blue" href="javascript:insertFileModal();" name="modal"><span>신규(파일)</span></a>
        </div>
        <br>
        <div class="row">
            <div class="col">
                <table id="purchaseList" class="table table-striped table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">구매 ID</th>
                            <th scope="col">상품 이름</th>
                            <th scope="col">수량</th>
                            <th scope="col">구매 일자</th>
                        </tr>
                    </thead>
                    <tbody id="purchase">
                        <!-- 데이터가 여기에 추가됩니다 -->
                    </tbody>
                </table>
            </div>
        </div>
        <br>
        <div class="paging_area" id="pagingNavi"></div>
    </div>
    

	<div id="purchaseInsertModal" class="layerPop layerType2"
		style="width: 600px">
		<div class="popup_cont">
			<dl>
				<dt>
					<strong>구매 내역 등록</strong>
				</dt>
				
				<dd class="content">
					<table  class="table table-striped table-bordered">
						<tbody>
							<tr>
								<th>상품이름</th>
								<td><input type="text" class="inputTxt p100" name="product_name" id="product_name"></td>
							</tr>
							<tr>
								<th>상품 무게</th>
								<td><input type="text" class="inputTxt p100" name="product_kg" id="product_kg"></td>
							</tr>
							<tr>
								<th>상품 수량</th>
								<td><input type="text" class="inputTxt p100" name="purchase_count" id="purchase_count"></td>
							</tr>
							<tr>
								<th>구매일</th>
								<td><input type="date" class="inputTxt p100" name="purchase_date" id="purchase_date"></td>
							</tr>

						</tbody>

					</table>
					<div class="btn_areaC mt30">
						<a href="" class="btnType blue" id="btnSavePurchase" name="btn"><span>저장</span></a>
						<a href="" class="btnType blue" id="btnUpdatePurchase" name="btn"
							style="display: none"><span>수정</span></a> <a href=""
							class="btnType blue" id="btnDeletePurchase" name="btn"><span>삭제</span></a>
						<a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
					</div>
				</dd>
			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</div>

	</div>


	<form id="purchaseForm">
		<input type="hidden" id="purchase_id" name="purchase_id" value="">
		<div id="filePopUp" class="layerPop layerType2" style="width: 600px">
			<dl>
				<dt>
					<strong>구매 내역 등록</strong>
				</dt>
				<dd class="content">
					<table>
						<tbody>
							<tr>
								<th>상품이름</th>
								<td><input type="text"></td>
							</tr>
							<tr>
								<th>상품 무게</th>
								<td><input type="text"></td>
							</tr>
							<tr>
								<th>상품 수량</th>
								<td><input type="text"></td>
							</tr>
							<tr>
								<th>구매일</th>
								<td><input type="date"></td>
							</tr>
							<tr>
								<th>파일</th>
								<td colspan="3">
									<input type="file" name="fileInput" id="fileInput">
								</td>
							</tr>
							<tr>
								<th>미리보기</th>
								<td>
									<div id="preview"></div>
								</td>
							</tr>
						</tbody>

					</table>
					<div class="btn_areaC mt30">
						<a href="" class="btnType blue" id="btnSavePurchaseFile" name="btn"><span>저장</span></a>
						<a href="" class="btnType blue" id="btnUpdatePurchaseFile" name="btn"
							style="display: none"><span>수정</span></a> <a href=""
							class="btnType blue" id="btnDeletePurchaseFile" name="btn"><span>삭제</span></a>
						<a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
					</div>
				</dd>
			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</div>
	</form>



	<!-- Bootstrap JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="/resources/include/js/common.js"></script>
	<script src="/resources/include/js/common/common.js"></script>
	<script src="/resources/include/js/common/jquery.model.js"></script>
		<script src="/resources/include/js/purchase/pagination.js"></script>
		<script src="/resources/include/js/purchase/pagination.min.js"></script>
				<script src="/resources/include/js/purchase/jquery.blockUI.js"></script>
		
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.1/jquery.twbsPagination.min.js"></script>
	

	<script>
		var pageSize = 5;
		var pageBlockPage = 10;
		

		$(function() {
			purchaseSearch();
			registerBtnEvent();
			filePreview();
		});

		function registerBtnEvent() {
			$("#searchBtn").click(function(e) {
				e.preventDefault();
				purchaseSearch();
			});

			$("a[name=btn]").click(function(e) {
				e.preventDefault();
				var btnId = $(this).attr("id");

				switch (btnId) {
				case "btnSavePurchase":
					savePurchase();
					break;
				case "btnUpdatePurchase":
					updatePurchase();
					break;
				case "btnDeletePurchase":
					deletePurchase();
					break;
				case "btnClose":
					break;
				case "btnSavefile":
					saveFilePurchase();
					break;
				case "btnUpdatefile":
					updateFilePurchase();
					break;
				case "btnDeletefile":
					deleteFilePurchase();
					break;
				}
			});
		}
		
		function purchaseSearch(cpage) {
			cpage = cpage || 1;

			var param = {
				searchTitle : $("#searchTitle").val(),
				searchStDate : $("#searchStDate").val(),
				searchEdDate : $("#searchEdDate").val(),
				currentPage : cpage,
				pageSize : pageSize
			};

			var callBackFunction = function(response) {
				$("#purchase").empty().append(response);

				var pagieNavigateHtml = getPaginationHtml(cpage, $("#totcnt").val(), pageSize, pageBlockPage, "purchaseSearch")
				$("#pagingNavi").empty().append(pagieNavigateHtml);
				$("#currentPage").val(cpage);
			};
			console.log($("#totcnt"));
			console.log($("#totcnt").val());
			$.ajax({
				url : "/purchase/purchaseList",
				type : "post",
				dataType : "text",
				async : false,
				data : param,
				success : callBackFunction
			});
		}

		function insertModal() {
			$("#purchase_id").val("");
			$("#purchase_date").val("");
			$("#product_kg").val("");
			$("#purchase_count").val("");
			$("#product_name").val("");
			$("#btnUpdatePurchase").hide();
			$("#btnSavePurchase").show();
			$("#btnDeletePurchase").hide();

			gfModalPop("#purchaseInsertModal")
		}

		function purchaseDetailModal(purchase_id) {
			var param = {
				purchase_id : purchase_id
			};
			
			
			var callBackFunction = function(data) {
				var detail = data.detailValue;

				$("#purchase_id").val(detail.purchase_id)
				$("#purchase_date").val(detail.purchase_date);
				$("#product_kg").val(detail.product_kg);
				$("#purchase_count").val(detail.purchase_count);
				$("#product_name").val(detail.product_name);
				$("#btnUpdatePurchase").show();
				$("#btnSavePurchase").hide();
				$("#btnDeletePurchase").show();

				gfModalPop("#purchaseInsertModal");
			};
			
			$.ajax({
				url : "/purchase/purchaseDetail",
				type : "post",
				dataType : "json",
				async : false,
				data : param,
				success : callBackFunction
			});
			
		}
		
		function savePurchase(){
			if(!fValidate()){
				return;
			}
			var param = {
					purchase_date : $("#purchase_date").val(),
					product_kg : $("#product_kg").val(),
					purchase_count : $("#purchase_count").val(),
					product_name : $("#product_name").val(),
					purchase_id : $("#purchase_id").val()
			}
			var callBackFunction = function(response){
				if(response.result === "success"){
					alert("저장되었습니다");
					gfCloseModal();
					purchaseSearch();
				}
 			}
			$.ajax({
				url: "/purchase/purchaseSave",
				type: "post",
				dataType : "json",
				async :false,
				data : param,
				success : callBackFunction
			});
			console.log(param)
		}
		
		function fValidate() {
			var chk = checkNotEmpty(
				[
					["purchase_date", "구매일을 입력하세요 "],
					["product_kg","상품무게를 입력하세요"],
					["purchase_count","상품수량을 입력하세요"],
					["product_name","상품 이름을 입력하세요"],
					
				]		
			);
			if(!chk) {
				return;
			}
			
			return true;
		}
		
		
		
		function updatePurchase() {
		    if(!fValidate()){
		        return;
		    }
		    var param = {
		        purchase_date: $("#purchase_date").val(),
		        product_kg: $("#product_kg").val(),
		        purchase_count: $("#purchase_count").val(),
		        product_name: $("#product_name").val(),
		        purchase_id: $("#purchase_id").val()    
		    };
		    var callBackFunction = function(response) {
		        if(response.result == "success"){
		            alert("수정되었습니다");
		            gfCloseModal();
		            purchaseSearch($("#currentPage").val());
		        }
		    };
		    
		    $.ajax({
		        url: "/purchase/purchaseUpdate",
		        type: "POST",
		        data: param,
		        dataType: "json",
		        async: false,
		        success: callBackFunction
		    });
		    console.log(param);
		}

		function deletePurchase() {
			if(!fValidate()){
				return;
			}
			var param ={ 
			    purchase_id: $("#purchase_id").val()    
			}
			var callBackFunction = function(response) {
				if(response.result == "SUCCESS"){
					alert("삭제되었습니다");
					gfCloseModal();
					purchaseSearch($("#currentPage").val());
				}
			};
			$.ajax({
				url :"/purchase/deletePurchase",
				data: param,
				type: "post",
				dataType : "json",
				success: callBackFunction,
				acync: false
			})
			
		}
	
<%-----------------------------------------------------------    파일 기능   -----------------------------------------------------------------------%>

function insertFileModal() {
	$("#loginId").val("");
	$("#product_name").val("");
	$("#purchase_id").val("");
	$("#purchase_date").val("");
	$("#product_kg").val("");
	$("#purchase_count").val("");
	$("#btnUpdatePurchaseFile").val("");
	$("#btnSavePurchaseFile").val("");
	$("#btnDeletePurchaseFile").val("");
	$("#preview").empty();
	
	gfModalPop("#filePopUp");
}

function filePreview() {
    $("#fileInput").change(function(e){
        e.preventDefault();
        
        if($(this)[0].files[0]){
            var fileInfo = $("#fileInput").val();
            var fileInfoSplit = fileInfo.split(".");  // 수정: fileInfoSplit 변수명 수정
            var fileLowerCase = fileInfoSplit[1].toLowerCase();  // 수정: fileInfoSplit 변수명 수정
            
            var imgPath="";
            var previewHtml="";
            
            if(fileLowerCase == "jpg" || fileLowerCase == "gif" || fileLowerCase == "png"){  // 수정: fielLowerCase -> fileLowerCase
                imgPath = window.URL.createObjectURL($(this)[0].files[0]);
                previewHtml = "<img src='" + imgPath + "' id='imgFile' style='width: 100px; height: 100px;' />";   
            } else {
                previewHtml="";
            }
            $("#preview").empty().append(previewHtml);  // 수정: previewHtml 뒤에 세미콜론 추가
        }
    });
}


function fValidatefile() {
	var chk = checkNotEmpty(
		[
			["purchase_date", "구매일을 입력하세요 "],
			["product_kg","상품무게를 입력하세요"],
			["purchase_count","상품수량을 입력하세요"],
			["product_name","상품 이름을 입력하세요"],
			
		]		
	);
	if(!chk) {
		return;
	}
	
	return true;
}

function saveFileNotice(){
	if(!fValidatefile()){
		return;
	}
	var getForm = document.getElementById("purchaseForm");
	getForm.entype = 'multipart/form-data';
	var fileData = new FormData(getForm);
	
	var callBackFunction = function(data){
		if(data.result == "success"){
			alert("저장되었습니다");
			gfCloseModal();
			purchaseSearch();
		}
	}
	callAjaxFileUploadSetFormData("/purchase/purchaseSaveFile.do", "post", "json", false,fileData, callBackFunction);
}

function purchaseDetailFileModal(purchase_id){
	var param = {
			purchase_id : purchase_id
	}
	
	var callBackFunction = function(data){
		$("#purchase_id").val(data.detailValue.purchase_id);
		detailModalSettion(data.detailValue);
		gfModal("#filePopUp")
	}
	callAjax("/purchase/purchaseDetail.do", "post", "json", false, param, callBackFunction);
}

function detailModalSetting(detail){
    if(detail != null) {
        $("#product_name").val(detail.product_name);
        $("#product_kg").val(detail.product_kg);
        $("#purchase_count").val(detail.purchase_count);
        $("#purchase_date").val(detail.purchase_date);
        
        if(detail.file_name != null) {
            var ext = detail.file_ext.toLowerCase();
            var imagePath="";
            var previewHtml = "";
            
            console.log(ext);
            if(ext == "jpg" || ext == "gif" || ext == "png"){
                imagePath = detail.logical_path;
                
                previewHtml = "<a href='javascript:download()'>";
                previewHtml += "<img src='" + imagePath + "' id='imgFile' style='width: 100px; height: 100px;' />";   
                previewHtml += "</a>";
            } else {
                previewHtml = "<a href='javascript:download()'>";
                previewHtml += detail.file_name;
                previewHtml += "</a>";
            }
            
            $("#preview").empty().append(previewHtml);
            $("#fileInput").val("");   
        }
    }
}


	</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</body>
</html>