<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Reservations</title>
	<link rel="stylesheet" href="resources/css/bootstrap.css"/>
	<link rel="stylesheet" href="resources/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="resources/css/fullcalendar.min.css"/>
	<link rel="stylesheet" href="resources/css/all.css"/>
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
            .card-list{
                padding-left: 0;
                padding-right: 0;
            }
            .modal-dialog{
                width: 100%;
                height: 70%;
            }
            .modal-content{
                width: 100%;
                height: 100%;
            }
            .addCard{
                width: 100%;
                height: 200px;
            }
            .front{
                background-color: #007bff;
            }
            .back{
                background-color: #007bff;
            }
            .list-group-item{
                display: inline-block;
                width: 100%;
                border-radius: 0;
            }
            .btn-dark{
                margin-bottom: 4px;
                margin-top: 3px;
            }
            .header-top {
                box-shadow: 0 3px 5px rgba(0, 0, 0, 0.1);
            }
            .leftmenutrigger {
                display: none;
            }
            .openButton{
                border-style: none;
                background: #585f66;
                cursor: pointer;
            }
            #wrapper {
                padding: 65px 15px 0px 15px;
            }
            .dropdown-row{
                margin-bottom: 4px;
            }
            h5{
            color: white;
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
                    padding: 65px 15px 0px 15px;
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
            }
            .animate {
                -webkit-transition: all 0.3s ease-in-out;
                -moz-transition: all 0.3s ease-in-out;
                -o-transition: all 0.3s ease-in-out;
                -ms-transition: all 0.3s ease-in-out;
                transition: all 0.3s ease-in-out;
            }
            @media (max-width: 992px) {
                #hamBurgerMenu, #dropdown {
                    display: none;
                }
                #containIt{
                    padding-top: 100px;
                }
                #mod-button{
                    display: none;
                }
                #sort-op, #table-row-1{
                    display: block;
                }
            }
            @media (max-width: 600px){ .welcome-tag{ display: none} }
     	</style>
</head>
<body>
	<a href="#">HI</a>
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
                    <a class="nav-link" href="utilPage.html" >Reports</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="reservations.html">View Reservations</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="ManageLocations.html">Manage Locations</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="visitortable.html">Visitor Log</a>
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
        


	<script src="resources/js/jquerylib.js"></script>	        
	<script src="resources/js/popper.js"></script>
	<script src="resources/js/flip.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/moment.js"></script>
	<script src="resources/js/fullcalendar.js"></script>
	<script>
            $(document).ready(function() {
                var active = false;
                $('.dropdown-toggle').dropdown();
                $('.leftmenutrigger').on('click', function(e) {
                    $('.side-nav').toggleClass('open');
                    e.preventDefault();
                });
                $(function(){
                    $(".flip").flip({
                        trigger: 'click'
                    });
                });
                //    full Calendar
                 var date = new Date();
                console.log("Date: " + date.getDate() + " Month: " + date.getMonth() + " Year: " + date.getFullYear());
                
                var $calendar = $('#calendar').fullCalendar(
                    {
                        header:{
                            left: 'prev,next',
                            center: 'title',
                            right: 'today,month,agendaDay,agendaWeek'
                        }
                    }
                )
                $('#calendar').fullCalendar('option', 'height', 400);

                });
     
        </script>
</body>
</html>