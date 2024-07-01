<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page trimDirectiveWhitespaces="true" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 추가</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">상품 추가</h2>
    <form id="productForm">
     <!--    <div class="form-group">
            <label for="productId">상품 ID</label>
            <input type="text" class="form-control" id="productId" name="productId">
        </div> -->
        <div class="form-group">
            <label for="productName">상품 이름</label>
            <input type="text" class="form-control" id="productName" name="productName">
        </div>
        <div class="form-group">
            <label for="productType">상품 타입</label>
            <select class="form-control" id="productType" name="productType">
                <c:forEach var="typeList" items="${type}">
                    <option value="${typeList.productTypeId}">${typeList.productTypeName} (${typeList.productTypeId })</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="productCount">상품 수량</label>
            <input type="text" class="form-control" id="productCount" name="productCount">
        </div>
           <div class="form-group">
            <label for="productCount">상품 무게(kg)</label>
            <input type="text" class="form-control" id="productKg" name="productKg">
        </div>
           <div class="form-group">
            <label for="productCount">창고</label>
            <select class="form-control" id="cargo" name="cargo">
            	  <c:forEach var="cargo" items="${cargo}">
                    <option value="${cargo.cargoId}">${cargo.cargoName} (${cargo.cargoId })</option>
                </c:forEach>
            </select>
            
        </div>
           <div class="form-group">
            <label for="productCount">창고 포지션</label>
            <select class="form-control" id="position" name="position">
            	  <c:forEach var="position" items="${position}">
                    <option value="${position.cargoPositionId}">${position.cargoPositionId} (수용 가능 : )</option>
                </c:forEach>
            </select>
            
        </div>
        
        <button type="button" class="btn btn-success" id="productList">목록</button>
        <button type="button" class="btn btn-primary" id="saveProduct">저장</button>
        
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="/resources/include/js/common.js"></script>

<script>
$(document).ready(function() {
    // Handle save new product button click
    $('#saveProduct').click(function() {
        // Get new product values
        var productName = $('#productName').val();
        var prouctTypeId =$('#productTypeId').val();
        var productCount = $('#productCount').val();
		var productKg= $('#productKg').val();
		var productLocation = $('#productLocation').val();
        // Implement AJAX call to save new product to the server
        $.ajax({
            url: '/product/', // Update with your server endpoint
            type: 'POST',
            data: {
                productName: productName,
                productCount: productCount,
                productTypeId: productTypeId,
                productKg: productKg,
                productLocation : productLocation
            },
            success: function(response) {
                // Handle success
                alert('Product added successfully!');
                window.location.href='/prouct/productList';// Reload the page to reflect changes
            },
            error: function(error) {
                // Handle error
                alert('Failed to add product.');
            }
        });
    });
    $('#productList').click(function(){
    	window.location.href='/product/productList';
    })
});
</script>
</body>
</html>
