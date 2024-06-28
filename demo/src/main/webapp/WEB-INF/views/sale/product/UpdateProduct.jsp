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
	<div class="modal fade" id="productDetailModal" tabindex="-1" role="dialog" aria-labelledby="productDetailModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div clas="modal-header">
					<h5 class="modal-title" id="productDetailMdoalLabel">상품 수정</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="productDetailForm">
						<div class="form-group">
							<label for="detailProductId">상품 ID</label>
							<input type="text" class="from-control" id="detailProductId" name="productId" readonly>
						</div>
						<div class="form-group">
							<label for="detailProductName">상품 이름</label>
							<input type="text" class="form-control" id="detailProductName" name="productName">
						</div>
						<div class="form-group">
							<label for="detailProductCount">상품 수량</label>
							<input type="text" class="form-control" id="detailProductCount" name="productCount">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" id="deleteProduct">삭제</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="saveChanges">저장</button>
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
	// Load product details into the modal
	$('#productDetailModal').on('show.bs.modal', function(event) {
		var button = $(event.relatedTarget); // Button that triggered the modal
		var productId = button.data('id');
		var productName = button.data('name');
		var productCount = button.data('count');

		var modal = $(this);
		modal.find('#detailProductId').val(productId);
		modal.find('#detailProductName').val(productName);
		modal.find('#detailProductCount').val(productCount);
	});

	// Handle save changes button click
	$('#saveChanges').click(function() {
		// Get updated values
		var productId = $('#detailProductId').val();
		var productName = $('#detailProductName').val();
		var productCount = $('#detailProductCount').val();
		
		// Implement AJAX call to save changes to the server
		// Example:
		
		$.ajax({
			url: '/updateProduct',
			type: 'POST',
			data: {
				productId: productId,
				productName: productName,
				productCount: productCount
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
		// Example:
		
		$.ajax({
			url: '/deleteProduct',
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

	// Handle save new product button click
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