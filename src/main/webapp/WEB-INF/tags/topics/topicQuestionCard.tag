<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="d" uri="date" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@attribute name="question" required="true" type="by.bsuir.alekseeva.forum.entity.Question" %>
<div class="card m-2 flex-shrink-0">
    <div class="card-body">
        <h5 class="card-title"><a href="<c:url value="/question/${question.id}"/>" class="text-decoration-none"><c:out value="${question.title}"/></a></h5>
        <p class="card-text"><c:if test="${fn:length(question.text) > 100}"><c:out
                value="${fn:substring(question.text, 0, 100)}"/>...</c:if><c:if
                test="${fn:length(question.text) <= 100}"><c:out value="${question.text}"/></c:if></p>
        <div class="d-flex gap-2 align-items-end">
            <div class="small text-muted"><spring:message code="question.asked_by"/></div>
            <a href="<c:url value="/profile/${question.author.id}"/>" class="link-primary text-decoration-none lead" style="line-height: 1.2;"><c:out
                    value="${question.author.username}"/></a>
            <div class="small text-muted"><spring:message code="question.at"/> <c:out value="${d:formatLocalDateTime(question.askTime)}"/></div>
        </div>
    </div>
</div>