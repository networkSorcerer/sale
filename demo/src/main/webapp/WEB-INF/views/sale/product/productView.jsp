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
</head>
<body>
	<div>
		<div>
			<div> 
				<h1>재고 관리</h1>
			</div>
			<div id="productList"> 
				<table> 
					<thead>
						<tr>
							<td>상품 ID</td>
							<td>상품 이름</td>
							<td>상품 수량</td>		
						</tr>
					</thead>
					<tbody id="list">
						<c:choose>
							<c:when test="${not empty productList}">
								<c:forEach var="product" items="${productList}">
									<tr class="text-center" data-num="${product.productId}">
										<td class="id">${product.productId}</td>
										<td class="goDetail">${product.productName}</td>
										<td>${product.productCount}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="3">No products found.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script src="/resources/include/js/jquery-3.7.1.min.js"></script>
<script src="/resources/include/js/common.js"></script>
</html>
