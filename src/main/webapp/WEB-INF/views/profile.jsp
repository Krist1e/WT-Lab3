<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/common" %>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags/profile" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<t:basepage title="Profile">
    <jsp:body>
        <div class="container ps-5">
            <div class="row">
                <h1 class="display-3">${user.username}</h1>
                <p class="small text-muted"><spring:message code="profile.member_since"/>: ${user.registrationDate}</p>
                <div class="d-flex flex-column">
                    <div>
                        <p class="lead"><spring:message code="profile.reputation"/>: ${user.reputation}</p>
                    </div>
                    <div class="d-flex flex-row gap-5">
                        <p><spring:message code="profile.questions"/>: ${user.questionsCount}</p>
                        <p><spring:message code="profile.answers"/>: ${user.answersCount}</p>
                    </div>
                </div>
            </div>

            <ul class="nav nav-tabs" id="tabs">
                <li class="nav-item">
                    <a class="nav-link <c:if test="${param.tab == 'questions'}">active</c:if>" id="questionsTab" data-bs-toggle="tab" href="#questions"><spring:message code="profile.questions"/></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <c:if test="${param.tab == 'answers'}">active</c:if>" id="answersTab" data-bs-toggle="tab" href="#answers"><spring:message code="profile.answers"/></a>
                </li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane fade <c:if test="${param.tab == 'questions'}">show active</c:if>"  id="questions">
                    <common:questionCardsList questions="${questions.content}"/>
                    <t:pagination url="/profile/${user.id}&tab=questions" page="${questions}" id="Questions"/>
                </div>
                <div class="tab-pane fade <c:if test="${param.tab == 'answers'}">show active</c:if>" id="answers">
                    <p:profileAnswersList answers="${answers.content}"/>
                    <t:pagination url="/profile/${user.id}&tab=answers" page="${answers}" id="Answers"/>
                </div>
            </div>
        </div>
    </jsp:body>
</t:basepage>
