<%@page import="com.entity.Appointment"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment Status</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Appointment Details</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						AppointmentDAO dao2 = new AppointmentDAO(DBConnect.getConn());
						Appointment ap = dao2.getAppointmentById(id);
						%>


						<form action="./updateAppointment" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullName" class="form-control"
									value="<%=ap.getFullName()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Gender</label> <input type="text"
									value="<%=ap.getGender()%>" required name="gender"
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Age</label> <input required
									value="<%=ap.getAge()%>" name="age"
									type="text" class="form-control">
							</div>
							
							<div class="mb-3">
								<label class="form-label">Appointment Date</label> <input required
									value="<%=ap.getAppoinDate() %>" name="appoint_date"
									type="date" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Diseases</label> <input type="text"
									value="<%=ap.getDiseases()%>" required name="diseases"
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Doctor Name</label> <select name="doctor_id"
									required class="form-control">
									<option><%=ap.getDoctorId()%></option>

									<%
									DoctorDao dao = new DoctorDao(DBConnect.getConn());
									List<Doctor> list = dao.getAllDoctor();
									for (Doctor d : list) {
									%>
									<option><%=d.getFullName()%></option>
									<%
									}
									%>


								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Status</label> <input type="text"
									value="<%=ap.getStatus()%>" required name="status"
									class="form-control">
							</div>
							
							<input type="hidden" name="id" value="<%=ap.getId()%>">
							<input type="hidden" name="user_id" value="<%=ap.getUserId()%>">
							
							<button type="submit" class="btn btn-primary col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>




		</div>
	</div>
</body>
</html>