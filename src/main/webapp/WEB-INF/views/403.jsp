<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<sec:authentication property="principal" var="user"/>
<t:basepage title="403">
    <jsp:body>
        <sec:authorize access="isAnonymous()">
            <jsp:forward page="login.jsp"/>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <div class="container mt-5 ms-5">
                <div class="alert alert-danger" role="alert">
                    <c:if test="${!user.isAccountNonLocked()}">
                        <h4 class="alert-heading"><spring:message code="403.banned"/></h4>
                        <p><spring:message code="403.sorry"/></p>
                    </c:if>
                    <c:if test="${!user.isEnabled()}">
                        <h4 class="alert-heading"><spring:message code="403.title"/></h4>
                        <p><c:choose>
                            <c:when test="${sessionScope.user.role == 'ADMIN'}">
                                <spring:message code="403.admins"/>
                            </c:when>
                            <c:when test="${sessionScope.user.role == 'USER'}">
                                <spring:message code="403.users"/>
                            </c:when>
                        </c:choose>
                            <spring:message code="403.access"/>
                        </p>
                    </c:if>
                    <hr>
                    <p class="mb-0"><spring:message code="403.contact"/></p>
                </div>
            </div>
        </sec:authorize>
    </jsp:body>
</t:basepage>
