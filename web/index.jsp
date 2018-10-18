<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: johnanna
  Date: 2018/9/20
  Time: 下午4:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<c:out value="this is JSTL"/>
<br/>

<!-- if标签的使用-->
<form action="index.jsp" method="post">
    <input type="text" name="score" value="${param.score}"/>
    <input type="submit"/>
</form>

<c:if test="${param.score >= 90}" var="result">
    <c:out value="你的成绩非常优秀"/>
</c:if>
<c:out value="${result}"/>
<br/>
<!-- choose、when、otherwise标签结合使用 -->
<c:choose>
    <c:when test="${param.score > 90}">
        <c:out value="你的成绩很优秀"/>
    </c:when>
    <c:otherwise>
        <c:out value="少年还需努力"/>
    </c:otherwise>
</c:choose>

<!-- foreach 循环标签 -->
<br/>
<%
    List<String> fruits = new ArrayList<>();
    fruits.add("111");
    fruits.add("222");
    fruits.add("333");
    fruits.add("444");
    fruits.add("555");
    fruits.add("111");
    request.setAttribute("fruits", fruits);
%>
<c:forEach var="fruit" items="${fruits}" varStatus="fru">
    <c:out value="${fruit}"/><br/>
    <%--<c:out value="${fru.index}"/><br/>--%>
    <%--<c:out value="${fru.count}"/><br/>--%>
<%--<c:out value="${fru.first}"/><br/>--%>
<%--<c:out value="${fru.last}"/><br/>--%>
</c:forEach>

<!-- forTokens切割字符串 -->
<c:forTokens items="000-111-222-333" delims="-" var="item">
    <c:out value="${item}"/><br/>
</c:forTokens>

<!-- import标签 -->
<c:catch var="error01">
    <c:import url="/index.jsp" context="/AjaxStudy" charEncoding="UTF-8"/>
</c:catch>
<c:out value="${error01}"/>
</body>
</html>
