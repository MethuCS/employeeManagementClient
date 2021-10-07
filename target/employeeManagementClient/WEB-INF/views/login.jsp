<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib
uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flight Login Form</title>
        <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" />
        <link href="<c:url value="/resources/css/myStyleSheet.css" />" rel="stylesheet" />
        <script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
        <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container" >
            <div class="row">
                <div class="card" style="height: 400px">
                    <div class="card-header header" id="header" style="background-color:#2471A3;">
                        <h2 class="card-title text-center">Employee Management</h2>
                    </div>
                    <h5>Login</h5>
                    <div class="card-body text-center" style="height: 500px">
                        <div class="card text-center " style=" width: 50rem; margin-left: 140px;">
                        <div class="row">
                            <div class="col-md-6" >
                                <form:form name="submitForm" method="POST" action="loggedIn" >
                                    <div class="row mb-3">
                                        <label for="username" class="col-sm-3 col-form-label">Username:</label>
                                        <div class="col-sm-8">
                                            <input type="text" name="userName" required="" placeholder="Username" />
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="password" class="col-sm-3 col-form-label">Password:</label>
                                        <div class="col-sm-8">
                                            <input type="password" name="password" required="" placeholder="Password"  />
                                        </div>
                                    </div>
                                    <button type="submit" value="login" class="btn btn-primary">Login</button>

                            </div>
                            </div>
                        </div>
                        <div style="color: red">
                            <c:out value ="${error}"/>

                        </div>

                    </div>
                     <div class="card-footer footer text-center" id="footer" style="background-color:#2471A3;">
                     <h4>Welcome to Employee Management</h4>
                    </div>
                                </form:form>
                </div>
            </div>
        </div>
    </body>
</html>