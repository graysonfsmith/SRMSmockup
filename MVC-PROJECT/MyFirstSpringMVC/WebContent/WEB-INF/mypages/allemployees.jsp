<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

	<link rel="stylesheet" href="resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="resources/css/bootstrap.css"/>
    <link rel="stylesheet" href="resources/css/animate.css"/>
    <link rel="stylesheet" href=".\css\all.css"/>


<style>

 .titleRow{ 
    background-color: #007bff;;
   }
   
   body{
	 background-color: lightblue;
	}
	
	.modal-header{
	background-color: #32383e;
	}
   
   
    h1{
    
    color: white;
    
    }
    h3{
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
  
  <a href="/MyFirstSpringMVC/"><img src="resources/logo.png" height="64px" width="64px"/></a>
  
  </div>
  </div>
</div>

<div class="containter">
<table class="table table-dark">
<tr>
	<th>ID</th>
	<th>NAME</th>
	<th>CITY</th>
	<th>SALARY</th>
	<th>EDIT</th>
	<th>DELETE</th>	
</tr>
<c:forEach var="emp" items="${emplist}">
	<tr>
	<td class="animated flipInX">${emp.eid}</td>
	<td  class="animated flipInX">${emp.ename}</td>
	<td class="animated flipInX">${emp.ecity}</td>
	<td class="animated flipInX">${emp.esalary}</td>
	<td>  
	<!--<form action="editEmployee/${emp.eid}">
  	</form>-->
  	<button type="button" class="animated flipInX btn btn-primary edit-employee" data-toggle="modal" data-target="#Modal" id="viewDetailButton">Edit</button>
                  <!-- Modal -->
                  <div class="modal fade" id="Modal" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
			    		<div class="modal-content">
			      		<div class="modal-header">
						<div class="container-fluid">
						<div class="row">
						<h3>
							<br>
							Enter Employee Information to Edit
							<br>
							<br>
						</h3>
						</div>

							<form:form class="form" action="editSave" method="post">
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
							<div class="modal-footer">
							<div class="input-group mb-3">
								<input class="btn btn-primary" type="submit" value="SAVE"/>
							</div>
							<div class="input-group mb-3">
								<input class="btn btn-primary" data-dismiss="modal" value="CLOSE"/>
							</div>
							</div>
							</form:form>
						</div>
							
						</div>
                      </div>
                     </div>
                  </div> 
  	</td>
	<td>
	<form action="deleteEmployee/${emp.eid}" 
			onsubmit="return confirm(' ${emp.ename} will be permanently be removed from the system, continue?');">
			    <input class="animated flipInX btn btn-primary" type="submit" value="Delete" />
	</form>
	</td>
	</tr>
</c:forEach>

</table>
</div>


<button class="btn btn-primary" type="submit" data-toggle="modal" data-target="#exampleModalCenter">Add Employee</button>

                  <!-- Modal -->
                  <div class="modal fade" id="exampleModalCenter" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
			    		<div class="modal-content">
			      		<div class="modal-header">
						<div class="container-fluid">
						<div class="row">
						<h3>
						<br>
						Enter Employee Information to Add
						<br>
						<br>
						</h3>
						</div>
					
							<form:form class="form" action="saveEmployee" method="post">
							<div class="input-group mb-3">
								  <div class="input-group-prepend">
						    		<span class="input-group-text">ID</span>
						  		  </div>
								<form:input class="form-control" path="eid"/>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
						    		<span class="input-group-text">Name</span>
						  		  </div>
								<form:input class="form-control" path="ename"/>
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
							<div class="modal-footer">
							<div class="input-group mb-3">
								<input class="btn btn-primary" type="submit" value="SAVE"/>
							</div>
							<div class="input-group mb-3">
								<input class="btn btn-primary" data-dismiss="modal" value="CLOSE"/>
							</div>
							</div>
							</form:form>
						</div>
                      </div>
                     </div>
                   </div>
                  </div>










<script src="resources/js/popper.js"></script>  
  <script src="resources/js/jquerylib.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  <script src="resources/js/bootstrap.js"></script>

 
  <script type="text/javascript">
  $(document).ready(function() {
		$(".edit-employee").click(function(){
			var parent = $(this).parent().parent()[0];
			$("#eid").val(parent.children[0].textContent);
			$("#ename").val(parent.children[1].textContent);
			$("#ecity").val(parent.children[2].textContent);
			$("#esalary").val(parent.children[3].textContent);
		});
		$(".submit-button").click(function(){
			
		})
	});
  </script>




</body>
</html>