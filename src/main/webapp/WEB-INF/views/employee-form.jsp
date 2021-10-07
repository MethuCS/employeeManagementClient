<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Form</title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
 rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

</head>
    <body>
        <div class="container">
            <div class="row">
                <div class="card">
                    <div class="card-header header" id="header" style="background-color:#2471A3;">
                        <h2 class="card-title text-center">Employee Management</h2>
                        <p align="right"> Welcome <c:out value ="${user}"/>
                        <input type="button" value="Logout" onclick="window.location.href='logout'; return false;"
                          class="btn btn-danger" />
                        </p>
                    </div>
                    <div class="card-body" style="height: 500px">
                        <div class="card text-center " style=" margin-left: 100px;">
                            <div class="row">
                                <div class="col-md-offset-2 col-md-7">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">
                                            <div class="panel-title"style=" text-align: left;">Employee Details</div><br>
                                        </div>
                                        <div class="panel-body">
                                            <form:form action="saveEmployee" cssClass="form-horizontal"
                                                method="post" modelAttribute="employee">

                                                <!-- need to associate this data with customer id -->
                                                <form:hidden path="employeeCode" />
                                                    <div class="row">
                                                        <div class="row mb-3">
                                                            <label for="employeeName" class="col-md-3 control-label">
                                                                Employee Name
                                                            </label>
                                                            <div class="col-md-9">
                                                                <form:input path="employeeName" cssClass="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="row mb-3">
                                                             <label for="employeeLocation" class="col-md-3 control-label">Location</label>
                                                            <div class="col-md-9">
                                                                <form:textarea path="employeeLocation" cssClass="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="row mb-3">
                                                            <label for="email" class="col-md-3 control-label">Email</label>
                                                            <div class="col-md-9">
                                                                <form:input path="email" cssClass="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="row mb-3">
                                                            <label for="dateOfBirth" class="col-md-3 control-label">Date of Birth</label>
                                                            <div class="col-md-9">
                                                                <form:input path="dateOfBirth" cssClass="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="row mb-3">
                                                           <!-- Button -->
                                                           <div class="col-md-offset-3 col-md-9">
                                                                <form:button type="submit" class="btn btn-primary">Save</form:button>
                                                                <form:button type="reset" class="btn btn-danger">Cancel</form:button>
                                                           </div>
                                                        </div>
                                                    </div>
                                                    </div>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer footer text-center" id="footer" style="background-color:#2471A3;">
                         <h4>Welcome to Employee Management</h4>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>