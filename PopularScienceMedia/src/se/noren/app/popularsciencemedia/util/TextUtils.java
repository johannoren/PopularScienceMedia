package se.noren.app.popularsciencemedia.util;

import java.util.Set;
import java.util.StringTokenizer;
import java.util.TreeSet;

import com.google.appengine.api.datastore.Text;

public class TextUtils {

	public static String concatenate(Set<String> strs, String delim) {
		if (strs.size() == 0)
			return "";
		
		StringBuffer sb = new StringBuffer();
		for (String s : strs) {
			sb.append(s);
			sb.append(delim);
		}
		
		return sb.substring(0, sb.length() - delim.length());
	}

	
	public static Set<String> splitTrim(String str, String delim) {
		StringTokenizer tok = new StringTokenizer(str, delim);
		Set<String> set = new TreeSet<String>();
		
		while (tok.hasMoreTokens()) {
			set.add(tok.nextToken().trim());
		}
		
		return set;
	}
	
	public static String truncate(String s, int length) {
		if (s.length() < length)
			return s;
		
		String str = s.substring(0, length);
		
		/*
		 * Remove tags!
		 */
		int start = str.lastIndexOf('<');
		int stop  = str.lastIndexOf('>');
		if (start > stop) {
			return str.substring(0, start - 1);
		}
		
		/*
		 * Special case if a href fails
		 */
		start = str.lastIndexOf("<a href");
		stop  = str.lastIndexOf("</a>");
		if (start > stop) {
			return str.substring(0, start - 1);
		}
		
		return str;
	}
	
	public static String imgFromLink(String s) {
		int i = s.indexOf("<img");
		int stop = s.indexOf(">", i);
		return s.substring(i, stop);
	}
	
	public static String fromText(Text t) {
		if (t == null)
			return "";
		return t.getValue();
	}
}
