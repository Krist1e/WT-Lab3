<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@attribute name="topic" required="true" type="by.bsuir.alekseeva.forum.entity.Topic" %>
<div class="list-group-item">
    <a href="<c:url value="/topic/${topic.id}"/>" class="text-decoration-none"><c:out value="${topic.name}"/></a>
    <span class="badge bg-primary rounded-pill float-end"><c:out value="${topic.questionsCount}"/></span>
</div>