<%@tag description="Question Modal" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="common" tagdir="/WEB-INF/tags/common"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@attribute name="topicss" required="false" type="java.util.List<by.bsuir.alekseeva.forum.entity.Topic>" %>
<%@attribute name="topic" required="false" type="by.bsuir.alekseeva.forum.entity.Topic" %>

<sec:authorize access="isAuthenticated()">
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#askQuestionModal">
        <spring:message code="questions.ask"/>
    </button>
    <common:askQuestionModal topicss="${topicss}" topic="${topic}"/>
</sec:authorize>
<sec:authorize access="isAnonymous()">
    <a href="<c:url value="/login"/>" class="btn btn-primary">
        <spring:message code="questions.ask"/>
    </a>
</sec:authorize>