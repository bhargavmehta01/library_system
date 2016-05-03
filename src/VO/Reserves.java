package VO;

import java.sql.Timestamp;

public class Reserves {
	
	private int reserveid;
	private int readerid;
	private int docid;
	private int copyno;
	private int libid;
	private Timestamp dtime;
	
	public int getReserveid() {
		return reserveid;
	}
	
	public void setReserveid(int reserveid) {
		this.reserveid = reserveid;
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

	public Timestamp getDtime() {
		return dtime;
	}

	public void setDtime(Timestamp dtime) {
		this.dtime = dtime;
	}
	
	

}
