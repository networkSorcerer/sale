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
	<div>
		<div>
			<div>
				<table>
					<tr>
						<td>구입 ID</td>
						<td>상품 명</td>
						<td>상품 타입</td>
						<td>구매일</td>
						<td>상품 무게</td>
						<td>상품 수</td>
					</tr>
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
				</table>
			</div>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="/resources/include/js/common.js"></script>
</html>