<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
   			
		<!-- 갯수가 0인 경우  -->
		<c:if test="${purchaseCnt eq 0 }">
			<tr>
				<td colspan="4">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		
   
   <c:if test="${purchaseCnt > 0}">
       <c:set var="nRow" value="${pageSize * (currentPage - 1)}" />
       <c:forEach items="${purchaseList}" var="list">
           <tr>
               <td>${list.purchase_id}</td>
               <td  ><a href="javascript:purchaseDetailModal(${list.purchase_id});">${list.product_name}</a></td>
               <td>${list.purchase_count}</td>
               <td>${list.purchase_date}</td>
           </tr>
           <c:set var="nRow" value="${nRow + 1}" /> 
       </c:forEach>
   </c:if>
   	<!-- class="btn_open" -->
      <input type="hidden" id="totcnt" name="totcnt" value="${noticeCnt}"/>