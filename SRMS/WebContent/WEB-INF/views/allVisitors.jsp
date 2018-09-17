<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reservations</title>
<link rel="stylesheet" href="resources/css/bootstrap.css" />
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/fullcalendar.min.css" />
<link rel="stylesheet" href="resources/css/fontawesome.min.css" />
<link rel="stylesheet" href="resources/css/jquery.dataTables.css" />
<link rel="stylesheet" href="resources/css/all.css" />

<jsp:include page="navbar.jsp" />

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

.header-top {
	box-shadow: 0 3px 5px rgba(0, 0, 0, 0.1);
}

.leftmenutrigger {
	display: none;
}

.openButton {
	border-style: none;
	background: #585f66;
	cursor: pointer;
}

#table-row-1 {
	display: none;
}

@media ( min-width : 992px) {
	.leftmenutrigger {
		display: block;
		display: block;
		margin: 7px 20px 4px 0;
		cursor: pointer;
	}
	#show-op {
		display: none;
	}
	#wrapper {
		padding: 90px 15px 0px 15px;
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

@media ( max-width : 992px) {
	#hamBurgerMenu, #dropdown {
		display: none;
	}
	#containIt {
		padding-top: 100px;
	}
	#mod-button {
		display: none;
	}
	#sort-op, #table-row-1 {
		display: block;
	}
}

@media ( max-width : 600px) {
	.welcome-tag {
		display: none
	}
}

#tablediv {
	margin-top: 10px;
	height: 500px;
}

#outbutton {
	background-color: red;
}
</style>
</head>

<body>

	<table border="0" cellspacing="5" cellpadding="5">
		<tbody>
			<tr>
				<td>Earliest Date:</td>
				<td><input type="text" id="min" name="min"></td>
			</tr>
			<tr>
				<td>Latest Date:</td>
				<td><input type="text" id="max" name="max"></td>
			</tr>
		</tbody>
		<a type="button" href = landing class="btn btn-primary btn-lg btn-block">View Visitor Stuff</a>
	</table>
	<table id="example" class="display" style="width: 100%">
	</table>
	
	<script src="resources/js/jquerylib.js"></script>
	<script src="resources/js/fontawesome.js"></script>
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/moment.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.dataTables.min.js"></script>
	<script src="resources/js/dataTables.bootstrap.min.js"></script>
	<script>
		/* Custom filtering function which will search data in column four between two values */
		$.fn.dataTable.ext.search
				.push(function(settings, data, dataIndex) {
					var min = parseInt($('#min').val(), 10);
					var max = parseInt($('#max').val(), 10);
					var age = parseFloat(data[0]) || 0; // use data for the age column

					if ((isNaN(min) && isNaN(max))
							|| (isNaN(min) && age <= max)
							|| (min <= age && isNaN(max))
							|| (min <= age && age <= max)) {
						return true;
					}
					return false;
				});

		var dataSet = [
				<c:forEach var = "i" begin = "0" end ="100">[
						"${allvis[i].getVisId()}", "${allvis[i].getVisName()}",
						"${allvis[i].getVisEmail()}",
						"${allvis[i].getVisPhone()}",
						"${allvis[i].getBadgeId()}",
						"${allvis[i].getVisPurpose()}",
						"${allvis[i].getVisCompany()}",
						"${allvis[i].getCheckIn()}",
						"${allvis[i].getCheckOut()}"], </c:forEach> ];
		$(document).ready(function() {

			var table = $('#example').DataTable({
				"order": [[ 7, "desc" ]],
				data : dataSet,
				columns : [ {
					title : "ID"
				}, {
					title : "Name"
				}, {
					title : "Email"
				}, {
					title : "Phone"
				}, {
					title : "Badge"
				}, {
					title : "Purpose"
				}, {
					title : "Company"
				}, {
					title : "In Time"
				}, {
					title : "Out Time"
				} ]
				
			});

			// Event listener to the two range filtering inputs to redraw on input
			$('#min, #max').keyup(function() {
				table.draw();
			});

		});
        $(document).ready(function() {
            $('.dropdown-toggle').dropdown();
            $('.leftmenutrigger').on('click', function(e) {
                $('.side-nav').toggleClass('open');
                    e.preventDefault();
                });
            // $(".btn").on("mouseenter", function () {
            //     $( this ).css('background',$(this).css('border-color'));
            // }).on("mouseleave", function () {
            //     $( this ).css('background','none');
            // });
            $("#util").on('click',function(){
                 document.location.href = $(this).val();
            });
            $("#rsvtn").on('click',function(){
                 document.location.href = $(this).val();
            });
            $("#locat").on('click',function(){
                 document.location.href = $(this).val();
            });
            $("#vis").on('click',function(){
                 document.location.href = $(this).val();         
            });
            $("#userop").on('click',function(){
                 document.location.href = $(this).val();         
            });
        });
	</script>
</body>
</html>