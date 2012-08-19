<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="javax.jdo.PersistenceManager"%>
<%@page import="javax.jdo.Extent"%>
<%@page import="se.noren.app.popularsciencemedia.datastore.MediaObject"%>
<%@page import="se.noren.app.popularsciencemedia.datastore.PMF"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.TreeSet"%>


<%
	PersistenceManager pm = PMF.get().getPersistenceManager();
	Extent<MediaObject> extent = pm.getExtent(MediaObject.class, false);
	Set<String> bookLabels = new TreeSet<String>(); 
	for (MediaObject e : extent) {
		if (e.getType() == null || e.getType().getValue().equals("book"))
			bookLabels.addAll(e.getLabels());
	}
	Set<String> podcastLabels = new TreeSet<String>(); 
	for (MediaObject e : extent) {
		if (e.getType() != null && e.getType().getValue().equals("podcast"))
			podcastLabels.addAll(e.getLabels());
	}
	Set<String> moviesLabels = new TreeSet<String>(); 
	for (MediaObject e : extent) {
		if (e.getType() != null && e.getType().getValue().equals("movie"))
			moviesLabels.addAll(e.getLabels());
	}
%>



<div id="sidebar">
	<ul>
		<li>
			<p>
				<strong>Popular Science Media</strong> is made by curious people, for curious people. 
				By aggregating quality books, podcasts and films you'll always 
				have interesting and fascinating material at hand.
			</p>
			<p> 
				The purpose of the site is to promote only the best in the genre of popular science.
				Browse the categories of your interests and enjoy the world of good popular science.
			</p>
		</li>
		<li>
			<h2>Categories</h2>
			<ul>
				<li>	
					<div><h3><img src="images/books.png" class="categoryimage" /> Books</h3></div>
				</li>
				<%	
				for (String label : bookLabels) {
				%>			
					<li class="label"><a href="master.jsp?type=book&filterLabel=<%= label.toLowerCase() %>"><%= label.toLowerCase() %></a></li>			
				<%
				}
				%>
			</ul>

			<ul>
				<li>	
					<div><h3><img src="images/movies.png" class="categoryimage" /> Films</h3></div>
				</li>
				<%	
				for (String label : moviesLabels) {
				%>			
					<li class="label"><a href="master.jsp?type=movie&filterLabel=<%= label.toLowerCase() %>"><%= label.toLowerCase() %></a></li>			
				<%
				}
				%>
			</ul>
			<ul>
				<li>	
					<div><h3><img src="images/podcasts.png" class="categoryimage" /> Podcasts</h3></div>
				</li>
				<%	
				for (String label : podcastLabels) {
				%>			
					<li class="label"><a href="master.jsp?type=podcast&filterLabel=<%= label.toLowerCase() %>"><%= label.toLowerCase() %></a></li>			
				<%
				}
				%>
			</ul>

		</li>
	</ul>
	<br /> 	
		
	<script type="text/javascript"><!--
	google_ad_client = "ca-pub-4580803282363331";
	/* Popular Science Media */
	google_ad_slot = "3794778831";
	google_ad_width = 160;
	google_ad_height = 600;
	//-->
	</script>
	<script type="text/javascript"
	src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
	</script>
	
</div>