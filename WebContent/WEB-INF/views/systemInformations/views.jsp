<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$('#systemInformations_table').dataTable({
			"bProcessing" : true,
			"bServerSide" : true,
			"sAjaxDataProp" : "rows",
			"aoColumns" : [
				{"mData" : "id"},
				{"mData" : "name"},
				{"mData" : "creationDate"},
				{"sName" : "id",
					"bSearchable" : false,
					"bSortable" : false,
					"sDefaultContent" : "",
					"fnRender" : function(oObj) {
						return "<a href='${pageContext.request.contextPath}/systemInformations/update.do?id="
								+ oObj.aData['id']
								+ "'><span class='glyphicon glyphicon-pencil'></span></a>"
								+ " | "
								+ "<a href='${pageContext.request.contextPath}/systemInformations/delete.do?id="
								+ oObj.aData['id']
								+ "'><span class='glyphicon glyphicon-trash'></span></a>";
							}
						} ],
				"sAjaxSource" : "${pageContext.request.contextPath}/systemInformations/findAllSystemInformationsPaginated.do",
				"oLanguage" : {"sUrl" : "${pageContext.request.contextPath}/resources/datatables/i18n/italian.properties"},
				"fnServerParams" : addsortparams
			});

	});
</script>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">
			<spring:message code="backend.menu.managesysteminformations" />
		</h1>
	</div>
</div>
<a class="btn btn-primary btn-small"
	href="${pageContext.request.contextPath}/systemInformations/create"><spring:message
		code="common.addbutton" /></a>
<br />
<br />
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<spring:message code="systeminformation.table.heading" />
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover"
						id="systemInformations_table">
						<thead>
							<tr>
								<th><spring:message code="backend.common.id" /></th>
								<th><spring:message code="systeminformation.name" /></th>
								<th><spring:message code="systeminformation.creationDate" /></th>
								<th><spring:message code="common.actions" /></th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>