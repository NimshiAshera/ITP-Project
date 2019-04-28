<%@page import="java.sql.ResultSet"%>

<%
	String client_id = request.getSession().getAttribute("cId").toString();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<%@include file="Layout/styles.jsp"%>
<title>Spa Facilities</title>
<style type="text/css">
	body{
		overflow:hidden;
	}
</style>
</head>
<body>

	<%@include file="Layout/header.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<%@include file="Layout/navigation.jsp"%>
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
			<div class=" pb-2 mb-3 border-bottom">
				<div class="row">
					<div class="col-8"><h1 class="h2">Spa Facilities</h1></div>
					<div class="col float-right">
						<div class="alert ${message_color} alert-dismissible fade show" role="alert">
						  ${message}
						  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
						    <span aria-hidden="true">&times;</span>
						  </button>
						</div>
					</div>
				</div>
			</div>

			<!--Main content-->
			<div class="col pb-2 mb-3">

				<div class="row">

					<div class="col-3 pl-0">
						<div class="card">
							<div class="card-header bg-secondary text-white">
								<div class="row">
									<div class="col-6">
										<div>Spa identification</div>
									</div>
									<div class="col-6">
										<div class="text-right">${cId}</div>
									</div>
								</div>
							</div>
							<div class="px-2 pt-2 bg-light">
								<img class="card-img-top bg-light"
									src="data:image/jpeg;base64,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"
									alt="Card image cap">
							</div>
							<div class="card-body pt-1 bg-light">
							<div class="mt-3 border border-dark border-top-0 border-left-0 border-right-0 border-bottom-dark text-center py-2 mb-3">Spa details</div>
								<div class="row">
									<div class="col-4">
										<p>Spa</p>
										<p>Address</p>
										<p>Contact</p>
									</div>
									<div class="col">
										<p> : ${cSname} </p>
										<p> : ${cSaddress}</p>
										<p> : ${cScontact}</p>
									</div>
								</div>
								
								<div class="mt-3 border border-dark border-top-0 border-left-0 border-right-0 border-bottom-dark text-center py-2 mb-3">Client details</div>
								<div class="row">
									<div class="col-4">
										<p>Name</p>
										<p>NIC</p>
										<p>Email</p>
										<p>Contact</p>
									</div>
									<div class="col">
										<p> : ${cFname} ${cLname}</p>
										<p> : ${cNic}</p>
										<p> : ${cEmail}</p>
										<p> : ${cContact}</p>
									</div>
								</div>
						
							</div>
						</div>
					</div>
					
					
					<div class="col">
					
						<div class="card">
							<div class="card-header bg-secondary text-white">
								<div class="row">
									<div class="col-12">
										<div class="text-center">Introduce new package</div>
									</div>
								</div>
							</div>
							<div class="card-body py-2 mb-2" style="height:50px;">
								<form action="<%=request.getContextPath()%>/addPackageServerlet" method="post">
								  <div class="form-row">
								  <input type="text" name="client_id" value="${cId}" hidden>
								    <div class="col-5">
								      <input type="text" class="form-control" placeholder="Package name" name="spa_package">
								    </div>
								    <div class="col-2">
								      <input type="text" class="form-control" placeholder="price" name="price">
								    </div>
								    <div class="col-3">
								      <select class="form-control" name="spa_category">
								        <option selected>Facial</option>
								        <option>Waxing</option>
								        <option>Body Treatment</option>
								        <option>Massage Therapy</option>
								      </select>
								    </div>
								    <div class="col">
								      <button type="submit" class="btn btn-primary btn-md btn-block">Add package</button>
								    </div>
								  </div>
								</form>
							</div>
						</div>
						
						
						<div class="row mt-4">
							
							<div class="col-6">
													
								<div class="card">
									<div class="card-header bg-secondary text-white">
										<div class="row">
											<div class="col-6">
												<div>Category type</div>
											</div>
											<div class="col-6">
												<div class="text-right">Facial</div>
											</div>
										</div>
									</div>
									<div class="card-body p-0" style="height:210px; overflow-y:scroll;">
										<table class="table">
											<tbody>
											<%
											ResultSet facialResult = Package.displayPackage(client_id, "Facial");
				                            while(facialResult.next()){
				                        	%>
												<tr>
													<td class="align-middle text-capitalize"><%= facialResult.getString("spa_package") %></td>
													<td class="align-middle">$ <%= facialResult.getDouble("price") %></td>
													<td class="align-middle text-right">
													<a href="<%=request.getContextPath()%>/removePackageServerlet?pid=<%=facialResult.getString("package_id") %>" class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i></a></td>
												</tr>
											<% } %>
											</tbody>
										</table>
									</div>
								</div>
								
						
							</div>
							
							<div class="col-6">
								
								<div class="card">
									<div class="card-header bg-secondary text-white">
										<div class="row">
											<div class="col-6">
												<div>Category type</div>
											</div>
											<div class="col-6">
												<div class="text-right">Waxing</div>
											</div>
										</div>
									</div>
									<div class="card-body p-0" style="height:210px; overflow-y:scroll;">
										<table class="table">
											<tbody>
												<%
												ResultSet waxingResult = Package.displayPackage(client_id, "Waxing");
					                            while(waxingResult.next()){
					                        	%>
													<tr>
														<td class="align-middle text-capitalize"><%= waxingResult.getString("spa_package") %></td>
														<td class="align-middle">$ <%= waxingResult.getDouble("price") %></td>
														<td class="align-middle text-right">
														<a href="<%=request.getContextPath()%>/removePackageServerlet?pid=<%=waxingResult.getString("package_id") %>" class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i></a></td>
													</tr>
												<% } %>
											</tbody>
										</table>
									</div>
								</div>
						
							</div>
						
						</div>
						
						
						<div class="row mt-4">
							
							<div class="col-6">
													
								<div class="card">
									<div class="card-header bg-secondary text-white">
										<div class="row">
											<div class="col-6">
												<div>Category type</div>
											</div>
											<div class="col-6">
												<div class="text-right">Body Treatment</div>
											</div>
										</div>
									</div>
									<div class="card-body p-0" style="height:210px; overflow-y:scroll;">
										<table class="table">
											<tbody>
												<%
												ResultSet BodyTResult = Package.displayPackage(client_id, "Body Treatment");
					                            while(BodyTResult.next()){
					                        	%>
													<tr>
														<td class="align-middle text-capitalize"><%= BodyTResult.getString("spa_package") %></td>
														<td class="align-middle">$ <%= BodyTResult.getDouble("price") %></td>
														<td class="align-middle text-right">
														<a href="<%=request.getContextPath()%>/removePackageServerlet?pid=<%=BodyTResult.getString("package_id") %>" class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i></a></td>
													</tr>
												<% } %>
											</tbody>
										</table>
									</div>
								</div>
								
						
							</div>
							
							<div class="col-6">
								
								<div class="card">
									<div class="card-header bg-secondary text-white">
										<div class="row">
											<div class="col-6">
												<div>Category type</div>
											</div>
											<div class="col-6">
												<div class="text-right">Massage Therapy</div>
											</div>
										</div>
									</div>
									<div class="card-body p-0" style="height:210px; overflow-y:scroll;">
										<table class="table">
											<tbody>
												<%
												ResultSet massageTResult = Package.displayPackage(client_id, "Massage Therapy");
					                            while(massageTResult.next()){
					                        	%>
													<tr>
														<td class="align-middle text-capitalize"><%= massageTResult.getString("spa_package") %></td>
														<td class="align-middle">$ <%= massageTResult.getDouble("price") %></td>
														<td class="align-middle text-right">
														<a href="<%=request.getContextPath()%>/removePackageServerlet?pid=<%=massageTResult.getString("package_id") %>" class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i></a></td>
													</tr>
												<% } %>
											</tbody>
										</table>
									</div>
								</div>
						
							</div>
						
						</div>
						</div>
						
						
					</div>
					
				</div>
				
			<!--End of main content--> </main>
		</div>
	</div>
	<%@include file="Layout/footer.jsp"%>
	<%@include file="Layout/scripts.jsp"%>
</body>
</html>