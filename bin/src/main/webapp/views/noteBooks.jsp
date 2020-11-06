<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.spring.DomainClass.*"%>
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
				<a href="javascript:void(0)" class="closebtn"  id="closeNav" onclick="closeNav()">&times;</a>
				<h3 style="color: white;">Hai ${user.getUserName() }</h3>
				<a id="noteBookView" href="noteBookList.do">NoteBooks</a> 
				<a id="listOfNotes" href="listAllNotes.do">Notes</a> 
				<a id="editUser" href="editUser.do">Edit User</a>
			</div>

		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="addNoteBook.do" data-toggle="modal"
				data-target="#myModal">NEW NOTEBOOK</a></li>
			<li><a id="logout" href="logout.do"><span
					class="glyphicon glyphicon-log-in"></span> Logout</a></li>
		</ul>
		</li>
		</ul>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header text-center">
						<h4 class="modal-title w-100 font-weight-bold">ADD NOTEBOOK</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body mx-3">
						<form action="createNoteBook.do" name="myForm"
							method="post" onsubmit="return validateNoteBookForm()">
							<label for="noteBookName">NoteBookName</label> 
							<div id="noteBook_error" style="display: none; color: red;">NoteBook
								Name should not be empty</div>
							<input type="text" placeholder="noteBookName" id="noteBookName" name="noteBookName">
						    <input type="submit" value="Submit" id="submit">
						</form>
					</div>

				</div>
			</div>
		</div>

	</div>
	</nav>
	<div class="row">
		<div class="col-md-8 text-left">
			<h1>Note Books</h1>
		</div>
		<div class="col-md-3 text-right">
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
	</div>

	<table id="myTable" class="container">
		<tr>
			<td><div id="error" style="color: red; display: block">${error}</div></td>
		</tr>
		<c:forEach items="${noteBooks}" var="item">
			<tr>
				<td>
					<div class="container" name="myTable">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="row">
									<div class="col-md-1 text-left"><b>
										<a  href="listOfNotes.do?itemId=${item.key.getId()}"><c:out value="${item.key.getNoteBookName()}" />
										</a></b>
										<div>
									      <c:out value="${item.value} Notes" />
									   </div>
									</div>
									<div class="col-md-10 text-right">
										<a id="editNoteBook" href="editNoteBook.do?itemId=${item.key.getId()}"><span
											class="glyphicon glyphicon-edit">Edit</span></a>
									</div>
									<div>
										<a id="deleteNoteBook"  href="deleteNoteBook.do?itemId=${item.key.getId()}"><span
											class="glyphicon glyphicon-remove">Delete</span></a>
									</div>
									
								</div>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</c:forEach>
	</table>
 <script>
      $(document).ready(function(){
    	  $("#myInput").on("keyup", function() {
    	    var value = $(this).val().toLowerCase();
    	    $("#myTable tr").filter(function() {
    	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    	    });
    	  });
    	});
        function validateNoteBookForm() {
            var flag = true;
            var noteBookName = document.getElementById("noteBookName").value;
            if (noteBookName == "") {
                flag = false;
                document.getElementById("noteBook_error").style.display = 'block';
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
