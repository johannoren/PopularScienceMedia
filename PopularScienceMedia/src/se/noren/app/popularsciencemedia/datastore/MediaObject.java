package se.noren.app.popularsciencemedia.datastore;

import java.util.Set;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import com.google.appengine.api.datastore.Text;

import com.google.appengine.api.datastore.Key;

@PersistenceCapable
public class MediaObject {

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key key;

	@Persistent
	private String title;

	@Persistent
	private Set<String> authors;

	public Set<String> getAuthors() {
		return authors;
	}

	public void setAuthors(Set<String> authors) {
		this.authors = authors;
	}

	@Persistent
	private String year;

	@Persistent
	private Set<String> labels;
	
	@Persistent
	private Text amazonBigImageLink;

	@Persistent
	private Text amazonSmallImageLink;
	
	@Persistent
	private Text amazonTextLink;

	@Persistent
	private Text amazonHiddenImageLink;
	
	@Persistent
	private Text reviewText;

	@Persistent
	private Text type;

	@Persistent
	private Text imageLink;

	
	public Text getImageLink() {
		return imageLink;
	}

	public void setImageLink(Text imageLink) {
		this.imageLink = imageLink;
	}

	public String getUniqueId() {
		return "psmid" + key.getId();
	}
	

	public Text getType() {
		return type;
	}

	public void setType(Text type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public Set<String> getLabels() {
		return labels;
	}

	public void setLabels(Set<String> labels) {
		this.labels = labels;
	}

	public Text getAmazonBigImageLink() {
		return amazonBigImageLink;
	}

	public void setAmazonBigImageLink(Text amazonBigImageLink) {
		this.amazonBigImageLink = amazonBigImageLink;
	}

	public Text getAmazonSmallImageLink() {
		return amazonSmallImageLink;
	}

	public void setAmazonSmallImageLink(Text amazonSmallImageLink) {
		this.amazonSmallImageLink = amazonSmallImageLink;
	}

	public Text getAmazonTextLink() {
		return amazonTextLink;
	}

	public void setAmazonTextLink(Text amazonTextLink) {
		this.amazonTextLink = amazonTextLink;
	}

	public Text getAmazonHiddenImageLink() {
		return amazonHiddenImageLink;
	}

	public void setAmazonHiddenImageLink(Text amazonHiddenImageLink) {
		this.amazonHiddenImageLink = amazonHiddenImageLink;
	}

	public Text getReviewText() {
		return reviewText;
	}

	public void setReviewText(Text reviewText) {
		this.reviewText = reviewText;
	}

	public Key getKey() {
		return key;
	}

	
}
