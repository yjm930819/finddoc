package doc.find.board;

public class Review_BoardDTO {
	private int reviewboardnum;
	private int reviewcount;
	private String id;
	private String title;
	private String text;
	private String del;
	private String txupdate;
	private String moddate;
	private String APPROVALNUM;
	private int reco;

	public Review_BoardDTO(int reviewboardnum, int reviewcount, String id, String title, String text, String del,
			String txupdate, String moddate, String aPPROVALNUM, int reco) {
		super();
		this.reviewboardnum = reviewboardnum;
		this.reviewcount = reviewcount;
		this.id = id;
		this.title = title;
		this.text = text;
		this.del = del;
		this.txupdate = txupdate;
		this.moddate = moddate;
		APPROVALNUM = aPPROVALNUM;
		this.reco = reco;
	}

	public Review_BoardDTO() {
		super();
	}

	public int getreviewboardnum() {
		return reviewboardnum;
	}

	public void setreviewboardnum(int reviewboardnum) {
		this.reviewboardnum = reviewboardnum;
	}

	public int getreviewcount() {
		return reviewcount;
	}

	public void setreviewcount(int reviewcount) {
		this.reviewcount = reviewcount;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public int getReco() {
		return reco;
	}

	public void setReco(int reco) {
		this.reco = reco;
	}

	@Override
	public String toString() {
		return "Review_BoardDTO [reviewboardnum=" + reviewboardnum + ", reviewcount=" + reviewcount + ", id=" + id
				+ ", title=" + title + ", text=" + text + ", del=" + del + ", txupdate=" + txupdate + ", moddate="
				+ moddate + ", APPROVALNUM=" + APPROVALNUM + ", reco=" + reco + "]";
	}

}