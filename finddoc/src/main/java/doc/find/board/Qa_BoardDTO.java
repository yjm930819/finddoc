package doc.find.board;

public class Qa_BoardDTO {
	private int boardnum_seq;
	private int count_seq;
	private String userid;
	private String title;
	private String text;
	private String del;
	private String txupdate;
	private String moddate;
	private String APPROVALNUM;

	public Qa_BoardDTO(int boardnum_seq, int count_seq, String userid, String title, String text, String del,
			String txupdate, String moddate, String aPPROVALNUM) {
		super();
		this.boardnum_seq = boardnum_seq;
		this.count_seq = count_seq;
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

	public int getBoardnum_seq() {
		return boardnum_seq;
	}

	public void setBoardnum_seq(int boardnum_seq) {
		this.boardnum_seq = boardnum_seq;
	}

	public int getCount_seq() {
		return count_seq;
	}

	public void setCount_seq(int count_seq) {
		this.count_seq = count_seq;
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
		return "Qa_BoardDTO [boardnum_seq=" + boardnum_seq + ", count_seq=" + count_seq + ", userid=" + userid
				+ ", title=" + title + ", text=" + text + ", del=" + del + ", txupdate=" + txupdate + ", moddate="
				+ moddate + ", APPROVALNUM=" + APPROVALNUM + "]";
	}

}