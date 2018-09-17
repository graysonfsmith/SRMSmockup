<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Reservations</title>
	<link rel="stylesheet" href="resources/css/bootstrap.css"/>
	<link rel="stylesheet" href="resources/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="resources/css/fullcalendar.min.css"/>
	<link rel="stylesheet" href="resources/css/all.css"/>
	<link rel="stylesheet" href="resources/css/daterangepicker.css"></link>
	
	<jsp:include page="navbar.jsp" />
	<style>
	    body{
	        background: #F5F5F5;
	        overflow-y: hidden;
	    }
	    .select{
	   		border:5px solid green;
	    }
	    #SRMS {
	        font-size: 30px;
	    }
	    .navbar-expand-lg .navbar-nav.side-nav {
	        flex-direction: column;
	    }
	    .navbar {
	        background: #383838;
	    }
	    .header-top {
	        box-shadow: 0 3px 5px rgba(0, 0, 0, 0.1);
	    }
	    .leftmenutrigger {
	        display: none;
	    }
	    #wrapper {
	        padding: 90px 15px 0px 15px;
	    }
	    .btn-dark{
	        margin: 3px;
	        height: 60px;
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
	            padding:90px 15px 0px 15px;
	        }
	        .navbar-nav.side-nav.open {
	            left: 0;
	        }
	        .navbar-nav.side-nav {
	            background: #585f66;
	            box-shadow: 2px 1px 2px rgba(0, 0, 0, 0.1);
	            position: fixed;
	            top: 82px;
	            flex-direction: column !important;
	            left: -220px;
	            width: 200px;
	            overflow-y: auto;
	            bottom: 0;
	            overflow-x: hidden;
	            padding-bottom: 30px;
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
	        #hamBurgerMenu, #dropdown{
	            display: none;
	        }   
	        .removeCol{
	            display: none;
	        }
	        .btn{
	            margin: 5px;
	            padding: 10px;
	        }
	    }
          @media (max-width: 600px){ .welcome-tag{ display: none} }
	</style>
    
    
