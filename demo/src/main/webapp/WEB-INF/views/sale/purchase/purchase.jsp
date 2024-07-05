<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>구매 목록</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
  /*   .btn_open { padding: 5px 10px; background: #759587; border: 0; color: #fff; cursor: pointer; }
#mask { display: none; width: 100%; height: 100%; position: fixed; left: 0; top: 0; background: #000; -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)"; filter: alpha(opacity=50); zoom: 1; opacity: 0.5; z-index: 9998; }
* html #mask { position: absolute; }
.popup_box { display: none; width: 300px; height: 300px; position: fixed; top: 50%; left: 50%; background: #fff; border: 1px solid #000; z-index: 9999; }
* html .popup_box { position: absolute; }
.popup_cont { padding: 20px; }
.btn_close { width: 30px; height: 25px; position: absolute; top: 0px; right: 0px; background: #000; border: 0; color: #fff; cursor: pointer; }
  */
</style>
</head>
<body>

<div class="container">
    <h1 class="my-4">구매 목록</h1>

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
                 
                </tbody>
            </table>
        </div>
    </div>

    <div class="paging_area" id="pagingNavi">
        <!-- 페이징 네비게이션 위치 -->
    </div>
</div>

<div id="purchaseInsertModal"class="layerPop layerType2"  style="width: 600px">
	<div  class="popup_cont">
		<dl>
		<dt>
			<strong>구매 내역111</strong>
		</dt>
		<dd class="content">
			<table>
				<tbody>
					<tr>
						<th>구매ID</th>
						<td><input type="text"></td>
					</tr>
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
						<th>구매일 </th>
						<td><input type="text"></td>
					</tr>
				
				</tbody>
				
			</table>
			<div class="btn_areaC mt30">
				<a href="" class="btnType blue" id="btnSaveNotice" name="btn"><span>저장</span></a> 
				<a href="" class="btnType blue" id="btnUpdateNotice" name="btn" style="display:none"><span>수정</span></a> 
				<a href="" class="btnType blue" id="btnDeleteNotice" name="btn"><span>삭제</span></a> 
				<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>취소</span></a>
			</div>
		</dd>
	</dl>
	<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
	
</div>


<form id="purchaseForm" >
<input type="hidden" id="purchase_id" name="purchase_id" value="">
	<div  id="filePopUp" class="layerPop layerType2"  style="width: 600px">
		<dl>
		<dt>
			<strong>구매 내역</strong>
		</dt>
		<dd class="content">
			<table>
				<tbody>
					<tr>
						<th>구매ID</th>
						<td><input type="text"></td>
					</tr>
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
						<th>구매일 </th>
						<td><input type="text"></td>
					</tr>
				
				</tbody>
				
			</table>
			<div class="btn_areaC mt30">
				<a href="" class="btnType blue" id="btnSaveNotice" name="btn"><span>저장</span></a> 
				<a href="" class="btnType blue" id="btnUpdateNotice" name="btn" style="display:none"><span>수정</span></a> 
				<a href="" class="btnType blue" id="btnDeleteNotice" name="btn"><span>삭제</span></a> 
				<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>취소</span></a>
			</div>
		</dd>
	</dl>
	<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
</form>



<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="/resources/include/js/common.js"></script>
<script src="/resources/include/js/common/common.js"></script>
<script src="/resources/include/js/common/jquery.model.js"></script>

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
            noticeSearch();
        });

        $("a[name=btn]").click(function(e) {
            e.preventDefault();
            var btnId = $(this).attr("id");

            switch(btnId) {
                case "btnSaveNotice":
                    saveNotice();
                    break;
                case "btnUpdateNotice":
                    updateNotice();
                    break;
                case "btnDeleteNotice":
                    deleteNotice();
                    break;
                case "btnClose":
                    break;
                case "btnSavefile":
                    saveFileNotice();
                    break;
                case "btnUpdatefile":
                    updateFileNotice();
                    break;
                case "btnDeletefile":
                    deleteFileNotice();
                    break;
            }
        });
    }

    function purchaseSearch(cpage) {
        cpage = cpage || 1;
		
        var param = {
            searchTitle: $("#searchTitle").val(),
            searchStDate: $("#searchStDate").val(),
            searchEdDate: $("#searchEdDate").val(),
            currentPage: cpage,
            pageSize: pageSize
        };

        var callBackFunction = function(response) {
            $("#purchase").empty().append(response);

            var pagieNavigateHtml = getPaginationHtml(cpage, $("#totcnt").val(), pageSize, pageBlockPage, "purchaseSearch");
            $("#pagingNavi").empty().append(pagieNavigateHtml);
            $("#currentPage").val(cpage);
        };

        $.ajax({
            url: "/purchase/purchaseList",
            type: "post",
            dataType: "text",
            async: false,
            data: param,
            success: callBackFunction
        });
    }
	
    function insertModal() {
		$("#purchase_id").val(detail.purchase_id);
		$("#purchase_date").val(detail.purchase_date);
		$("#product_kg").val(detail.product_kg);
		$("#purchase_count").val(detail.purchase_count);
		$("#product_name").val(detail.product_name);
		$("#btnUpdatePurchase").hide()
		$("#btnSavePurchase").show();
		$("#btnDeletePurchase").hide();
		
		gfModalPop("#purchaseInsertModal")
    }
    
    function purchaseDetailModal(purchase_id) {
        var param = {
            purchase_id: purchase_id
        };

        var callBackFunction = function(data) {
            var detail = data.detailValue;
        	
        	$("#purchase_id").val(data.purchase_id)
    		$("#purchase_date").val(detail.purchase_date);
    		$("#product_kg").val(detail.product_kg);
    		$("#purchase_count").val(detail.purchase_count);
    		$("#product_name").val(detail.product_name);
    		$("#btnUpdatePurchase").show()
    		$("#btnSavePurchase").hide();
    		$("#btnDeletePurchase").show();
    		
    		gfModalPop("#purchaseInsertModal");
        };
        $.ajax({
        	url:"/purchase/purchaseDetail",
        	type : "post",
        	dataType: "text",
        	async: false,
        	data : param,
        	success : callBackFunction
        });
    }
   /*   $(function(){
    	$(".popup_box").hide()
    	$("body").append("<div id='mask'></div>");
    	
    	$("#mask").click(function(){
    		$(this).hide();
    		$(".popup_box").hide();
    	});
    	
    	$(".btn_open").click(function(){
    		$("#mask").show();
    		$(".popup_box").show().html("<button type='button' class='btn_close'>x</button>"+$("+div",this).html()).css({
    			marginTop:"-"+$(".popup_box").height()/2+"px" , 
    			marginLeft:"-"+$(".popup_box").width()/2+"px" 
    		});
            
    		$(".btn_close").click(function(){
    			$("#mask").hide();
    			$(".popup_box").hide();
    		});
    		return false;
    	});
    });  */
  
    
</script>

</body>
</html>
