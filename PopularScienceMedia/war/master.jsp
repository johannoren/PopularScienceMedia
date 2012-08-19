<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<jsp:include page="header.jsp" />


<body>
<div id="wrapper">
	<div id="header">
		<div id="logo">
			<h1><a href="/master.jsp">popular science media</a></h1>
			<p>aggregating material worth reading</p>
		</div>
	</div>
	<div id="menu">
	<!-- 
		<ul>
			<li><a href="#">News</a></li>
			<li class="current_page_item"><a href="#">Bestsellers</a></li>
			<li><a href="#">Contribute</a></li> 
		</ul>
		 -->
	</div>
	
	<div id="page">

		<% 
			String filterLabel = request.getParameter("filterLabel"); 
			String filterType  = request.getParameter("type"); 
			if (filterLabel == null || filterType == null) { %> 
				<jsp:include page="firstpage.jsp" />
		<% } else {%>
			<jsp:include page="listmedia.jsp" />
		<% } %>
		
		<div style="clear:both">&nbsp;</div> 
		
	</div>
</div>


<jsp:include page="footer.jsp" />

</body>
</html>