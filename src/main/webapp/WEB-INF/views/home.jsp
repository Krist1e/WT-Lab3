<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/home" prefix="h" %>
<%@ taglib tagdir="/WEB-INF/tags/common" prefix="common" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<t:basepage title="Home">
    <jsp:body>
        <div class="container">
            <div class="row">

                <div class="col-md-3 mt-2">
                    <h:topicNamesList topics="${topics.content}"/>
                </div>

                <div class="col-md-9 mt-2">
                    <div class="d-flex justify-content-between align-items-center">
                        <h4><spring:message code="questions.title"/></h4>
                        <common:askButton topicss="${topics.content}"/>
                    </div>
                    <common:questionCardsList questions="${questions.content}"/>
                    <t:pagination url="/?" page="${questions}"/>
                </div>

            </div>
        </div>
    </jsp:body>
</t:basepage>
