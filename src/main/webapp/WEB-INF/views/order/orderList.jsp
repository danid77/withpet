<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="../layout/header.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:choose>
  <c:when test="${empty list}">
    결제가 완료된 상품이 없습니다.
  </c:when>
  <c:otherwise>
    <table class="table">
        <tr>
            <th>주문번호</th>
            <th>상품명</th>
            <th>결제 일시</th>
            <th>총 결제금액</th>
        </tr>
      <c:forEach var="row" items="${list}" varStatus="i">
         <c:choose>
          <c:when test="${row.ord_step eq '주문취소'}">
              <tr><td colspan="4"> 취소된 주문입니다.</td></tr>
          </c:when>
          <c:otherwise>
        <tr>
          <td>${row.o_no}</td>
          <td><a href = "${path}/orderDetail?o_no=${row.o_no}"> ${row.pro_name} </a>
          </td>
          <td>
            <fmt:formatDate value="${row.ord_regdate}" pattern="yyyy-MM-dd HH:mm"/>
          </td>
          <td>${row.ord_price}</td>
        </tr>
          </c:otherwise>
         </c:choose>
      </c:forEach>
</table>

  </c:otherwise>
</c:choose>


</body>
</html>