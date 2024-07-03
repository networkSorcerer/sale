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
<title>Purchase List</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container mt-5">
		<div class="card">
			<div> 
				
			</div>
			<div class="card-header">
				<h2>Purchase List</h2>
			</div>
			<div class="card-body">
				<table class="table table-bordered table-striped">
					<thead class="thead-dark">
						<tr>
							<th>구입 ID</th>
							<th>상품 명</th>
							<th>상품 타입</th>
							<th>구매일</th>
							<th>상품 무게</th>
							<th>상품 수량</th>
						</tr>
					</thead>
					<tbody id="purchaseList">
						<c:forEach var="purchase" items="${purchaseList}">
							<tr>
								<td>${purchase.purchase_id}</td>
								<td>${purchase.product_name}</td>
								<td>${purchase.product_type_name}</td>
								<td><fmt:formatDate value="${purchase.purchase_date}" pattern="yyyy-MM-dd"/></td>
								<td>${purchase.product_kg}</td>
								<td>${purchase.purchase_count}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="/resources/include/js/common.js"></script>
<script>
	$(function(){
		purchaseSearch();
		registerBtnEvent();
		filePreview();
	})
	
	function registerBtnEvent(){
		$("#searchBtn").click(function(e){
			e.preventDefault();
			noticeSearch();
		});
		
		$("a[name=btn]").click(function(e){
			e.preventDefault();
			var btnId = $(this).attr("id");
			
			switch(btnId) {
			case "btnSaveNotice":
				saveNotice();
				break;
			case "btnUpdateNotice":
				updateNotice();
				break;
			
			}
		})
		
	}

</script>
</body>
</html>
