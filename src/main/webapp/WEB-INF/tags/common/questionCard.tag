<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib uri="date" prefix="d" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@attribute name="question" required="true" type="by.bsuir.alekseeva.forum.entity.Question" %>
<div class="list-group-item card">
    <div class="row g-0 g-md-3">
        <div class="col-md-2 d-flex flex-column align-items-md-end align-items-center justify-content-center">
            <div><spring:message code="question.views"/>: ${question.viewsCount}</div>
            <div><spring:message code="question.answers"/>: ${question.answersCount}</div>
        </div>
        <div class="col-md-10">
            <div class="card-body">
                <h5 class="card-title"><a href="<c:url value="/question/${question.id}"/>" class="text-decoration-none">${question.title}</a></h5>
                <p class="card-text">${question.text}</p>
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <a href="<c:url value="/topic/${question.topic.id}"/> " class="badge bg-info text-decoration-none">${question.topic.name}</a>
                    </div>
                    <div class="d-flex gap-2 align-items-end">
                        <div class="small text-muted"><spring:message code="question.asked_by"/></div>
                        <a href="<c:url value="/profile/${question.author.id}"/>" class="link-primary text-decoration-none lead"
                           style="line-height: 1.2;">${question.author.username}</a>
                        <div class="small text-muted"><spring:message code="question.at"/> ${d:formatLocalDateTime(question.askTime)}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>