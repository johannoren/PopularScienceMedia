<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="se.noren.app.popularsciencemedia.datastore.PMF"%>
<%@page import="javax.jdo.PersistenceManager"%>
<%@page import="javax.jdo.Extent"%>
<%@page import="se.noren.app.popularsciencemedia.datastore.MediaObject"%>
<%@page import="se.noren.app.popularsciencemedia.util.TextUtils"%>







<div class="inner_copy">
	<div class="inner_copy">Popular Science Media</div>
</div>
<div id="content">
	<div id="banner"><img src="images/img07.jpg" alt="" /></div>
	<div class="post">
		<h2>News</h2>
		
		<div class="entry"> 
			<div class="newsarticelblock">
				<img class="newsarticleimage" src="images/pulitzer.jpg" />
			</div>
			<p class="meta">The 2011 Pulitzer prize</p>
			<p>
			The Pulitzer prize, established by American publisher Joseph Pulitzer in 1917, annualy awards 
			excellence in newspaper journalism, literary achievements, and musical composition. One of the 
			twenty-one categories awarded, <i>General Nonfiction,</i> guarantees interesting scientific 
			reading in a literary compelling way.
			 </p>
			 <p>
			We've added a few of recent winners and finalists including the 2011 winner Siddhartha Mukherjee's 
			<i>The Emperor of All Maladies: A Biography of Cancer</i>.
			</p>
			<p>Check out more of Pulitzer prize winners at <a href="http://www.pulitzer.org/bycat/General-Nonfiction">www.pulitzer.org</a>.</p>
		</div>

		<div class="entry"> 
			<div class="newsarticelblock">
				<img class="newsarticleimage" src="images/bookstack.jpg" />
			</div>
			<p class="meta">Better late than never</p>
			<p>
			A little late for the 150<sup>th</sup> anniversary of Charles Darwin's <i>On the Origin of Species</i> we have added a series of great books on
			evolutionary biology, geneology and human evolution. Check out the <a href="master.jsp?type=book&filterLabel=biology">biology</a> section.
			 </p>
		</div>

		<div class="entry"> 
			<div class="newsarticelblock">
				<img class="newsarticleimage" src="images/headphones.jpg" />
			</div>
			<p class="meta">Podcasts on your iPhone</p>
			<p>
				Questions concerning how to get your science podcasts on your mp3 device is unfortunately 
				out of scope for this site, 
				but if you are an iOS device owner <a href="http://www.ehow.com/how_2075782_receive-podcasts-iphone.html">
				this</a> should point you in the right direction. 
				</p>
				<p>
				A nice feature for iOS owners, you can speed up a podcast without creating chipmunk voices simply with a few  
				<a href="http://www.ehow.com/how_8708438_speed-up-iphone-podcasts.html">clicks</a> making listening more efficient.
			 </p>
		</div>

	<!-- 
		<div class="entry"> 
			<div class="newsarticelblock">
				<img class="newsarticleimage" src="images/winton.jpg" />
			</div>
			<p class="meta">Ro</p>
			<p>
				Questions concerning how to get your science podcasts on your mp3 device is unfortunately 
				out of scope for this site, 
				but if you are an iOS device owner <a href="http://www.ehow.com/how_2075782_receive-podcasts-iphone.html">
				this</a> should point you in the right direction. 
				</p>
				<p>
				A nice feature for iOS owners, you can speed up a podcast without creating chipmunk voices simply with a few  
				<a href="http://www.ehow.com/how_8708438_speed-up-iphone-podcasts.html">clicks</a> making listening more efficient.
			 </p>
		</div>

 -->
	</div>
	
	<div style="clear:both">&nbsp;</div>
</div>

<jsp:include page="sidebar.jsp" />
