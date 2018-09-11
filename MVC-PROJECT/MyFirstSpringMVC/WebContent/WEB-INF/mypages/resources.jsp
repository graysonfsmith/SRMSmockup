<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
    
    
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>
      Resource Page
    </title>

    <link rel="stylesheet" href="resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="resources/css/bootstrap.css"/>
    <link rel="stylesheet" href="resources/css/animate.css"/>
    <link rel="stylesheet" href=".\css\all.css"/>
    <style>
#SRMS {
  font-size: 30px;
}
.navbar-expand-lg .navbar-nav.side-nav {
  flex-direction: column;
}
.navbar {
  background: #383838;
}
.front{
  background-color: #007bff;
}
.back{
  background-color: #007bff;
}
.header-top {
  box-shadow: 0 3px 5px rgba(0, 0, 0, 0.1);
}
.leftmenutrigger {
  display: none;
}
#wrapper {
    padding: 70px 15px 15px 15px;
  }
.btn-class{
  width: 200px;
  margin: 2px;
  height: 120px;
}
#plus-button{
  height: 60px;
  width: 60px;
  border-radius: 100%;
  position: relative;
  left: -40px;
}
@media (min-width: 992px) {
  .leftmenutrigger {
    display: block;
    display: block;
    margin: 7px 20px 4px 0;
    cursor: pointer;
  }
  #show-op{
    display: none;
  }
  #wrapper {
    padding: 70px 15px 15px 15px;
  }
  .navbar-nav.side-nav.open {
    left: 0;
  }
  .navbar-nav.side-nav {
    background: #585f66;
    box-shadow: 2px 1px 2px rgba(0, 0, 0, 0.1);
    position: fixed;
    top: 56px;
    flex-direction: column !important;
    left: -220px;
    width: 200px;
    overflow-y: auto;
    bottom: 0;
    overflow-x: hidden;
    padding-bottom: 40px;
  }
  
  	.modal-header{
	background-color: #32383e;
	}
	
  	h3{
    color: white;
    }
}
.animate {
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}
.list-group-item{
  display: inline-block;
  width: 100%;
  border-radius: 0;
}
.card-list{
  padding-left: 0;
  padding-right: 0;
}
.exampleModal{
  width: 100%;
}
.modal-dialog{
  width: 100%;
}
.bordered{
  border: 1px solid rgba(0, 0, 0, 0.125);
}
h5{
  color: white;
}
.entry:not(:first-of-type)
{
    margin-top: 10px;
}
.glyphicon
{
    font-size: 12px;
}
.addCard{
  width: 100%;
  height: 200px;
}
a:link{
  text-decoration: none;
}
@media (max-width: 992px) {
  #hamBurgerMenu, .dropdown {
    display: none;
  }
  #containIt{
    padding-top: 100px;
  }
  
}
    
    
    
    </style>
  </head>
  <body>


    <div id="wrapper" class="animate">

      <nav id= "navigation" class="navbar header-top fixed-top navbar-expand-lg  navbar-dark ">
      <span id="hamBurgerMenu" class="navbar-toggler-icon light leftmenutrigger" ></span>
      <a class="navbar-brand" href="LandingPage.html"><i class = "fa fa-home" style = "font-size: 24px;"></i></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText"
        aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>


      <div class="collapse navbar-collapse" id="navbarText">

        <ul class="navbar-nav animate side-nav" id="ulSideNav">

          <li class="nav-item">
            <a class="nav-link" href="LandingPage.html">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="reservations.html">View Reservations</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="utilPage.html">Reports</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="visitortable.html">View Reservations</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="ManageLocations.html">Manage Locations</a>
          </li>
        </ul>

        <ul class="navbar-nav ml-md-auto d-md-flex">
            <li class="nav-item" id="show-op">
                <a class="nav-link" href="UserOptions.html">User Options</a>
            </li>
            <li class="nav-item" id="show-op">
                <a class="nav-link" href="#">Logout</a>
            </li>
            <li class="nav-item" id="dropdown">
                <div class="dropdown">
                    <a class="nav-link dropdown-toggle" style="margin-left: 100px;" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#"><i class = "fa fa-user-circle" style = "font-size: 24px;"></i></a>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="UserOptions.html">User Options</a>
                        <a class="dropdown-item" href="#">Logout</a>
                    </div>
                </div>
            </li>
        </ul>

        </div>

      </nav>

    </div>

    <div class="container text-center">
    
    

      <div class="row">
        <div class="col-sm">
            <button type="button"  id="plus-button" data-toggle="modal" data-target="#NewResModal" class="btn btn-primary btn-lg">+</button>
        </div>
        <div class="col-sm"></div>
        <div class="col-sm"></div>
        <div class="col-sm">
          
        </div>
        <div class="col-sm">
            
            <div class="dropdown">
                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Location
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="">${location.locName}</a>
                <c:forEach var="location" items="${allLoc}">
                  <a class="dropdown-item" href="${location.locId}">${location.locName}</a>
				</c:forEach>
                </div>
              </div>
              
        </div>

      </div>
      <br>
      
      <div class="container room-store">
        <div class="row room-store">
        <c:forEach var="resourceType" items="${resourceTypes}">
          <div class="col-xs">
              <button type="button" class="btn btn-class btn-dark btn-lg animated jackInTheBox" data-toggle="modal" data-target="#Modal${resourceType.name}">${resourceType.name}</button>
          </div>
          
          
           <div class="modal fade" id="Modal${resourceType.name}" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
			    		<div class="modal-content">
			      		<div class="modal-header">
						<div class="container-fluid">
						<div class="row">
						<h3>
							<br>
							Here are ${resourceType.name} rooms
							<br>
							<br>
						</h3>
						</div>
						</div>	
						</div>
						
						<div class="modal-body">
			              <div class="container-fluid">
			              <div class="row">
			                <div class="col-sm">
			                <div class="flip text-center"> 
			                    <div class="front card" style="width: 5rem;">
			                        <div class="card-body">
			                          <h5 class="card-title">My ${resourceType.name}</h5>
			                          <img src="Icon-Placeholder.png" style="width: 5rem; height: 5rem;"/>
			                        </div>
			                      </div>
			                      <div class="back card" style="width: 5rem;">
			                        <div class="container-fluid">
			                        <div class="row">
			                          
			                          <div class="col card-list">
			                              <li class="list-group-item">
			                                  <img src="Icon-Placeholder.png" style="width: 1rem; height: 1rem;"/>
			                              </li>
			                              <li class="list-group-item">
			                                  <img src="Icon-Placeholder.png" style="width: 1rem; height: 1rem;"/>
			                              </li>
			                              <li class="list-group-item">
			                                  <img src="Icon-Placeholder.png" style="width: 1rem; height: 1rem;"/>
			                              </li>
			                            </div>
			                          <div class="col card-list">
			                              <li class="list-group-item">5</li>
			                              <li class="list-group-item">3</li>
			                              <li class="list-group-item">7</li>
			                          </div>
			                        </div>
			                        <div class="row">
									<div class="col">
										  <br>
			                              <button type="button" class="btn btn-info btn-room-edit"  data-dismiss="modal" data-toggle="modal" data-target="#EditModal${resourceType.name}">
			                                  <span class="glyphicon glyphicon-wrench"></span> Edit
			                                </button>
			                                <br>
			                               </div>
			                           <div class="col">
			                           		<br>
			                                <form action="deleteResource/" 
													onsubmit="return confirm('will be permanently be removed from the system, continue?');">
													    <input class="btn btn-danger" type="submit" value="Delete" />
											</form>
											<br>
											</div>
			                        </div>
			                        </div>
			                      </div>
			                  </div>
			                </div>
						
                      	</div>
                     </div>
                     </div>
                     </div>
                     </div>
                     
                     
          </div> 
          
          <div class="modal fade" id="EditModal${resourceType.name}" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
			    		<div class="modal-content">
			      		<div class="modal-header">
						<div class="container-fluid">
						<div class="row">
						<h3>
							<br>
							Edit this ${resourceType.name} room
							<br>
							<br>
						</h3>
						</div>
						</div>	
						</div>
						
						
					</div>
				</div>
			</div>
          
        </c:forEach>
        
       </div>
	</div>
	</div>
	
	
	
	  <div class="modal fade" id="NewResModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document"> 
    <div class="modal-content">
    <div class="modal-header">
						<div class="container-fluid">
						<div class="row">
						<h3>
							<br>
							Add new resource
							<br>
							<br>
						</h3>
						</div>
						</div>	
						</div>
    
    
    <div class="modal-body"> 
    <div class="container-fluid ">
        
        <div class="row">
        		<br>
        		<br>
        		<div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <label class="input-group-text" for="inputGroupSelect01">Name</label>
                    <input type="text" class="form-control" placeholder="Resource Name" aria-label="Username" aria-describedby="basic-addon1">
                  </div>
                  
                </div>
            
              <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <label class="input-group-text" for="inputGroupSelect01">Location</label>
                  </div>
                  <select class="custom-select" id="inputGroupSelect01">
                    <c:forEach var="location" items="${allLoc}">
                    <c:choose>
          			<c:when test="${location.locId == thisLoc.locId}">
                    <option value="${location.locId}" selected>${location.locName}</option>
                    </c:when>
                    <c:otherwise>
                    <option value="${location.locId}">${location.locName}</option>
                    </c:otherwise>
                    </c:choose>
                    </c:forEach>
                  </select>
                </div>
                
                

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                      <label class="input-group-text" for="inputGroupSelect01">Resource</label>
                    </div>
                    <select class="custom-select" id="inputGroupSelect01">
                      <option selected>Choose Resource Type</option>
                      <c:forEach var="resourceType" items="${resourceTypes}">
                        <option value="${resourceType.ID}">${resourceType.name}</option>
                      </c:forEach>
                    </select>
                  </div>
                
                  <div class="container">
                      <div class="row">
                            <div class="control-group" id="fields">
                                <label class="control-label" for="field1">Room features</label>
                                <div class="controls"> 
                                    <form role="form" autocomplete="off">
                                        <div class="entry input-group col-xs-3">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text" for="inputGroupSelect01">Feature</label>
                                              </div>
                                              <select class="custom-select" id="inputGroupSelect01">
                                              </select>
                                            <input class="form" name="fields[]" type="number" placeholder="" />
                                          <span class="input-group-btn">
                                                <button class="btn btn-primary btn-add" type="button">
                                                    <span class="glyphicon glyphicon-plus">+</span>
                                                </button>
                                            </span>
                                        </div>
                                    </form>
                                <br>

                                </div>
                            </div>
                      </div>
                      <div class="row">
                      <br>
                      <div class="col-sm-3">
                      	<button class="btn btn-primary" type="button">Submit</button>
                      </div>
                      <div class="col-sm-2">
                    	<button class="btn btn-danger" type="button">Cancel</button>
                      </div>
                      <br>
                    	</div>
                    </div>
                    
              
        </div>
        </div>
        </div>
      </div>
    </div>
    </div>







<script src="resources/js/popper.js"></script>  
<script src="resources/js/jquerylib.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  <script src="resources/js/bootstrap.js"></script>
  <script src="resources/js/flip.min.js"></script>
 
<script type="text/javascript">
$(document).ready(function() {
  $('.dropdown-toggle').dropdown();
  $('.leftmenutrigger').on('click', function(e) {
    $('.side-nav').toggleClass('open');
    e.preventDefault();
  });
$(function()
{
    $(document).on('click', '.btn-add', function(e)
    {
        e.preventDefault();
        var controlForm = $('.controls form:first'),
            currentEntry = $(this).parents('.entry:first'),
            newEntry = $(currentEntry.clone()).appendTo(controlForm);
        newEntry.find('input').val('');
        controlForm.find('.entry:not(:last) .btn-add')
            .removeClass('btn-add').addClass('btn-remove')
            .removeClass('btn-primary').addClass('btn-danger')
            .html('<span class="glyphicon glyphicon-minus">-</span>');
    }).on('click', '.btn-remove', function(e)
    {
		$(this).parents('.entry:first').remove();
		e.preventDefault();
		return false;
	});
});
  $(function(){
    $(".flip").flip({
      trigger: 'click'
      });
    });
});
</script>


</body>
</html>