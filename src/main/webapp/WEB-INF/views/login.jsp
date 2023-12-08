<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<t:basepage title="Login">
    <jsp:body>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-4 col-md-offset-4">
                    <h1>Login</h1>
                    <div class="row">
                            <%--@elvariable id="request" type="by.bsuir.alekseeva.forum.dto.request.AuthenticationRequest"--%>
                        <form:form action="/login" method="post" modelAttribute="request">
                            <div class="form-group">
                                <form:label path="username" for="username"><spring:message code="username"/></form:label>
                                <spring:message code="username" var="username"/>
                                <form:input path="username" type="text" class="form-control" id="username" name="username" placeholder="${username}" required="required" autofocus="autofocus" value="${not empty param.username ? param.username : ''}"/>
                            </div>
                            <div class="form-group">
                                <form:label path="password" for="password"><spring:message code="password"/></form:label>
                                <spring:message code="password" var="password"/>
                                <form:input path="password" type="password" class="form-control" id="password" name="password" placeholder="${password}" required="required" minlength="6"/>
                            </div>
                            <div class="form-group mt-3 d-flex justify-content-between align-items-center">
                                <button type="submit" class="btn btn-primary px-5"><spring:message code="login"/></button>
                                <a href="<c:url value="/register"/>" class="text-decoration-none"><spring:message code="register"/></a>
                            </div>
                            <c:if test="${param.containsKey('error')}">
                                <div class="alert alert-danger mt-3" role="alert">${param.get('error')}</div>
                            </c:if>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:basepage>