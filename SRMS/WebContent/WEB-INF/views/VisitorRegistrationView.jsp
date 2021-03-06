<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="Refresh" content="60;url= landing">
<title>Check In</title>
<link rel="stylesheet" href="resources/css/bootstrap.css" />
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/fullcalendar.min.css" />
<link rel="stylesheet" href="resources/css/fontawesome.min.css" />
<link rel="stylesheet" href="resources/css/all.css" />
<style>
body {
      width: 100%;
      height: 100%;
      overflow-y:hidden;
      font-family: 'Muli', 'Helvetica', 'Arial', 'sans-serif';
    }
	.checkin-page {
	  width: 360px;
	  padding: 2% 0 0;
	  margin: auto;
	}
	
	
	.form {
	  position: relative;
	  z-index: 1;
	    /* rgba(102, 102, 102, 0.26); */
	  max-width: 360px;
	  margin: 0 auto 100px;
	  padding:30px;
	  text-align: center;
	  }
  

    header.masthead {
      position: relative;
      width: 100%;
      padding-top: 150px;
      padding-bottom: 100px;
      color: white;
      background: -webkit-linear-gradient(-45deg, #434343, #000000);  /* Chrome 10-25, Safari 5.1-6 */
      background: linear-gradient(-45deg, #434343, #000000); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
      background-size: 400% 400%;
      -webkit-animation: Gradient 15s ease infinite;
      -moz-animation: Gradient 15s ease infinite;
      animation: Gradient 15s ease infinite;
      }

    @-webkit-keyframes Gradient {
      0% {
        background-position: 0% 50%
      }
      50% {
        background-position: 100% 50%
      }
      100% {
        background-position: 0% 50%
      }
    }

    @-moz-keyframes Gradient {
      0% {
        background-position: 0% 50%
      }
      50% {
        background-position: 100% 50%
      }
      100% {
        background-position: 0% 50%
      }
    }

    @keyframes Gradient {
      0% {
        background-position: 0% 50%
      }
      50% {
        background-position: 100% 50%
      }
      100% {
        background-position: 0% 50%
      }
    }

    header.masthead .header-content {
      max-width: 500px;
      margin-bottom: 100px;
      text-align: center;
    }

    header.masthead .header-content h1 {
      font-size: 30px;
    }

    header.masthead .device-container {
      max-width: 325px;
      margin-right: auto;
      margin-left: auto;
    }
    @media (min-width: 992px) {
      header.masthead {
        height: 100vh;
        min-height: 775px;
        padding-top: 0;
        padding-bottom: 0;
      }
      header.masthead .header-content {
        margin-bottom: 0;
        text-align: left;
      }
      header.masthead .header-content h1 {
        font-family: Georgia, 'Times New Roman', Times, serif;
        font-size: 60px;
      }
      header.masthead .device-container {
        max-width: 325px;
      }
      .form button {
		  font-family: "Roboto", sans-serif;
		  text-transform: uppercase;
		  outline: 1px solid black;
		  background: rgba(46,139,87,0.3);
		  width: 100%;
		  border: 1px solid black;
		  outline-style: solid
		  padding: 15px;
		  color: #FFFFFF;
		  font-size: 14px;
		  -webkit-transition: all 0.3 ease;
		  transition: all 0.3 ease;
		  cursor: pointer;
		}
		.form button:hover,.form button:active,.form button:focus {
		  background: #43A047;
		}
		.form .message {
		  margin: 15px 0 0;
		  color: #b3b3b3;
		  font-size: 12px;
		}
		.form .message a {
		  color: #4CAF50;
		  text-decoration: none;
		}
		.form .register-form {
		  display: none;
		}
		.container {
		  position: relative;
		  z-index: 1;
		  max-width: 300px;
		  margin: 0 auto;
		}
		.container:before, .container:after {
		  content: "";
		  display: block;
		  clear: both;
		}
		.container .info {
		  margin: 50px auto;
		  text-align: center;
		}
		.container .info h1 {
		  margin: 0 0 15px;
		  padding: 0;
		  font-size: 36px;
		  font-weight: 300;
		  color: #1a1a1a;
		}
		.container .info span {
		  color: #4d4d4d;
		  font-size: 12px;
		}
		.container .info span a {
		  color: #000000;
		  text-decoration: none;
		}
		.container .info span .fa {
		  color: #EF3B3A;
		}
		
		.input-group {
		  margin-top: 10px;
		}
		
		#syn{
		    font-family: impact;
		    font-size: 80px;
		} 
    }
</style>

</head>

<header class="masthead">
<div class = "checkin-page">
	<div class = "form" style = "opacity:2.5">
	 <img src="resources/images/book-logo.png" alt="logo" style="height:65%; width:65%; padding-bottom:30px; "/>
	 <form:form action="saveVisitor" method="post">
	 <div class = "input-group mb-3">
		<div class = "input-group-prepend">
		<br>
		<span class="input-group-text"><i class="fa fa-user fa-fw"></i></span>
		</div>
		<input class="form-control" type="text" placeholder="Name" name="visName" class="col-lg-12" pattern="[a-zA-Z]+" required/>
	</div>
	<div class = "input-group mb-3">
		<div class = "input-group-prepend">
		<br>
		<span class="input-group-text"><i class="fa fa-envelope fa-fw"></i></span>
		</div>
		<input class="form-control" type="text" placeholder="Email" name="visEmail" class="col-lg-12" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required/>
	</div>
	<div class = "input-group mb-3">
		<div class = "input-group-prepend">
		<br>
		<span class="input-group-text"><i class="fa fa-phone fa-fw"></i></span>
		</div>
		<input class="form-control" type="text" placeholder="Phone" name="visPhone" class="col-lg-12" pattern="[0-9]{10}+" required/>
	</div>
	<div class = "input-group mb-3">
		<div class = "input-group-prepend">
		<br>
		<span class="input-group-text"><i class="fa fa-id-badge fa-fw"></i></span>
		</div>
		<input class="form-control" type="text" placeholder="Badge ID" name="badgeId" class="col-lg-12" pattern="[0-9]+"/>
	</div>
	<div class = "input-group mb-3">
		<div class = "input-group-prepend">
		<br>
		<span class="input-group-text"><i class="fa fa-building fa-fw"></i></span>
		</div>
		<input class="form-control" type="text" placeholder="Company" name="visCompany" class="col-lg-12" required/>
	</div>
	<div class = "input-group mb-3">
	<form:select path = "visPurpose">
		<c:forEach var="booking" items="${listofbookings}">
			<form:option value='${booking.description}'>${booking.description}</form:option>
		</c:forEach>
	</form:select>
	<form:option value='Other'>Other</form:option>
	</div>
	<br>
	<input class="btn btn-primary" type="submit" value="Check In" style="width:100px"/>
	 </form:form>
	 </div>
	 
</div>
</header>


	
</body>

</html>