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
<title>재고 관리</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<h1 class="mt-4 mb-4">재고 관리</h1>
			</div>
			<div> 
				<form id="detailForm">
					<input type="hidden" id="productId" name="productId"/>
				</form>
			</div>
			<div class="col-12">
				<!-- Trigger Modal Button -->
				<button type="button" class="btn btn-primary mb-4" id="NewProduct">
					상품 추가
				</button>
				<table class="table table-striped"> 
					<thead>
						<tr>
							<th>상품 ID</th>
							<th>상품 이름</th>
							<th>상품 수량</th>
							<th></th>	
						</tr>
					</thead>
					<tbody id="list">
						<c:choose>
							<c:when test="${not empty productList}">
								<c:forEach var="product" items="${productList}" varStatus="status">
									<tr data-num="${product.productId}">
										<td>${product.productId}</td>
										<td>${product.productName}</td>
										<td>${product.productCount}</td>
										<td><button class="btn btn-info btn-sm goDetail" 
										data-toggle="modal" 
										data-target="#productDetailModal" 
										data-id="${product.productId}" 
										>상세 정보</button></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4">No products found.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>

<!-- jQuery and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="/resources/include/js/common.js"></script>

<script>
$(document).ready(function(){
    $(document).on("click", ".goDetail", function(){
        let productId = $(this).closest("tr").attr("data-num");
        $("#productId").val(productId);  
        $("#detailForm").attr({
            "method":"get",
            "action":"/product/productDetail" // 컨트롤러단 주소
        });
        $("#detailForm").submit();
    });
    $(document).on("click", "#NewProduct", function(){
    	location.href="/product/productInsert"; // 컨트롤러단 주소 
    });
});
</script>

</body>
</html>
