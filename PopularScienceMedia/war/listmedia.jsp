<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="se.noren.app.popularsciencemedia.datastore.PMF"%>
<%@page import="javax.jdo.PersistenceManager"%>
<%@page import="javax.jdo.Extent"%>
<%@page import="se.noren.app.popularsciencemedia.datastore.MediaObject"%>
<%@page import="se.noren.app.popularsciencemedia.util.TextUtils"%>
<%@page import="com.google.appengine.api.datastore.Text"%>



<%
	PersistenceManager pm = PMF.get().getPersistenceManager();
	Extent<MediaObject> extent = pm.getExtent(MediaObject.class, false);
	String filterLabel = request.getParameter("filterLabel");
	String filterType  = request.getParameter("type"); 
%>



<div class="inner_copy">
	<div class="inner_copy"></div>
</div>
<div id="content">
	<!-- 
	<div id="banner"><img src="images/img07.jpg" alt="" /></div>
-->	
	<div class="post">
		<h2 class="title"><a href="#">
		<%= filterLabel.substring(0, 1).toUpperCase() + request.getParameter("filterLabel").substring(1)
		%>
		</a></h2>
		
		<%	
			for (MediaObject e : extent) {
				String type;
				Text text = e.getType();
				if (text == null) {
					type = "book";
				} else {
					type = text.getValue();
				}
				
				String entryLink = e.getAmazonTextLink() == null ? "javascript:return false;" : e.getAmazonTextLink().getValue();
				
				if (e.getLabels().contains(filterLabel) && type.equals(filterType)) {
		%>
	

		<div class="largeentry" id="large_<%= e.getUniqueId() %>">
			<img id="largebtn_<%= e.getUniqueId() %>" class="arrowimage" src="images/close.png" />

			<a name="<%= e.getUniqueId() %>"></a>

			<div class="amazonblock">
				<% 	if (type.equals("podcast") && e.getImageLink() != null) { %>
					<img class="podcastimage" src="<%= e.getImageLink().getValue() %>" title="<%= e.getTitle() %>"/>				
				<% } else { %>
					<%= e.getAmazonBigImageLink().getValue() %>
				<% } %>  
			</div>
			
				<p class="meta">
					<a class="meta" href="<%= entryLink %>  ">
						<%= e.getTitle() %> 
						<% if (TextUtils.concatenate(e.getAuthors(), ", ").length() > 0) { %>
						 -
							<%= TextUtils.concatenate(e.getAuthors(), ", ") %>
							<% if (e.getYear() != null && e.getYear().length() > 0) { %>
								(<%= e.getYear() %>)
							<% } %>
						<% } %>
					</a>
				</p>					
			<%= e.getReviewText().getValue() %>

			<% if (!type.equals("podcast")) { %>
				<div style="float:right;">
					<a href="<%= e.getAmazonTextLink().getValue() %>  ">
						<img src="images/buy-from.gif" title="<%= e.getTitle() %>"/>
					</a>
				</div>
				<br />
			<% } %>

		</div>
		
		
		<div class="entry" id="small_<%= e.getUniqueId() %>">
			<a name="<%= e.getUniqueId() %>"></a>
			<div class="amazonblock">
				<% 	if (type.equals("podcast") &&  e.getImageLink() != null) { %>
					<img class="podcastimage" src="<%= e.getImageLink().getValue() %>" title="<%= e.getTitle() %>"/>				
				<% } else { %>
					<%= TextUtils.imgFromLink(e.getAmazonSmallImageLink().getValue()) %>
				<% } %>  			
				   <br/>
				</div>
				<p class="meta">
					<a class="meta" href="" onclick="return false;">
						<%= e.getTitle() %>
						
						<% if (TextUtils.concatenate(e.getAuthors(), ", ").length() > 0) { %>
						 -
							<%= TextUtils.concatenate(e.getAuthors(), ", ") %>
							<% if (e.getYear() != null && e.getYear().length() > 0) { %>
								(<%= e.getYear() %>)
							<% } %>
						<% } %>
						
					</a>
				</p>
			
			<%= TextUtils.truncate(e.getReviewText().getValue(), 320) %> ...
		</div>

		<script>
			var dur = 400;
			$("#small_<%= e.getUniqueId() %>").click(function () {
				$("#small_<%= e.getUniqueId() %>").slideUp(dur, function() {
					$("#large_<%= e.getUniqueId() %>").slideDown(dur);
				  });
			});
			$("#largebtn_<%= e.getUniqueId() %>").click(function () {
				$("#large_<%= e.getUniqueId() %>").slideUp(dur, function() {
					$("#small_<%= e.getUniqueId() %>").slideDown(dur);
				  });
			});
		</script>


		<%
				}
			}
		%>

	</div>
	
	<div style="clear:both">&nbsp;</div>
</div>

<jsp:include page="sidebar.jsp" />




<%
	extent.closeAll();	
%>