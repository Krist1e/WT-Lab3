<%@tag description="Header" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<header>
    <nav class="navbar navbar-expand-sm navbar-light bg-light fixed-top">
        <div class="container">
            <a class="navbar-brand" href="<c:url value="/"/>">LikeIt</a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/"/>"><spring:message code="header.home"/></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/topics"/>"><spring:message code="header.topics"/></a>
                    </li>
                    <sec:authorize access="isAuthenticated()">
                        <sec:authorize access="hasAuthority('ADMIN')">
                            <li class="nav-item">
                                <a class="nav-link" href="<c:url value="/admin/users"/>"><spring:message code="header.users"/></a>
                            </li>
                        </sec:authorize>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false" id="navbarProfile">
                                <spring:message code="header.profile"/> (<sec:authentication property="name"/>) <i class="bi bi-person-circle"></i>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarProfile">
                                <sec:authentication property="name" var="id"/>
                                <li><a class="dropdown-item" href="/profile/${id}"><spring:message code="header.my_profile"/></a></li>
                                <li><a class="dropdown-item" href="/profile/${id}&tab=questions#tabs"><spring:message code="header.my_questions"/></a></li>
                                <li><a class="dropdown-item" href=/profile/${id}&tab=answers#tabs"><spring:message code="header.my_answers"/></a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item link-danger text-danger" href="<c:url value="/logout"/>"><spring:message code="header.logout"/></a></li>
                            </ul>
                        </li>
                    </sec:authorize>
                    <sec:authorize access="isAnonymous()">
                        <li class="nav-item">
                            <a class="nav-link link-primary" href="<c:url value="/login"/>"><spring:message code="header.login"/></a>
                        </li>
                    </sec:authorize>
                    <li class="nav-item dropdown border-start ms-2">
                        <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false" id="navbarLang">
                            <spring:message code="header.lang"/>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarLang">
                            <li><a class="dropdown-item" onclick="changeLocale('en-US')">English</a></li>
                            <li><a class="dropdown-item" onclick="changeLocale('ru-RU')">Русский</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<script>
    function changeLocale(locale) {
        const url = new URL(window.location.href);
        url.searchParams.set('lang', locale);
        window.location.replace(url.href);
    }
</script>
