<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>구매 목록</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
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
        <a class="btnType" href="javascript:insertModal();" name="modal"><span>신규</span></a>
    </div>
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

    <div class="paging_area" id="pagingNavi"></div>

</div>

<div id="purchaseInsertModal" class="layerPop">
    <div class="popup_cont">
        <dl>
            <dt><strong>구매 내역</strong></dt>
            <dd class="content">
                <table class="table table-striped table-bordered">
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
                    <a href="" class="btnType blue" id="btnUpdatePurchase" name="btn" style="display: none"><span>수정</span></a>
                    <a href="" class="btnType blue" id="btnDeletePurchase" name="btn"><span>삭제</span></a>
                    <a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
                </div>
            </dd>
        </dl>
        <a href="" class="closePop"><span class="hidden">닫기</span></a>
    </div>
</div>

<form id="purchaseForm">
    <input type="hidden" id="purchase_id" name="purchase_id" value="">
    <div id="filePopUp" class="layerPop">
        <dl>
            <dt><strong>구매 내역</strong></dt>
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
                            <th>구매일</th>
                            <td><input type="text"></td>
                        </tr>
                    </tbody>
                </table>
                <div class="btn_areaC mt30">
                    <a href="" class="btnType blue" id="btnSavePurchase" name="btn"><span>저장</span></a>
                    <a href="" class="btnType blue" id="btnUpdatePurchase" name="btn" style="display: none"><span>수정</span></a>
                    <a href="" class="btnType blue" id="btnDeletePurchase" name="btn"><span>삭제</span></a>
                    <a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
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
<!-- <script src="/resources/include/js/purchase/pagination.js"></script>
<script src="/resources/include/js/purchase/pagination.min.js"></script> -->
<script src="/resources/include/js/purchase/jquery.blockUI.js"></script>

<script>
var pageSize = 5;
var pageBlockPage = 10;

$(function() {
    purchaseSearch();
    registerBtnEvent();
});

/*$(function() {

    // 페이징 바 클릭 이벤트
    $(document).on("click", ".paging_area", function(e) {
        e.preventDefault();
        var currentPage = $(this).data("page"); // 클릭된 페이지 번호 가져오기
        purchaseSearch(currentPage); // 해당 페이지의 데이터 로드
    });
 */
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
    $("#purchase_id").val("");
    $("#purchase_date").val("");
    $("#product_kg").val("");
    $("#purchase_count").val("");
    $("#product_name").val("");
    $("#btnUpdatePurchase").hide();
    $("#btnSavePurchase").show();
    $("#btnDeletePurchase").hide();

    gfModalPop("#purchaseInsertModal");
}

function savePurchase() {
    if (!fValidate()) {
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
        if (response.result === "success") {
            alert("저장되었습니다");
            gfCloseModal();
            purchaseSearch();
        }
    };
    $.ajax({
        url: "/purchase/purchaseSave",
        type: "post",
        dataType: "json",
        async: false,
        data: param,
        success: callBackFunction
    });
}

function fValidate() {
    var chk = checkNotEmpty([
        ["purchase_date", "구매일을 입력하세요"],
        ["product_kg", "상품무게를 입력하세요"],
        ["purchase_count", "상품수량을 입력하세요"],
        ["product_name", "상품 이름을 입력하세요"]
    ]);
    return chk;
}

function updatePurchase() {
    if (!fValidate()) {
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
        if (response.result == "success") {
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
}

function deletePurchase() {
    if (!fValidate()) {
        return;
    }
    var param = {
        purchase_id: $("#purchase_id").val()
    };
    var callBackFunction = function(response) {
        if (response.result == "SUCCESS") {
            alert("삭제되었습니다");
            gfCloseModal();
            purchaseSearch($("#currentPage").val());
        }
    };
    $.ajax({
        url: "/purchase/deletePurchase",
        data: param,
        type: "post",
        dataType: "json",
        success: callBackFunction,
        acync: false
    });
}
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</body>
</html>
