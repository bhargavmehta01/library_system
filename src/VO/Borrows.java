package VO;

import java.sql.Timestamp;

public class Borrows {
	private int bornumber;
	private int readerid;
	private int docid;
	private int copyno;
	private int libid;
	private Timestamp bdtime;
	private Timestamp rdtime;
	
	public int getBornumber() {
		return bornumber;
	}
	
	
	public void setBornumber(int bornumber) {
		this.bornumber = bornumber;
	}


	public int getReaderid() {
		return readerid;
	}


	public void setReaderid(int readerid) {
		this.readerid = readerid;
	}


	public int getDocid() {
		return docid;
	}


	public void setDocid(int docid) {
		this.docid = docid;
	}


	public int getCopyno() {
		return copyno;
	}


	public void setCopyno(int copyno) {
		this.copyno = copyno;
	}


	public int getLibid() {
		return libid;
	}


	public void setLibid(int libid) {
		this.libid = libid;
	}


	public Timestamp getBdtime() {
		return bdtime;
	}


	public void setBdtime(Timestamp bdtime) {
		this.bdtime = bdtime;
	}


	public Timestamp getRdtime() {
		return rdtime;
	}


	public void setRdtime(Timestamp rdtime) {
		this.rdtime = rdtime;
	}
	
	
}
