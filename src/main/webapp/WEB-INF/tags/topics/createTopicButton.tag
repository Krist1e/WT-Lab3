<%@tag description="Question Modal" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/topics"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="hasAuthority('ADMIN')">
    <a class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#createTopicModal">
        <spring:message code="topic.new"/>
    </a>
    <t:createTopicModal/>
</sec:authorize>