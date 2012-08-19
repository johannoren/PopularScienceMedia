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
	<div id="banner"><img src="images/img07.jpg" alt="" /></div>
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
				if (e.getLabels().contains(filterLabel) && type.equals(filterType)) {
		%>
	
		
		<div class="entry">
			<div class="amazonblock">
				<%= e.getAmazonBigImageLink().getValue() %>  
				   <br/>
				<a href="<%= e.getAmazonTextLink().getValue() %>  ">
					<img src="images/buy-from.gif" title="<%= e.getTitle() %>"/>
				</a>
			
				
				</div>
			<p class="meta"><%= e.getTitle() %> - <%= TextUtils.concatenate(e.getAuthors(), ", ") %></p>
			
			<%= e.getReviewText().getValue() %>
				
				
			<p class="links">
				<a href="<%= e.getAmazonTextLink().getValue() %>" class="more">Prices
				</a><img src="<%= e.getAmazonHiddenImageLink().getValue() %>" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="<%= e.getAmazonTextLink().getValue() %>" class="comments">More reviews</a>
			</p>
		</div>


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