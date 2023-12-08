<%@tag description="Question Modal" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@attribute name="topicss" required="false" type="java.util.List<by.bsuir.alekseeva.forum.entity.Topic>" %>
<%@attribute name="topic" required="false" type="by.bsuir.alekseeva.forum.entity.Topic" %>
<div class="modal fade" id="askQuestionModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"><spring:message code="questions.ask"/></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form:form action="/question" method="post" modelAttribute="question">
                    <div class="mb-3">
                        <form:label path="topicId" for="topic" class="form-label"><spring:message
                                code="questions.topic"/></form:label>
                        <c:if test="${empty topicss}">
                            <label for="topicName"></label>
                            <input type="text" class="form-control" id="topicName" name="topicName"
                                   value="${topic.name}"/>
                            <form:input path="topicId" type="hidden" id="topicId" name="topicId" value="${topic.id}"/>
                        </c:if>
                        <c:if test="${not empty topicss}">
                            <form:select path="topicId" class="form-select" id="topicId" name="topic">
                                <form:option value="0"><spring:message
                                        code="questions.selectTopic"/></form:option>
                                <c:forEach items="${topicss}" var="topic">
                                    <form:option value="${topic.id}">${topic.name}</form:option>
                                </c:forEach>
                            </form:select>
                        </c:if>
                    </div>
                    <div class="mb-3">
                        <form:label path="title" for="title" class="form-label"><spring:message code="question.title"/></form:label>
                        <form:input path="title" type="text" class="form-control" id="title" name="title"/>
                    </div>
                    <div class="mb-3">
                        <form:label path="text" for="text" class="form-label"><spring:message
                                code="questions.body"/></form:label>
                        <form:textarea path="text" class="form-control" id="text" name="text" rows="3"/>
                    </div>
                    <button type="submit" class="btn btn-primary"><spring:message code="questions.submit"/></button>
                </form:form>
            </div>
        </div>
    </div>
</div>