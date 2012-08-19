package se.noren.app.popularsciencemedia;
import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.Text;

import se.noren.app.popularsciencemedia.datastore.MediaObject;
import se.noren.app.popularsciencemedia.datastore.PMF;
import se.noren.app.popularsciencemedia.util.TextUtils;


@SuppressWarnings("serial")
public class AddResourceServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
	
		String title      = req.getParameter("title");
		String authors    = req.getParameter("authors");
		String year       = req.getParameter("year");
		String labels     = req.getParameter("labels");
		String bigImage   = req.getParameter("bigimage");
		String smallImage = req.getParameter("smallimage");
		String linkRaw    = req.getParameter("link");
		String podcastLink= req.getParameter("podcastlink");
		String review     = req.getParameter("review");
		String type       = req.getParameter("type");
		String link       = "";
		String hiddenImg  = "";
		
		if (linkRaw != null && linkRaw.length() > 0) {
			int firstMark     = linkRaw.indexOf("\"");
			int secondMark    = linkRaw.indexOf("\"", firstMark + 1);
			link       = linkRaw.substring(firstMark + 1, secondMark);
	
			firstMark         = linkRaw.indexOf("<img src=");
			secondMark        = linkRaw.indexOf("\"", firstMark + 10);
	
			hiddenImg  = linkRaw.substring(firstMark + 10, secondMark);
		}
		
		
        MediaObject mo = new MediaObject();
        mo.setAmazonBigImageLink(new Text(bigImage));
        mo.setAmazonSmallImageLink(new Text(smallImage));
        mo.setAmazonTextLink(new Text(link));
        mo.setAuthors(TextUtils.splitTrim(authors, ","));
        mo.setLabels(TextUtils.splitTrim(labels, ","));
        mo.setReviewText(new Text(review));
        mo.setTitle(title);
        mo.setYear(year);
        mo.setAmazonHiddenImageLink(new Text(hiddenImg));
        mo.setType(new Text(type));
        
        if (podcastLink != null) {
        	mo.setImageLink(new Text(podcastLink));
        }
        
        PersistenceManager pm = PMF.get().getPersistenceManager();

        try {
            pm.makePersistent(mo);
        } finally {
            pm.close();
        }
        
        
	}
}
