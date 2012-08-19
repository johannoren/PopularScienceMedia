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
<%@page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@page import="javax.jdo.PersistenceManager"%>
<%@page import="se.noren.app.popularsciencemedia.datastore.PMF"%>
<%@page import="javax.jdo.Extent"%>
<%@page import="se.noren.app.popularsciencemedia.datastore.MediaObject"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Popular Science Books</title>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />

</head>
<body>


<%
	PersistenceManager pm = PMF.get().getPersistenceManager();
	Extent<MediaObject> extent = pm.getExtent(MediaObject.class, false);
%>

<h1>List resources</h1>

<form action="addresource" method="post">
	<table>

		<%	
			for (MediaObject e : extent) {
				
		%>
		<tr>
			<td>
				<%= e.getType() == null ? "book" : e.getType().getValue() %>
			</td>
			<td>
				<a href="editresource.jsp?key=<%=e.getKey().toString() %>"><%= e.getTitle() %></a>
			</td>			
		</tr>	
		<%
			}
		%>
	</table>
</form>

</body>
</html>