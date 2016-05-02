package VO;

import java.sql.Date;

public class Proceeding {

	private int docid;
	private String clocation;
	private Date cdate;
	private String ceditor;
	
	public int getDocid() {
		return docid;
	}
	
	public void setDocid(int docid) {
		this.docid = docid;
	}

	public String getClocation() {
		return clocation;
	}

	public void setClocation(String clocation) {
		this.clocation = clocation;
	}

	public Date getCdate() {
		return cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	public String getCeditor() {
		return ceditor;
	}

	public void setCeditor(String ceditor) {
		this.ceditor = ceditor;
	}
	
	
}
