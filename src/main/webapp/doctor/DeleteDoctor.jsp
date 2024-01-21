<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Profile</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("../img/hospital.png");
	height: 30vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<%@include file="../component/navbar.jsp"%>

	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-9">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Doctor Profile</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Full Name</th>
									<th scope="col">Dob</th>
									<th scope="col">Qualification</th>
									<th scope="col">Email</th>
									<th scope="col">MobNo</th>
									<th scope="col">Action</th>

								</tr>
							</thead>
							<tbody>
								<%
								Doctor doc = (Doctor) session.getAttribute("doctObj");
								DoctorDao dao = new DoctorDao(DBConnect.getConn());
								List<Doctor> list = dao.getDoctorDetailsByID(doc.getId());
								for (Doctor d : list) {
								%>
								<tr>
									<th><%=d.getId()%></th>
									<th><%=d.getFullName()%>></th>
									<th><%=d.getDob()%></th>
									<th><%=d.getQualification()%></th>
									<th><%=d.getEmail()%></th>
									<th><%=d.getMobNo()%></th>
									<td>
										<a
										href="../deleteProfile?id=<%=d.getId()%>"
										class="btn btn-sm btn-danger">Delete</a></td>
								</tr>
								<%
								}
								%>



							</tbody>
						</table>

					</div>
				</div>
			</div>

			<div class="col-md-3 p-3">
				<img alt="" src="../img/doctor.jpg" width="400px">
			</div>
		</div>
	</div>


</body>
</html>