<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/question" prefix="q" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:basepage title="${question.title}">
    <jsp:body>
        <div class="container ps-5">
            <q:question user="${user}" question="${question}"/>
            <div class="row">
                <hr>
            </div>
            <div class="row mb-3">
                <h4><c:out value="${question.answersCount}"/> <spring:message code="question.answers_count"/></h4>
            </div>
            <c:forEach var="answer" items="${answers.content}">
                <q:answer answer="${answer}" vote="${answer.votes}"/>
            </c:forEach>
            <t:pagination url="/question?${question.id}" page="${answers}"/>
            <div class="row mb-3">
                <h4><spring:message code="question.your_answer"/></h4>
                <form:form action="/answer/${question.id}" method="post" modelAttribute="answerRequest">
                    <div class="mb-3">
                        <form:label path="text" for="text" class="form-label"><spring:message code="question.answer"/></form:label>
                        <form:textarea path="text" class="form-control" id="text" name="text" rows="3"/>
                    </div>
                    <button type="submit" class="btn btn-primary"><spring:message code="question.add_answer"/></button>
                </form:form>
            </div>
        </div>
    </jsp:body>
</t:basepage>
