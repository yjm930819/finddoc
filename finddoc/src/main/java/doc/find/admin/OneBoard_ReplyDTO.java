package doc.find.admin;

public class OneBoard_ReplyDTO {
	private String hadminid;
	private String reply;
	private String del;
	private String replydate;
	private int boardnum_seq;
	private int reply_seq;

	public OneBoard_ReplyDTO(String hadminid, String reply, String del, String replydate, int boardnum_seq,
			int reply_seq) {
		super();
		this.hadminid = hadminid;
		this.reply = reply;
		this.del = del;
		this.replydate = replydate;
		this.boardnum_seq = boardnum_seq;
		this.reply_seq = reply_seq;
	}

	public OneBoard_ReplyDTO() {
		super();
	}

	public String getHadminid() {
		return hadminid;
	}

	public void setHadminid(String hadminid) {
		this.hadminid = hadminid;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

	public String getReplydate() {
		return replydate;
	}

	public void setReplydate(String replydate) {
		this.replydate = replydate;
	}

	public int getBoardnum_seq() {
		return boardnum_seq;
	}

	public void setBoardnum_seq(int boardnum_seq) {
		this.boardnum_seq = boardnum_seq;
	}

	public int getReply_seq() {
		return reply_seq;
	}

	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}

	@Override
	public String toString() {
		return "OneBoard_ReplyDTO [hadminid=" + hadminid + ", reply=" + reply + ", del=" + del + ", replydate="
				+ replydate + ", boardnum_seq=" + boardnum_seq + ", reply_seq=" + reply_seq + "]";
	}

}
