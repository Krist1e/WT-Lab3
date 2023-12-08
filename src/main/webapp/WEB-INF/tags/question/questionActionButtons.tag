<%@tag description="Question Modal" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="q" tagdir="/WEB-INF/tags/question" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@attribute name="question" required="true" type="by.bsuir.alekseeva.forum.entity.Question" %>
<%@attribute name="user" required="true" type="by.bsuir.alekseeva.forum.entity.User" %>

<c:if test="${user.id == question.author.id}">
    <button type="submit" class="btn btn-outline-primary" style="min-width: 100px;"
    id="edit"><spring:message code="question.edit"/></button>
    <button class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteQuestionModal" style="min-width: 100px;"><fmt:message
        key="question.delete"/></button>
    <q:deleteQuestionModal question="${question}"/>
</c:if>