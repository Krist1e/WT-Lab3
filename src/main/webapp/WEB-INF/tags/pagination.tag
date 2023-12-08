<%@ tag description="Pagination" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@attribute name="url" required="true" type="java.lang.String" %>
<%@attribute name="page" required="true" type="org.springframework.data.domain.Page" %>
<%@attribute name="id" required="false" type="java.lang.String" %>

<c:if test="${page.hasNext() || page.hasPrevious()}">
    <nav aria-label="Page navigation" class="mt-5">
        <ul class="pagination">
            <li class="page-item">
                <a class="page-link <c:if test="${!page.hasPrevious()}">disabled</c:if>" href="<c:url value="${url}"/>&page${id}=${page.number-1}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <c:forEach var="i" begin="1" end="${page.totalPages}">
                <li class="page-item <c:if test="${page.number==i}">active</c:if>">
                    <a class="page-link" href="<c:url value="${url}"/>&page${id}=${i}">${i}</a>
                </li>
            </c:forEach>
            <li class="page-item">
                <a class="page-link <c:if test="${!page.hasNext()}">disabled</c:if>" href="<c:url value="${url}"/>&page${id}=${page.number+1}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</c:if>
