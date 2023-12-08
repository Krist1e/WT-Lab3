<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/home" prefix="h" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@attribute name="topics" required="true" type="java.util.List<by.bsuir.alekseeva.forum.entity.Topic>" %>
<h4><spring:message code="topics.title"/></h4>
<div class="list-group mt-3">
    <c:forEach items="${topics}" var="topic">
        <h:topicName topic="${topic}"/>
    </c:forEach>
</div>