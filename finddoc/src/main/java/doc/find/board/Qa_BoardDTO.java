package doc.find.board;

public class Qa_BoardDTO {
	private int qaboardnum;
	private int qacount;
	private String userid;
	private String title;
	private String text;
	private String del;
	private String txupdate;
	private String moddate;
	private String APPROVALNUM;

	public Qa_BoardDTO(int qaboardnum, int qacount, String userid, String title, String text, String del,
			String txupdate, String moddate, String aPPROVALNUM) {
		super();
		this.qaboardnum = qaboardnum;
		this.qacount = qacount;
		this.userid = userid;
		this.title = title;
		this.text = text;
		this.del = del;
		this.txupdate = txupdate;
		this.moddate = moddate;
		APPROVALNUM = aPPROVALNUM;
	}

	public Qa_BoardDTO() {
		super();
	}

	public int getqaboardnum() {
		return qaboardnum;
	}

	public void setqaboardnum(int qaboardnum) {
		this.qaboardnum = qaboardnum;
	}

	public int getqacount() {
		return qacount;
	}

	public void setqacount(int qacount) {
		this.qacount = qacount;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
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

	public String getAPPROVALNUM() {
		return APPROVALNUM;
	}

	public void setAPPROVALNUM(String aPPROVALNUM) {
		APPROVALNUM = aPPROVALNUM;
	}

	@Override
	public String toString() {
		return "Qa_BoardDTO [qaboardnum=" + qaboardnum + ", qacount=" + qacount + ", userid=" + userid
				+ ", title=" + title + ", text=" + text + ", del=" + del + ", txupdate=" + txupdate + ", moddate="
				+ moddate + ", APPROVALNUM=" + APPROVALNUM + "]";
	}

}