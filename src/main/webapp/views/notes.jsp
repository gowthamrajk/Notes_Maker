<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.spring.DomainClass.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.io.*, java.util.*,java.text.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/JavaScript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js" ></script>

<style>
input[type=text], select, textarea {
    width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-top: 6px;
	margin-bottom: 16px;
	resize: vertical;
}

input[type=date] {
	width: 17%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-top: 6px;
	margin-bottom: 16px;
	resize: vertical;
}

input[type=submit] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}

.container {
	width:400px;
	border-radius: 2px;
	background-color: #f2f2f2;
	padding: 10px;
}

.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #111;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s;
}

.sidenav a:hover {
	color: #f1f1f1;
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

.dropdown-menu.notify-drop {
	min-width: 330px;
	background-color: #fff;
	min-height: 360px;
	max-height: 360px;
}

.dropdown-menu.notify-drop .notify-drop-title {
	border-bottom: 1px solid #e2e2e2;
	padding: 5px 15px 10px 15px;
}

.dropdown-menu.notify-drop .drop-content {
	min-height: 280px;
	max-height: 280px;
	overflow-y: scroll;
}

.dropdown-menu.notify-drop .drop-content::-webkit-scrollbar-track {
	background-color: #F5F5F5;
}

.dropdown-menu.notify-drop .drop-content::-webkit-scrollbar {
	width: 8px;
	background-color: #F5F5F5;
}

.dropdown-menu.notify-drop .drop-content::-webkit-scrollbar-thumb {
	background-color: #ccc;
}

.dropdown-menu.notify-drop .drop-content>li {
	border-bottom: 1px solid #e2e2e2;
	padding: 10px 0px 5px 0px;
}

.dropdown-menu.notify-drop .drop-content>li:nth-child(2n+0) {
	background-color: #fafafa;
}

.dropdown-menu.notify-drop .drop-content>li:after {
	content: "";
	clear: both;
	display: block;
}

.dropdown-menu.notify-drop .drop-content>li:hover {
	background-color: #fcfcfc;
}

.dropdown-menu.notify-drop .drop-content>li:last-child {
	border-bottom: none;
}

.dropdown-menu.notify-drop .drop-content>li .notify-img {
	float: left;
	display: inline-block;
	width: 45px;
	height: 45px;
	margin: 0px 0px 8px 0px;
}

.dropdown-menu.notify-drop .allRead {
	margin-right: 7px;
}

.dropdown-menu.notify-drop .rIcon {
	float: right;
	color: #999;
}

.dropdown-menu.notify-drop .rIcon:hover {
	color: #333;
}

.dropdown-menu.notify-drop .drop-content>li a {
	font-size: 12px;
	font-weight: normal;
}

.dropdown-menu.notify-drop .drop-content>li {
	font-weight: bold;
	font-size: 11px;
}

.dropdown-menu.notify-drop .drop-content>li hr {
	margin: 5px 0;
	width: 70%;
	border-color: #e2e2e2;
}

.dropdown-menu.notify-drop .drop-content .pd-l0 {
	padding-left: 0;
}

.dropdown-menu.notify-drop .drop-content>li p {
	font-size: 11px;
	color: #666;
	font-weight: normal;
	margin: 3px 0;
}

.dropdown-menu.notify-drop .drop-content>li p.time {
	font-size: 10px;
	font-weight: 600;
	top: -6px;
	margin: 8px 0px 0px 0px;
	padding: 0px 3px;
	border: 1px solid #e2e2e2;
	position: relative;
	background-image: linear-gradient(#fff, #f2f2f2);
	display: inline-block;
	border-radius: 2px;
	color: #B97745;
}

dropdown-menu.notify-drop .drop-content>li p.time:hover {
	background-image: linear-gradient(#fff, #fff);
}

.dropdown-menu.notify-drop .notify-drop-footer {
	border-top: 1px solid #e2e2e2;
	bottom: 0;
	position: relative;
	padding: 8px 15px;
}

.dropdown-menu.notify-drop .notify-drop-footer a {
	color: #777;
	text-decoration: none;
}
.dropdown-menu.notify-drop .notify-drop-footer a:hover {
	color: #333;
}
.medium{
	width:100px
}
.dropdown-toggle .badge {
  position: absolute;
  right: 2px;
  top:1px;
  padding: 5px 10px;
  border-radius: 50%;
  background-color: red;
  color: white;

}
.notify{
	color:white !important;
	font-size: 1.5em !important;
	line-height: 0.9em !important;
	
}
.contain{
	width:1060px;
}
.changes{
	margin-left:10px;
}
.dochanges{
	margin-left:720px;
}
.column {
  float: left;
  padding: 10px;
  height: 700px; 
}
.center{
	width:2%;
	background-color:white;
}
.left {
  width: 18%;
	background-color: #f2f2f2;
  height:1000%;
}

.right {
  width: 80%;
  	background-color: #f2f2f2;
  	margin-rigth:200px;
}
.rows:after {
  content: "";
  display: table;
  clear: both;
}
</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>

	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header"></div>
		<ul class="nav navbar-nav navbar-left">
			<span style="font-size: 30px; cursor: pointer; color: grey;"
				onclick="openNav()">&#9776;</span>
			<div id="mySidenav" class="sidenav">
				<a href="javascript:void(0)" class="closebtn" id="closeNav" onclick="closeNav()">&times;</a>
				<h3 style="color: white;">Hai ${user.getUserName() }</h3>
				<a id="noteBookView" href="noteBookList.do">NoteBooks</a> 
				<a id="listOfNotes" href="listAllNotes.do">Notes</a> 
				<a id="editUser" href="editUser.do">Edit User</a>
			</div>

		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a id="logout" href="logout.do"><span
					class="glyphicon glyphicon-log-in"></span> Logout</a></li>
		</ul>

		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
			<a href="#" class="dropdown-toggle glyphicon glyphicon-bell notify"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				onclick="notificationFunction()" aria-expanded="false"
				style="color: white;">
			    <span class="badge">${countRemainder}</span>
			</a>
			
				<ul class="dropdown-menu notify-drop">
					<div class="notify-drop-title">
						<div class="row">
							<div class="col-md-6 col-sm-6 col-xs-6">
								<h4>Reminder </h4>
							</div>
							
						</div>
					</div>
					<div class="drop-content">
						<li>
							<div id="notification" >
								
							</div>
						</li>
					</div>
					</ul>
		</li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
		
			<li><a  id="addNewNote" href="addNotes.do" data-toggle="modal"
				data-target="#myModal" style="visibility: ${ui}">NEW NOTE</a></li>
		</ul>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
								<div class="modal-body">
								<div class="modal-header text-center">
					<h4 class="modal-title w-100 font-weight-bold">ADD NOTE</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
								
					<form action="createNote.do" method="post" onsubmit="return validateNoteForm()">
                        
                        <label for="noteName">NoteName</label> 
                        <p id="noteName_error" style="display: none; color: red;">NoteName should not be empty</p>
						<input type="text" id="noteName" name="noteName" placeholder="Notename.." >

						<label for="startDate">StartDate</label> 
						  <p id="sDate_error" style="display: none; color: red;">StartDate should not be empty</p>
						<input type="date" id="startDate" name="startDate" placeholder="StartDate..">
						
					   <label for="endDate">EndDate</label> 
					    <p id="eDate_error" style="display: none; color: red;">EndDate should not be empty</p>
					   <input type="date" id="endDate" name="endDate" placeholder="EndDate.."> 
					   
					   <label for="remainderDate">RemainderDate</label>
					    <p id="rDate_error" style="display: none; color: red;">ReminderDate should not be empty</p>
						<input type="date" id="remainderDate" name="remainderDate"placeholder="RemainderDate.." ><br>
						
					   <label for="statusName">Status</label>
					   <p id="status_error" style="display: none; color: red;">Status should not be empty</p>
					    <select id="statusName"name="statusName" >
							<option value="started">Started</option>
							<option value="inProgress">InProgress</option>
							<option value="complete">Complete</option>
						</select> 
					   <label for="tagName">Tag</label> 
					   <p id="tag_error" style="display: none; color: red;">TagName should not be empty</p>
					   <select id="tagName"name="tagName" >
							<option value="private">Private</option>
							<option value="public">Public</option>
						</select> 
						<label for="noteDescription">Description</label>
						<p id="noteDescription_error" style="display: none; color: red;">NoteDescription should not be empty</p>
						<textarea id="noteDescription" name="noteDescription"
							placeholder="Write notes.." style="height: 200px" ></textarea>
						<input type="submit" value="Submit">

					</form>
				</div>
			</div>
		</div>
	</div>
	</nav>
	<tr>
				<div id="message" style="color: red; display: block">${message}</div></td>
					
<div class="rows">
<div class="column left">
<%SimpleDateFormat sdf = new SimpleDateFormat("dd-mm-yyyy"); %>
<h2>Your daily Tasks!!!!!</h2>
<c:forEach items="${noteObjDate}" var="note"> 
			<h3><a id="dailyTask"
				href="<c:url value='showNoteDetails/${note.getId()}.do'/>">${note.getNoteName()}</a></h3>
			<p>StartDate :${note.getStartDate()}</p>
			<p>EndDate   : ${note.getEndDate()} </p>
			<hr style="width:320px";>
	</c:forEach>
</div>
<div class="column center">
</div>
<div class="column right">
	<div class="row">
		<div class="col-md-4 text-left dochanges">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Search"
					id="myInput" />
				<div class="input-group-btn">
					<button class="btn btn-primary" type="submit" id="submit">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</div>
			</div>
		</div>
		<div class="col-md-8 text-left changes">
			<h1>Notes</h1>
		</div>
	</div><br>
	<%int i=0;%>
	<table id="myTable" style="width:400px;margin-right:150px;">
		<c:forEach items="${note}" var="item">
		<% i=i+1; %>
			<tr>
				<td>
				<div name="myTable">
						<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
							<div class="panel panel-default contain">
								<div class="panel-body">
									<div class="row">
										<div class="col-md-1 text-left">
											<a  id="notedetails" href="<c:url value='showNoteDetails/${item.getId()}.do'/>"><c:out value="${item.getNoteName()}" />
												
												</a>
										</div>
										<div class="col-md-2 text-left">Started on: <c:out value="${item.getStartDate()}" /></div>
										
										<c:choose>
											<c:when
												test="${item.getStatus().getStatusName() == 'complete'}">
												<div>
													<button type="button" id="status" class="btn btn-success btn-md medium">Complete</button>
												</div>
											</c:when>
											<c:when
												test="${item.getStatus().getStatusName() == 'inProgress'}">
												<div>
													<button type="button" id="status"  class="btn btn-warning btn-md medium">InProgress</button>
												</div>
											</c:when>
											<c:otherwise>
												<div>
													<button type="button" id="status" class="btn btn-primary btn-md medium">Started</button>
												</div>
											</c:otherwise>
										</c:choose>
									        
									</div>
										<div class="col-md-10 text-right">
											<a id="editNote"  href="editNote.do?itemId=${item.getId()}"><span
												class="glyphicon glyphicon-edit" >Edit</span></a>
										</div>
										<div>
											<a href="deleteNote.do?itemId=${item.getId()}"><span
												class="glyphicon glyphicon-remove">Delete</span></a>
                                   </div>
                               
                              <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse<%= i%>" aria-expanded="true" aria-controls="collapseOne">
                        <i class="more-less glyphicon glyphicon-plus"></i>
                         <i class="more-less glyphicon glyphicon-minus" style="display:none;"></i>
                    </a>     
                    <div id="collapse<%= i%>" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                    ${item.getNoteDescription()}
                     </div>
					
								</div>
								
								
							</div>
						</div>
					</div>
				</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	</div>
	<script>

	$('.panel-collapse').on('show.bs.collapse', function () {
		  $(this).parent('.panel').find('. glyphicon-minus').show();
		  $(this).parent('.panel').find('. glyphicon-plus').hide();
		})
		$('.panel-collapse').on('hide.bs.collapse', function () {
		  $(this).parent('.panel').find('. glyphicon-minus').hide();
		  $(this).parent('.panel').find('. glyphicon-plus').show();
		})
		
      $(document).ready(function(){
    	  $("#myInput").on("keyup", function() {
    	    var value = $(this).val().toLowerCase();
    	    $("#myTable tr").filter(function() {
    	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    	    });
    	  });
    	});
      function toggleIcon(e) {
    	    $(e.target)
    	        .prev('.panel-heading')
    	        .find(".more-less")
    	        .toggleClass('glyphicon-plus glyphicon-minus');
    	}
    	$('.panel-group').on('hidden.bs.collapse', toggleIcon);
    	$('.panel-group').on('shown.bs.collapse', toggleIcon);

    	function notificationFunction() {
    		$.ajax({
    			type : "POST",
    			url : "listOfNotification.do",
    			success : function(result) {
    				$("#notification").html(result);
    			}
    		});

    	}
    function validateNoteForm() {
        var flag = true;
        var noteName = document.getElementById("noteName").value;
        var startDate = document.getElementById("startDate").value;
        var endDate = document.getElementById("endDate").value;
        var reminderDate= document.getElementById("remainderDate").value;
        var status= document.getElementById("statusName").value;
        var tag= document.getElementById("tagName").value;
        var noteDescription= document.getElementById("noteDescription").value;
        if (noteName == "") {
            flag = false;
            document.getElementById("noteName_error").style.display = 'block';
        }
        else{
            document.getElementById("noteName_error").style.display = 'none';
        }
        
        if (startDate == "") {
            flag = false;
            document.getElementById("sDate_error").style.display = 'block';
        }
        else{
            document.getElementById("sDate_error").style.display = 'none';
        }
        
        if (endDate == "") {
            flag = false;
            document.getElementById("eDate_error").style.display = 'block';
        }
        else{
            document.getElementById("eDate_error").style.display = 'none';
        }
        
        if (reminderDate == "") {
            flag = false;
            document.getElementById("rDate_error").style.display = 'block';
        }
        else{
            document.getElementById("rDate_error").style.display = 'none';
        }

        if (status == "") {
            flag = false;
            document.getElementById("status_error").style.display = 'block';
        }
        else{
            document.getElementById("status_error").style.display = 'none';
        }
        
        if (tag == "") {
            flag = false;
            document.getElementById("tag_error").style.display = 'block';
        }
        else{
            document.getElementById("tag_error").style.display = 'none';
        }
        
        if (noteDescription == "") {
            flag = false;
            document.getElementById("noteDescription_error").style.display = 'block';
        }
        else{
            document.getElementById("noteDescription_error").style.display = 'none';
        }
        return flag;
    }
    function openNav() {
        document.getElementById("mySidenav").style.width = "250px";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
    }
      </script>
</body>

</html>
