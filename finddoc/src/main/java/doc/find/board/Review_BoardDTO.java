package doc.find.board;

public class Review_BoardDTO {
	private int boardnum_seq;
	private int count_seq;
	private String id;
	private String title;
	private String text;
	private String del;
	private String txupdate;
	private String moddate;
	private String APPROVALNUM;
	private int reco;

	public Review_BoardDTO(int boardnum_seq, int count_seq, String id, String title, String text, String del,
			String txupdate, String moddate, String aPPROVALNUM, int reco) {
		super();
		this.boardnum_seq = boardnum_seq;
		this.count_seq = count_seq;
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
		return "Review_BoardDTO [boardnum_seq=" + boardnum_seq + ", count_seq=" + count_seq + ", id=" + id + ", title="
				+ title + ", text=" + text + ", del=" + del + ", txupdate=" + txupdate + ", moddate=" + moddate
				+ ", APPROVALNUM=" + APPROVALNUM + ", reco=" + reco + "]";
	}

}