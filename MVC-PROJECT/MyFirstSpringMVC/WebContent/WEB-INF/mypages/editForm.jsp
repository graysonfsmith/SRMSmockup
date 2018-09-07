<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

	<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../resources/css/bootstrap.css"/>
    <link rel="stylesheet" href="../resources/css/animate.css"/>
    <link rel="stylesheet" href=".\css\all.css"/>


<style>

 .titleRow{
    
    background-color: #007bff;;
    
   }
   
   body{
	 background-color: lightblue;
	}
   
   
    h1{
    
    color: white;
    
    }

</style>
</head>
<body>

<div class="container-fluid">
  <div class="row titleRow">
  <div class="col">

  <h1>
  Employee Management System
  </h1>

  </div>
  <div class="col-xs">
  
  <a href="/MyFirstSpringMVC/"><img src="../resources/logo.png" height="64px" width="64px"/></a>
  
  </div>
  </div>
</div>

<div class="container">

<h2>
<br>
<br>
Enter Employee Information to Edit
<br>
<br>
</h2>

</div>

<div class="container">


	<form:form class="form" action="../editSave" method="post">
	<div class="input-group mb-3">
		  <div class="input-group-prepend">
    		<span class="input-group-text">ID</span>
  		  </div>
		<form:input class="form-control" readonly="true" path="eid"/>
	</div>
	<div class="input-group mb-3">
		<div class="input-group-prepend">
    		<span class="input-group-text">Name</span>
  		  </div>
		<form:input class="form-control" readonly="true" path="ename"/>
	</div>
	<div class="input-group mb-3">
		<div class="input-group-prepend">
    		<span class="input-group-text">City</span>
  		  </div>
		<form:input class="form-control" path="ecity"/>
	</div>
	<div class="input-group mb-3">
		<div class="input-group-prepend">
    		<span class="input-group-text">Salary</span>
  		  </div>
		<form:input  class="form-control" path="esalary"/>
	</div>
	<div class="input-group mb-3">
		<input class="btn btn-primary" type="submit" value="SAVE"/>
	</div>
	</form:form>

	
</div>
</body>
</html>