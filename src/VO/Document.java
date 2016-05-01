package VO;

import java.sql.Date;

public class Document {

	private int docid;
	private String title;
	private int pubid;
	private Date pubdate;
	
	public String getTitle() {
		return title;
	}
	
	
	public void setTitle(String title) {
		this.title = title;
	}
	

	public int getPubid() {
		return pubid;
	}


	public void setPubid(int pubid) {
		this.pubid = pubid;
	}


	public int getDocid() {
		return docid;
	}


	public void setDocid(int docid) {
		this.docid = docid;
	}


	public Date getPubdate() {
		return pubdate;
	}


	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}
}
