<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$("select").select2();
	});
</script>
<c:if test="${not empty requestScope.delete}">
	<script type="text/javascript" charset="utf-8">
		$(document).ready(function() {
			$("select").select2("enable", false);
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
					<spring:message code="nongrocery.heading.create" />
				</h1>
			</c:when>
			<c:when test="${not empty requestScope.update}">
				<h1 class="page-header">
					<spring:message code="nongrocery.heading.update" />
				</h1>
			</c:when>
			<c:when test="${not empty requestScope.delete}">
				<h1 class="page-header">
					<spring:message code="nongrocery.heading.delete" />
				</h1>
			</c:when>
		</c:choose>
	</div>
</div>
<form:form modelAttribute="nonGrocery"
	action="${pageContext.request.contextPath}${requestScope.action}"
	method="POST" enctype="multipart/form-data">
	<form:hidden path="id" />
	<form:hidden path="path" />
	<div class="form-group">
		<label for="name"><spring:message code="product.name" /></label> 
		<span class="glyphicon glyphicon-ok-circle"></span>
		<form:input path="name" cssClass="form-control" />
		<form:errors path="name" cssClass="alert-danger" />
	</div>
	<div class="form-group">
		<label for="description"><spring:message
				code="product.description" /></label>
		<form:textarea path="description" cssClass="form-control" />
		<form:errors path="description" cssClass="alert-danger" />
	</div>
	<div class="form-group">
		<label for="price"><spring:message code="product.price" /></label>
		<span class="glyphicon glyphicon-ok-circle"></span>
		<form:input path="price" cssClass="form-control" />
		<form:errors path="price" cssClass="alert-danger" />
	</div>
	<div class="form-group">
		<label for="stock"><spring:message code="product.stock" /></label>
		<span class="glyphicon glyphicon-ok-circle"></span>
		<form:input path="stock" cssClass="form-control" />
		<form:errors path="stock" cssClass="alert-danger" />
	</div>
	<div class="form-group">
		<label for="brand"><spring:message code="product.brand" /></label>
		<span class="glyphicon glyphicon-ok-circle"></span>
		<div>
			<form:select path="brand.id" id="brand" cssClass="form-control">
				<form:options items="${brands}" itemLabel="name" itemValue="id" />
			</form:select>
			<form:errors path="brand" cssClass="alert-danger" />
		</div>
	</div>
	<div class="form-group">
		<label for="category"><spring:message code="product.category" /></label>
		<span class="glyphicon glyphicon-ok-circle"></span>
		<div>
			<form:select path="category.id" id="category" cssClass="form-control">
				<form:options items="${categories}" itemLabel="name" itemValue="id" />
			</form:select>
			<form:errors path="category" cssClass="alert-danger" />
		</div>
	</div>
	<div class="form-group">
		<label for="scopeOfUse"><spring:message code="nongrocery.scopeOfUse" /></label>
		<form:input path="scopeOfUse" cssClass="form-control" />
	</div>
	<c:if test="${not requestScope.delete}">
		<div class="form-group">
		    <label for="inputFile"><spring:message code="product.productImage" /></label>
		    <input type="file" id="inputFile" name="inputFile">
	  	</div>
  	</c:if>
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