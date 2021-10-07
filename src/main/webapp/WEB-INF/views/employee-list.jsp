<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
    <head>
        <%@ page isELIgnored="false" %>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Employee Lists</title>
        <link href="<c:url value="/resources/css/bootstrap.min.css" />"
         rel="stylesheet">
        <script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
        <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <style>
         table, th, td {
            border: 1px solid black;
          }

        </style>
    </head>
    <body>

        <div class="container" >
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
                                <div class="col-md-offset-1 col-md-10">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">
                                            <div class="panel-title" style=" text-align: left;">Employee Listings</div>
                                        </div>
                                        <div class="panel-body" style="min-height: 100px; max-height: 400px;overflow-y: scroll;">
                                            <p align="right">
                                                <input type="button" value="Upload Employee Details"
                                                    onclick="window.location.href='showForm'; return false;"
                                                    class="btn btn-primary" />
                                                <input type="button" value="Download Employee Details"
                                                    class="btn btn-info" />
                                            </p>
                                            <table class="table table-striped table-bordered" style="table-layout: fixed;">
                                                <tr>
                                                    <th>Employee Code</th>
                                                    <th>Employee Name</th>
                                                    <th>Location</th>
                                                    <th>Email</th>
                                                    <th>Date Of Birth</th>
                                                    <th>Action</th>
                                                </tr>

                                                <!-- loop over and print our employee -->
                                                <c:forEach var="employee" items="${employees}">
                                                 <!-- construct an "update" link with employee code -->
                                                       <c:url var="updateLink" value="/employee/update">
                                                        <c:param name="employeeCode" value="${employee.employeeCode}" />
                                                       </c:url>

                                                       <!-- construct an "delete" link with customer id -->
                                                       <c:url var="deleteLink" value="/employee/delete">
                                                        <c:param name="employeeCode" value="${employee.employeeCode}" />
                                                       </c:url>
                                                <tr>
                                                    <td>${employee.employeeCode}</td>
                                                    <td>${employee.employeeName}</td>
                                                    <td>${employee.employeeLocation}</td>
                                                    <td>${employee.email}</td>
                                                    <td>${employee.dateOfBirth}</td>
                                                    <td>
                                                     <!-- display the update link --> <a href="${updateLink}">Update</a>
                                                             | <a href="${deleteLink}"
                                                             onclick="if (!(confirm('Are you sure you want to delete this employee?'))) return false">Delete</a>
                                                    </td>
                                               </tr>
                                              </c:forEach>
                                            </table>
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
