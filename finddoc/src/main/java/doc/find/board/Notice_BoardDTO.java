package doc.find.board;

public class Notice_BoardDTO {
	private int boardnum_seq;
	private int count_seq;
	private String hadminid;
	private String title;
	private String text;
	private String del;
	private String txupdate;
	private String moddate;

	public Notice_BoardDTO(int boardnum_seq, int count_seq, String hadminid, String title, String text, String del,
			String txupdate, String moddate) {
		super();
		this.boardnum_seq = boardnum_seq;
		this.count_seq = count_seq;
		this.hadminid = hadminid;
		this.title = title;
		this.text = text;
		this.del = del;
		this.txupdate = txupdate;
		this.moddate = moddate;
	}

	public Notice_BoardDTO() {
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
		return "Notice_BoardDTO [boardnum_seq=" + boardnum_seq + ", count_seq=" + count_seq + ", hadminid=" + hadminid
				+ ", title=" + title + ", text=" + text + ", del=" + del + ", txupdate=" + txupdate + ", moddate="
				+ moddate + "]";
	}

}