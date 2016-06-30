<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set value="${pageContext.servletContext.contextPath}" var="app"></c:set>
<c:set var="anon" value="${empty currentUser}"></c:set>

<!DOCTYPE html>
<html lang="en">
	<head>
		<c:import url="/imports/head?pageTitle=Shopping List"></c:import>
	</head>
	
	<body>
		<div class="container">
			<c:import url="/imports/mainTopNav?root=true"></c:import>
			
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
			</div>
		</div>
		
		<c:import url="/imports/mainFooter"></c:import>
		<c:import url="/imports/scripts"></c:import>
	</body>
</html>