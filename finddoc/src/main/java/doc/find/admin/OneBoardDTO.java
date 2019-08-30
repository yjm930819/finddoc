package doc.find.admin;

public class OneBoardDTO {
	private int oneboardnum;
	private int onecount;
	private String hadminid;
	private String title;
	private String text;
	private String del;
	private String txupdate;
	private String moddate;

	public OneBoardDTO(int oneboardnum, int onecount, String hadminid, String title, String text, String del,
			String txupdate, String moddate) {
		super();
		this.oneboardnum = oneboardnum;
		this.onecount = onecount;
		this.hadminid = hadminid;
		this.title = title;
		this.text = text;
		this.del = del;
		this.txupdate = txupdate;
		this.moddate = moddate;
	}

	public OneBoardDTO() {
		super();
	}

	public int getoneboardnum() {
		return oneboardnum;
	}

	public void setoneboardnum(int oneboardnum) {
		this.oneboardnum = oneboardnum;
	}

	public int getonecount() {
		return onecount;
	}

	public void setonecount(int onecount) {
		this.onecount = onecount;
	}

	public String getHadminid() {
		return hadminid;
	}

	public void setHadminid(String hadminid) {
		this.hadminid = hadminid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

	public String getTxupdate() {
		return txupdate;
	}

	public void setTxupdate(String txupdate) {
		this.txupdate = txupdate;
	}

	public String getModdate() {
		return moddate;
	}

	public void setModdate(String moddate) {
		this.moddate = moddate;
	}

	@Override
	public String toString() {
		return "OneBoardDTO [oneboardnum=" + oneboardnum + ", onecount=" + onecount + ", hadminid=" + hadminid
				+ ", title=" + title + ", text=" + text + ", del=" + del + ", txupdate=" + txupdate + ", moddate="
				+ moddate + "]";
	}

}