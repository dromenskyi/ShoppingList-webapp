<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set value="${pageContext.servletContext.contextPath}" var="app"></c:set>
<c:set var="anon" value="${empty currentUser}"></c:set>

<!DOCTYPE html>
<html lang="en">
	<head>
		<c:import url="/imports/head?pageTitle=Shopping List"></c:import>
		<link rel="stylesheet" href="${app }/res/shoplist/css/fix-lists.css">
	</head>
	
	<body>
		<div class="page container">
			<c:import url="/imports/mainTopNav?root=true"></c:import>
			
			<div class="main-content">
				<div class="row lists">
					<div class="list-wrapper list-new col-sm-6 col-md-4">
						<div class="panel panel-primary">
							<div class="panel-heading">
								New List
							</div>
							<div class="panel-body">
								What is needed?
							</div>
							<c:import url="/imports/newListBody"></c:import>
							<div class="panel-footer">
								Link here
							</div>
						</div>
					</div>
	
					<c:forEach items="${anonLists }" var="anonList">
						<div class="list-wrapper list-saved col-sm-6 col-md-4">
							<div id="${anonList.key }" class="panel panel-success">
								<div class="panel-heading">
									${anonList.key }
								</div>
								<div class="panel-body">
									List Items:
								</div>
								
								<table class="table table-condensed">
									<tr class="wait-sign">
										<td>
											<p class="text-center">
												<i class="fa fa-refresh fa-spin fa-2x"></i>
											</p>
										</td>
									</tr>
								</table>
								<button type="button" class="btn btn-primary btn-sm btn-block buy-list-btn">Buy</button>
								
								<div class="panel-footer">
									<a href="${app }/lists/${anonList.key}">/lists/${anonList.key }</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<c:import url="/imports/mainFooter"></c:import>
		</div>

		<c:import url="/imports/scripts"></c:import>
		<script type="text/javascript" src="${app }/res/shoplist/js/listController.js"></script>
	</body>
</html>