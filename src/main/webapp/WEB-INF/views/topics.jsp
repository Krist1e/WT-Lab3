<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/topics" prefix="topics" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:basepage title="Topics">
    <jsp:body>
        <div class="container mt-2">
            <div class="row">
                <div class="col-md-12 d-flex justify-content-between align-items-center">
                    <h1><spring:message code="topics.title"/></h1>
                    <topics:createTopicButton/>
                </div>
                <hr>
            </div>
            <c:forEach items="${topics.content}" var="topica">
                <topics:topicCard topic="${topica}" questions="${topica.questions}"/>
            </c:forEach>
            <t:pagination url="/topics?" page="${topics}"/>
        </div>
    </jsp:body>
</t:basepage>