</head>
<body>
        <div id="bookingData">
        	
        
        
        </div>
        
        
         <div class="container-fluid" style="height: 100%; width: 100%">
            <div class="row">
                <div class="col">
                    <div class="dropdown">
                        <button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Rooms
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <c:forEach var="i" items="${Rtypes}">
                     	       <a class="dropdown-item" href="#">${i.name}</a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="dropdown text-right">
                    	
                        <button class="btn btn-warning dropdown-toggle loc-drop" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            ${loc}-${loccity}, ${locstate} 
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        	<c:forEach var= "allloc" items="${alllocations}">
                            	<a class="dropdown-item" href="changeLocation${allloc.locid} }">${allloc.locname}-${allloc.loccity},${allloc.locstate}</a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid" style="width: 100%; height: 100%">
                <div class="row" style="margin-top: 10px;">
                    <div class="col-1"  style= "height:500px; overflow-y: hidden; overflow-y: scroll; white-space: nowrap ">
                        <c:forEach var= "i" items="${resources}">
                       		<div class="row">
                       		<button type="button" class="btn btn-dark resNameButton">${i.resName}</button>
                       		<input type="hidden" name="${i.resName}${i.resId}" value="${i.resId}"/>
                       		</div>
                        </c:forEach>
                    </div>
                    <div class="col-11">
                        <div class="container" id="calendar"></div>
                    </div>
                </div>


            </div>
            
        </div>
        
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Book a Room</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <form action = "saveReservation" id="resv" method="post">
		      <div class="modal-body">
		      
		      	<div class="row">
		      		<div class="col">
		      			<input class="form-control" id="dateRange" type="text" value="01/15/2018" />
		      		</div>
		      	</div>
		     
		      	<div class="row">
		      		<div class="col">
		      			Start: <input class="form-control timeStart" id="startTime" type="time" name="start_time"/>
		      		</div>
		      		<div class="col">
		      			End: <input class="form-control timeEnd" type="time" id="endTime" name="end_time"/>
		      		</div>
		      	</div>
		      	<br/>
		      	<div class="row text-center" style="font-size: 15px;">
		      	  	<div class="col">
		       	  		<input type="checkbox" class="form-check-input" name="dCheck" id="Daily-Check"/>
		       	  		<label class="form-check-label" for="exampleCheck1">Daily</label>
		       	  	</div>
		       	  	<div class="col">
		       	  		<input type="checkbox" class="form-check-input" id="weekly-"/>
		       	  		<label class="form-check-label" for="exampleCheck1">Weekly</label>
		       	  	</div>
		       	  	<div class="col">
		       	  		<input type="checkbox" class="form-check-input" id="exampleCheck1"/>
		       	  		<label class="form-check-label" for="exampleCheck1">Bi-Weekly</label>
		       	  	</div>
		       	  	<div class="col">
		       	  		<input type="checkbox" class="form-check-input" id="exampleCheck1"/>
		       	  		<label class="form-check-label" for="exampleCheck1">Monthly</label>
		       	  	</div>
		       	  	<div class="col">
		       	  		<input type="checkbox" class="form-check-input" id="exampleCheck1"/>
		       	  		<label class="form-check-label" for="exampleCheck1">More Options</label>
		       	  	</div>
		       	  </div>
		       	  <br/>
		       	  <input type="hidden" id="startTimeStamp" name="startTimeStamp" value="3487"/>
		       	  <input type="hidden" id="endTimeStamp" name="endTimeStamp" value="3487"/>
			      <input type="hidden" id="useridForService" name="useridForService" value="${user.userid}"/>
			      <input type="hidden" id="locidForService" name="location" value="${location.locid}"/>
		       	 <br/> 
		       	  <div class = "row">
			       	  <div class="col">
			       	  	<div id="card" style="height:150px; width: 150px"> 
						  <div class="front" style="background:blue;"> 
						    <div class="card-title text-center">
						    	Front Content
						    </div>
						    <div class="card-body">
						    	Body Content
						    </div>
						    <div class="card-footer">
						    	Footer Content
						    </div>
						  </div> 
						  <div class="back" style="background:red;">
						    Back content
						  </div> 
						</div>
			       	  </div>
			       	  <div class="col">
			       	  	    Comments: <textarea class="form-control" name= "description" id="exampleFormControlTextarea1" rows="5"></textarea>
			       	  	
			       	  </div>
			       	  
		       	  </div>
		       	</div>
		       	<div class="modal-footer">
		        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        	<button type="submit" class="btn btn-danger text-white">Book Now</button>
		        </div>
		      </form>
		    </div>
		  </div>
		</div>
        


	<script src="resources/js/jquerylib.js"></script>	        
	<script src="resources/js/popper.js"></script>
	<script src="resources/js/flip.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/moment.js"></script>
	<script src="resources/js/fullcalendar.js"></script>
	<script src="resources/js/daterangepicker.js"></script>
    <script>
	$(document).ready(function() {
			console.log('${loc}');
			
			$(".resNameButton").click(function(){
				$(".select").removeClass("select");
				$(this).addClass("select");
			});
			
			var events_array = [
				<c:forEach varStatus="status" var= "bkg" items="${bookings}">
					{
						title: '${bkg.roomName}',
						start: '${bkg.startTime}',
						end: '${bkg.endTime}',
						color: '${bkg.color}'
					}<c:if test="${not status.last}">,</c:if>
			
				</c:forEach>
			];
			
	       	
	       	
	           $('.dropdown-toggle').dropdown();
	           $('.leftmenutrigger').on('click', function(e) {
	               $('.side-nav').toggleClass('open');
	               e.preventDefault();
	           });
	           var $calendar = $('#calendar').fullCalendar(
	               {
	                   weekends: false,
	                   allDaySlot: false,
	                   defaultView: 'agendaWeek',
	                   nowIndicator: true,
	                   minTime: "07:00:00",
	                   maxTime: "21:00:00",    
	                   header:{
	                       left: 'prev,next',
	                       center: 'title',
	                       right: 'today,month,agendaDay,agendaWeek'
	                   },
	                  events: events_array,
	                   selectable: true,
	                   //this is where selection happens
	                   select: function(start,end,jsEvent,view){
	                	   console.log(moment().diff(start));
	                	   if(start.isBefore(moment().subtract(1,"days")) || start.isAfter(moment(moment().add(61,'days'), 'YYYY-MM-DD[T]HH:mm[Z]'))) {
	                	        alert('Event is start in the past!');
	                	    }else{
	                	    	if(moment().diff(start, "minutes") < 0){
		                	    	$("#dateRange").val(moment(start).format("MM/DD/YYYY")); 
		                	    	$("#startTime").val(moment(start).format("hh:mm"));
		                	    	$("#endTime").val(moment(end).format("hh:mm"));
		                	    	$(".card-title").html($(".select")[0].textContent);
		                	    	$("#startTimeStamp").val(moment(start).format("MM/DD/YYYY")+ " " + moment(start).format("HH:mm"));
		           					$("#endTimeStamp").val(moment(start).format("MM/DD/YYYY")+ " " + moment(end).format("HH:mm"));
		    	                   	$('#exampleModal').modal('toggle');
		    	                   	$('.select').siblings('input').attr('name','resourceid');
		    	                   	$('#resv').append($('.select').siblings('input'));
		    	                   	
	    	                       if(title != null){
	    	                           var event = {
	    	                               title: title.trim() != "" ? title: "New event",
	    	                               start: start,
	    	                               end: end
	    	                           };
	    	                           $calendar.fullCalendar("renderEvent", event, true);
	    	                       }
	    	                       $calendar.fullCalendar("unselect");
	                	    	}else{
	                	    		alert('Event is start in the past!');
	                	    	}
    	                    }
	                   },
	                   editable: true,
	                   eventClick: function(event,jsEvent, view){
	                   	
	                   	
	
	                       var newTitle = prompt("Enter a new title for this event", event.title);
	                       if(newTitle != null){
	                           event.title = newTitle.trim() != "" ? newTitle : event.title;
	                           $calendar.fullCalendar("updateEvent", event);
	                       }
	                   }
	                   
	               }
	           )
	           $('#calendar').fullCalendar('option', 'height', 540);
	           
	           $("#startTime").change(function(){
	        	   $("#startTimeStamp").val($("#dateRange").val()+ " " + $("#startTime").val());
	           });
	           $("#endTime").change(function(){
	        	   $("#endTimeStamp").val($("#dateRange").val()+ " " + $("#endTime").val());
	           });
	           $("#dateRange").change(function(){
	        	   $("#startTimeStamp").val($("#dateRange").val()+ " " + $("#startTime").val());
	        	   $("#endTimeStamp").val($("#dateRange").val()+ " " + $("#endTime").val());
	           });
	
	           $("#card").flip();
	           $('input[name="daterange"]').daterangepicker({
	               opens: 'left'
	             }, function(start, end, label) {
	               console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
	           });
	           $("input:checkbox").on('click', function() {
	           	  // in the handler, 'this' refers to the box clicked on
	           	  var $box = $(this);
	           	  if ($box.is(":checked")) {
	           	    // the name of the box is retrieved using the .attr() method
	           	    // as it is assumed and expected to be immutable
	           	    var group = "input:checkbox[name='" + $box.attr("name") + "']";
	           	    // the checked state of the group/box on the other hand will change
	           	    // and the current value is retrieved using .prop() method
	           	    $(group).prop("checked", false);
	           	    $box.prop("checked", true);
	           	  } else {
	           	    $box.prop("checked", false);
	           	  }
	           	});
	           var currentDate = $('#calendar').fullCalendar('getDate');
	           
	           var beginOfWeek = currentDate.startOf('week');
	           var endOfWeek = currentDate.endOf('week');
	           var start = $('#calendar').fullCalendar('getView').start;
	           var end = $('#calendar').fullCalendar('getView').end;
	           var url = "getBookings?start=" + start + "&end=" + end;
	           //window.location.href=url;
	           $('.fc-prev-button').click(function() {
	        	   	var date = $(".fc-center")[0].childNodes[0].textContent;
	           		var dateArray = date.split(" ");
	           		var startDate = dateArray[1] + "-"+dateArray[0]+"-"+dateArray[4];
	           		var endDate = dateArray[3].split(",")[0] + "-"+dateArray[0]+"-"+dateArray[4];
	           		//window.location.href = "getBookings?start="+startDate+"&end="+endDate;
	        	 });
	           $('.fc-next-button').click(function() {
	        	   	var date = $(".fc-center")[0].childNodes[0].textContent;
	           		var dateArray = date.split(" ");
	           		var startDate = dateArray[1] + "-"+dateArray[0]+"-"+dateArray[4];
	           		var endDate = dateArray[3].split(",")[0] + "-"+dateArray[0]+"-"+dateArray[4];
	        	});
    		});
    </script>
</body>
</html>