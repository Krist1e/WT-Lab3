<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="d" uri="date" %>

<%@attribute name="user" required="true" type="by.bsuir.alekseeva.forum.entity.User" %>

<div class="list-group-item card">
    <div class="card-body d-flex justify-content-between align-items-center">
        <div>
            <h5 class="card-title"><a href="<c:url value="/profile/${user.id}"/>" class="text-decoration-none"><c:out value="${user.username}"/></a></h5>
            <div class="card-text d-flex flex-column flex-md-row gap-4 align-items-md-center">
                <div class="card-text"><spring:message code="user.email"/>: <c:out value="${user.email}"/></div>
                <div class="card-text"><spring:message code="user.role"/>: <c:out value="${user.role}"/></div>
                <div class="card-text"><spring:message code="user.registration_date"/>: <c:out value="${user.registrationDate}"/></div>
                <div class="card-text"><spring:message code="user.reputation"/>: <c:out value="${user.rating}"/></div>
            </div>
        </div>
        <c:if test="${user.accountNonLocked}">
            <a href="<c:url value="/users/ban/${user.id}"/>" class="btn btn-danger"><spring:message code="user.ban"/></a>
        </c:if>
        <c:if test="${!user.accountNonLocked}">
            <a href="<c:url value="/users/unban/${user.id}"/>" class="btn btn-secondary"><spring:message code="user.unban"/></a>
        </c:if>
    </div>
</div>