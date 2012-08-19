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
<%@page import="org.apache.commons.lang3.StringEscapeUtils"%>
<%@page import="javax.jdo.Extent"%>
<%@page import="se.noren.app.popularsciencemedia.datastore.MediaObject"%>
<%@page import="se.noren.app.popularsciencemedia.util.TextUtils"%><html xmlns="http://www.w3.org/1999/xhtml">
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
	String key = request.getParameter("key");
	
	MediaObject media = null;
	for (MediaObject mo : extent) {
		if (mo.getKey().toString().equals(key))
			media = mo;
	}
%>

<h1>Edit resource</h1>

<form action="editresource" method="post">

	<table>
		<tr>
			<td>
				<input type="hidden" name="key" value="<%= key %>" />
				Type:
			</td>
			<td>
				<select name="type">
				  <option value="book" <%= media.getType() == null || media.getType().equals("book") ? "selected=\"selected\"" : "" %>>book</option>
				  <option value="podcast" <%= media.getType() != null && media.getType().equals("podcast") ? "selected=\"selected\"" : "" %>>podcast</option>
				  <option value="movie"  <%= media.getType() != null && media.getType().equals("movie") ? "selected=\"selected\"" : "" %>>movie</option>
				  <option value="clip"  <%= media.getType() != null && media.getType().equals("clip") ? "selected=\"selected\"" : "" %>>clip</option>
				</select>		
			</td>			
		</tr>	
		<tr>
			<td>
				Title: 
			</td>
			<td>
				<input type="text" name="title" value="<%= media.getTitle() %>"></input>			
			</td>			
		</tr>
		<tr>
			<td>
				Authors: 
			</td>
			<td>
				<input type="text" name="authors" value="<%= TextUtils.concatenate(media.getAuthors(), ",") %>"></input>			
			</td>			
		</tr>
		<tr>
			<td>
				Year: 
			</td>
			<td>
				<input type="text" name="year" value="<%= media.getYear() %>"></input>			
			</td>			
		</tr>
		<tr>
			<td>
				Labels: 
			</td>
			<td>
				<input type="text" name="labels" value="<%= TextUtils.concatenate(media.getLabels(), ",") %>"></input>			
			</td>			
		</tr>
		<tr>
			<td>
				Pasted from big image (EVERYTHING) AMAZON: 
			</td>
			<td>
				<input type="text" name="bigimage" value="<%= StringEscapeUtils.escapeHtml4(TextUtils.fromText(media.getAmazonBigImageLink())) %>"></input>			
			</td>			
		</tr>
		<tr>
			<td>
				Pasted from small image (EVERYTHING) AMAZON: 
			</td>
			<td>
				<input type="text" name="smallimage" value="<%= StringEscapeUtils.escapeHtml4(TextUtils.fromText(media.getAmazonSmallImageLink())) %>"></input>			
			</td>			
		</tr>
		<tr>
			<td>
				Pasted from get link (EVERYTHING) AMAZON: 
			</td>
			<td>
				<input type="text" name="link" value="<%= StringEscapeUtils.escapeHtml4(TextUtils.fromText(media.getAmazonTextLink())) %>"></input>			
			</td>			
		</tr>
		<tr>
			<td>
				Review: 
			</td>
			<td>
				<textarea rows="20" cols="50" name="review"><%= StringEscapeUtils.escapeHtml4(TextUtils.fromText(media.getReviewText())) %></textarea>			
			</td>			
		</tr>

		<tr>
			<td>
				Podcast image URL (EVERYTHING): 
			</td>
			<td>
				<input type="text" name="podcastlink" value="<%= StringEscapeUtils.escapeHtml4(TextUtils.fromText(media.getImageLink())) %>"></input>			
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