<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:basepage title="Login">
    <jsp:body>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-4 col-md-offset-4">
                    <h1>Register</h1>
                    <div class="row">
                        <form:form action="/register" method="post" modelAttribute="request">
                            <div class="form-group">
                                <spring:message code="email" var="email"/>
                                <form:label path="email" for="email"><spring:message code="email"/></form:label>
                                <form:input path="email" type="email" class="form-control" id="email" name="email" placeholder="${email}"/>
                            </div>
                            <div class="form-group">
                                <spring:message code="username" var="username"/>
                                <form:label path="username" for="username"><spring:message code="username"/></form:label>
                                <form:input path="username" type="text" class="form-control" id="username" name="username"
                                       placeholder="${username}"/>
                            </div>
                            <div class="form-group">
                                <spring:message code="password" var="password"/>
                                <form:label path="password" for="password"><spring:message code="password"/></form:label>
                                <form:input path="password" type="password" class="form-control" id="password" name="password"
                                       placeholder="${password}"/>
                            </div>
                            <div class="form-group mt-3 d-flex justify-content-between align-items-center">
                                <button type="submit" class="btn btn-primary px-5"><spring:message code="register"/></button>
                                <a href="<c:url value="/login"/>" class="text-decoration-none"><spring:message code="login"/></a>
                            </div>
                            <c:if test="${param.containsKey('error')}">
                                <div class="alert alert-danger mt-3" role="alert">
                                    <spring:message code="error"/>
                                </div>
                            </c:if>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:basepage>
