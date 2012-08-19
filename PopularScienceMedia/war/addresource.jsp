<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%

UserService userService = UserServiceFactory.getUserService();
User user = userService.getCurrentUser();
 
if (user == null) {
	response.sendRedirect(userService.createLoginURL(request.getRequestURI()));
}

if (!user.getEmail().equals("per.johan.noren@gmail.com")) {
	response.sendRedirect("http://www.popularsciencemedia.com");
}


%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@page import="com.google.appengine.api.users.UserService"%>
<%@page import="com.google.appengine.api.users.User"%>
<%@page import="com.google.appengine.api.users.UserServiceFactory"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Popular Science Books</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />

</head>
<body>




<h1>Add resource</h1>

<form action="addresource" method="post">
	<table>
		<tr>
			<td>
				Type:
			</td>
			<td>
				<select name="type">
				  <option value="book">book</option>
				  <option value="podcast">podcast</option>
				  <option value="movie">movie</option>
				  <option value="clip">clip</option>
				</select>		
			</td>			
		</tr>	
		<tr>
			<td>
				Title: 
			</td>
			<td>
				<input type="text" name="title"></input>			
			</td>			
		</tr>
		<tr>
			<td>
				Authors: 
			</td>
			<td>
				<input type="text" name="authors"></input>			
			</td>			
		</tr>
		<tr>
			<td>
				Year: 
			</td>
			<td>
				<input type="text" name="year"></input>			
			</td>			
		</tr>
		<tr>
			<td>
				Labels: 
			</td>
			<td>
				<input type="text" name="labels"></input>			
			</td>			
		</tr>
		<tr>
			<td>
				Pasted from big image (EVERYTHING) AMAZON: 
			</td>
			<td>
				<input type="text" name="bigimage"></input>			
			</td>			
		</tr>
		<tr>
			<td>
				Pasted from small image (EVERYTHING) AMAZON: 
			</td>
			<td>
				<input type="text" name="smallimage"></input>			
			</td>			
		</tr>
		<tr>
			<td>
				Pasted from get link (EVERYTHING) AMAZON: 
			</td>
			<td>
				<input type="text" name="link"></input>			
			</td>			
		</tr>
		<tr>
			<td>
				Review: 
			</td>
			<td>
				<textarea rows="20" cols="50" name="review"></textarea>			
			</td>			
		</tr>

		<tr>
			<td>
				Podcast image URL (EVERYTHING): 
			</td>
			<td>
				<input type="text" name="podcastlink"></input>			
			</td>			
		</tr>


		<tr>
			<td>
			
			</td>
			<td>
				<input type="submit"></input>			
			</td>			
		</tr>
	
	</table>
</form>

</body>
</html>