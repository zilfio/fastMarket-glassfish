<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${not empty requestScope.delete}">
	<script type="text/javascript" charset="utf-8">
		$(document).ready(function() {
			$(":input[type='text'],textarea").each(function() {
				$(this).attr('disabled', 'disabled');
			});
		});
	</script>
</c:if>
<div class="row">
	<div class="col-lg-12">
		<c:choose>
			<c:when test="${not empty requestScope.create}">
				<h1 class="page-header">
					<spring:message code="brand.heading.create" />
				</h1>
			</c:when>
			<c:when test="${not empty requestScope.update}">
				<h1 class="page-header">
					<spring:message code="brand.heading.update" />
				</h1>
			</c:when>
			<c:when test="${not empty requestScope.delete}">
				<h1 class="page-header">
					<spring:message code="brand.heading.delete" />
				</h1>
			</c:when>
		</c:choose>
	</div>
</div>
<form:form modelAttribute="brand"
	action="${pageContext.request.contextPath}${requestScope.action}"
	method="POST">
	<form:hidden path="id" />
	<div class="form-group">
		<label for="name"><spring:message code="brand.name" /></label> <span
			class="glyphicon glyphicon-ok-circle"></span>
		<form:input path="name" cssClass="form-control" autofocus="true" />
		<form:errors path="name" cssClass="alert-danger" />
	</div>
	<div class="form-group">
		<label for="description"><spring:message
				code="brand.description" /></label>
		<form:textarea path="description" cssClass="form-control" />
		<form:errors path="description" cssClass="alert-danger" />
	</div>
	<div class="form-group">
		<label for="provenance"><spring:message
				code="brand.provenance" /></label>
		<form:input path="provenance" cssClass="form-control" />
		<form:errors path="provenance" cssClass="alert-danger" />
	</div>
	<div class="form-group">
		<c:choose>
			<c:when test="${!requestScope.delete}">
				<button type="submit" class="btn btn-primary">
					<spring:message code="common.submit" />
				</button>
			</c:when>
			<c:otherwise>
				<button type="submit" class="btn btn-danger">
					<spring:message code="common.delete" />
				</button>
			</c:otherwise>
		</c:choose>
	</div>
</form:form>