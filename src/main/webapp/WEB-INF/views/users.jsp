<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/users" prefix="u" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:basepage title="Users">
    <jsp:body>
        <div class="container">
        <div class="row">
            <h1><spring:message code="users.title"/></h1>
            <hr>
        </div>

        <div class="list-group gap-2">
            <c:forEach items="${users.content}" var="user">
                <u:userCard user="${user}"/>
            </c:forEach>
            <t:pagination url="/users?" page="${users}"/>
        </div>
    </jsp:body>
</t:basepage>