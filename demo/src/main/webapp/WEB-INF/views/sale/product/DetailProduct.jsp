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
<title>상품 상세 정보</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container mt-5">
		<h2>상품 상세 정보</h2>
		<form id="productDetailForm">
			<div class="form-group">
				<label for="detailProductId">상품 ID</label>
				<input type="text" class="form-control" id="detailProductId" name="productId" value="${detail.productId}" readonly>
			</div>
			<div class="form-group">
				<label for="detailProductName">상품 이름</label>
				<input type="text" class="form-control" id="detailProductName" name="productName" value="${detail.productName}">
			</div>
			<div class="form-group">
				<label for="detailProductCount">상품 수량</label>
				<input type="text" class="form-control" id="detailProductCount" name="productCount" value="${detail.productCount}">
			</div>
			<div class="form-group">
				<label for="detailProductTypeName">상품 유형 ID</label>
				<input type="text" class="form-control" id="detailProductTypeId" name="detailProductTypeId" value="${detail.productTypeId}">
			</div>
			<div class="form-group">
				<label for="detailProductTypeName">상품 유형</label>
				<input type="text" class="form-control" id="detailProductTypeName" name="productTypeName" value="${detail.productTypeName}">
			</div>
			<div class="form-group">
				<label for="detailProductIn">상품 입고일</label>
				<input type="text" class="form-control" id="detailProductIn" name="productIn" value="${detail.productIn}">
			</div>
			<div class="form-group">
				<label for="detailProductKg">상품 무게</label>
				<input type="text" class="form-control" id="detailProductKg" name="productKg" value="${detail.productKg}">
			</div>
			<div class="form-group">
				<label for="detailProductLocation">상품 위치</label>
				<input type="text" class="form-control" id="detailProductLocation" name="productLocation" value="${detail.productLocation}">
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-primary" id="saveChanges">수정</button>
				<button type="button" class="btn btn-danger" id="deleteProduct">삭제</button>
			</div>
		</form>
	</div>

<!-- jQuery and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="/resources/include/js/common.js"></script>
<script>
$(document).ready(function() {
    // Handle save changes button click
    $('#saveChanges').click(function() {
        // Get updated values
        var productId = $('#detailProductId').val();
        var productName = $('#detailProductName').val();
        var productCount = $('#detailProductCount').val();
        var productTypeName = $('#detailProductTypeName').val();
        var productIn = $('#detailProductIn').val();
        var productKg = $('#detailProductKg').val();
        var productLocation = $('#detailProductLocation').val();
        var productTypeId = $('#detailProductTypeId').val(); // 추가된 productTypeId
        
        // Implement AJAX call to save changes to the server
        $.ajax({
            url: '/product/updateProduct',
            type: 'POST',
            data: {
                productId: productId,
                productName: productName,
                productCount: productCount,
                productTypeName: productTypeName,
                productIn: productIn,
                productKg: productKg,
                productLocation: productLocation,
                productTypeId: productTypeId // 추가된 productTypeId
            },
            success: function(response) {
                // Handle success
                alert('Product updated successfully!');
                location.reload(); // Reload the page to reflect changes
            },
            error: function(error) {
                // Handle error
                alert('Failed to update product.');
            }
        });
    });

    // Handle delete button click
    $('#deleteProduct').click(function() {
        var productId = $('#detailProductId').val();
        
        // Implement AJAX call to delete product from the server
        $.ajax({
            url: '/product/deleteProduct',
            type: 'POST',
            data: {
                productId: productId
            },
            success: function(response) {
                // Handle success
                alert('Product deleted successfully!');
                location.reload(); // Reload the page to reflect changes
            },
            error: function(error) {
                // Handle error
                alert('Failed to delete product.');
            }
        });
    });
});

</script>
</body>
</html>
