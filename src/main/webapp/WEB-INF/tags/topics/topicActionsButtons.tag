<%@tag description="Question Modal" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/topics"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@attribute name="topic" required="true" type="by.bsuir.alekseeva.forum.entity.Topic" %>

<sec:authorize access="hasAuthority('ADMIN')">
    <a class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editTopicModal"><spring:message code="topic.edit_action"/></a>
    <a class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteTopicModal"><spring:message code="topic.delete_action"/></a>
    <t:editTopicModal topic="${topic}"/>
    <t:deleteTopicModal topic="${topic}"/>
</sec:authorize>