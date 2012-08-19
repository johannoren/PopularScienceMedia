package se.noren.app.popularsciencemedia;
import java.io.IOException;

import javax.jdo.Extent;
import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import se.noren.app.popularsciencemedia.datastore.MediaObject;
import se.noren.app.popularsciencemedia.datastore.PMF;
import se.noren.app.popularsciencemedia.util.TextUtils;

import com.google.appengine.api.datastore.Text;


@SuppressWarnings("serial")
public class EditResourceServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
	
		String title      = req.getParameter("title");
		String authors    = req.getParameter("authors");
		String year       = req.getParameter("year");
		String labels     = req.getParameter("labels");
		String bigImage   = req.getParameter("bigimage");
		String smallImage = req.getParameter("smallimage");
		String podcastLink= req.getParameter("podcastlink");
		String review     = req.getParameter("review");
		String type       = req.getParameter("type");
		String key        = req.getParameter("key");
		String link       = "";
		
		
        PersistenceManager pm = PMF.get().getPersistenceManager();
        Extent<MediaObject> extent = pm.getExtent(MediaObject.class, false);
        MediaObject mo = null;
        for (MediaObject m : extent) {
        	if (m.getKey().toString().equals(key)) {
        		mo = m;
        	}
        }
        
        mo.setAmazonBigImageLink(new Text(bigImage));
        mo.setAmazonSmallImageLink(new Text(smallImage));
        mo.setAmazonTextLink(new Text(link));
        mo.setAuthors(TextUtils.splitTrim(authors, ","));
        mo.setLabels(TextUtils.splitTrim(labels, ","));
        mo.setReviewText(new Text(review));
        mo.setTitle(title);
        mo.setYear(year);
        mo.setType(new Text(type));
        
        if (podcastLink != null) {
        	mo.setImageLink(new Text(podcastLink));
        }
        

        try {
            pm.flush();
        } finally {
            pm.close();
        }
        
        
	}
}
