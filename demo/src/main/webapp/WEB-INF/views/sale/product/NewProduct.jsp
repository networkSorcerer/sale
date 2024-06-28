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
<title>Insert title here</title>
</head>
<body>
		<!-- Add Product Modal -->
	<div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="productModalLabel">상품 추가</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="productForm">
						<div class="form-group">
							<label for="productId">상품 ID</label>
							<input type="text" class="form-control" id="productId" name="productId">
						</div>
						<div class="form-group">
							<label for="productName">상품 이름</label>
							<input type="text" class="form-control" id="productName" name="productName">
						</div>
					<div class="form-group" id="typeList">
					    <label for="productType">상품 타입</label>
					   <select class="form-control" id="productType" name="productType">
						    <c:forEach var="typeList" items="${type}">
						        <option value="${typeList.productTypeId}" data-num="${typeList.productTypeId}">${typeList.productTypeName}</option>
						    </c:forEach>
						</select>

					</div>

					<div class="form-group">
							<label for="productCount">상품 수량</label>
							<input type="text" class="form-control" id="productCount" name="productCount">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="saveProduct">저장</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="/resources/include/js/common.js"></script>

<script>
$(document).ready(function() {

	//Handle save new product button click
	$('#saveProduct').click(function() {
		// Get new product values
		var productId = $('#productId').val();
		var productName = $('#productName').val();
		var productCount = $('#productCount').val();
	
		// Implement AJAX call to save new product to the server
		// Example:
		$.ajax({
			url: '/addProduct', // Update with your server endpoint
			type: 'POST',
			data: {
				productId: productId,
				productName: productName,
				productCount: productCount
			},
			success: function(response) {
				// Handle success
				alert('Product added successfully!');
				location.reload(); // Reload the page to reflect changes
			},
			error: function(error) {
				// Handle error
				alert('Failed to add product.');
			}
		});
	});
});
</script>
</html>