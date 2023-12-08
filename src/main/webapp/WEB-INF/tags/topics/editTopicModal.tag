<%@tag description="Question Modal" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@attribute name="topic" required="true" type="by.bsuir.alekseeva.forum.entity.Topic" %>
<div class="modal fade" id="editTopicModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"><spring:message code="topic.edit"/></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form:form id="editTopicForm" method="post" modelAttribute="topic">
                    <div class="mb-3">
                        <form:label path="title" for="title" class="form-label"><spring:message code="topic.title"/></form:label>
                        <form:input path="title" type="text" class="form-control" id="title" name="title" value="${topic.name}"/>
                    </div>
                    <button type="submit" class="btn btn-primary"><spring:message code="topic.edit_action"/></button>
                </form:form>
            </div>
        </div>
    </div>
</div>