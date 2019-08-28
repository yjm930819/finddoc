package doc.find.board;

public class Review_ReplyDTO {
	private String id;
	private String reply;
	private String del;
	private String replydate;
	private int boardnum;
	private int reply_seq;

	public Review_ReplyDTO(String id, String reply, String del, String replydate, int boardnum, int reply_seq) {
		super();
		this.id = id;
		this.reply = reply;
		this.del = del;
		this.replydate = replydate;
		this.boardnum = boardnum;
		this.reply_seq = reply_seq;
	}

	public Review_ReplyDTO() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public int getReply_seq() {
		return reply_seq;
	}

	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}

	@Override
	public String toString() {
		return "Review_ReplyDTO [id=" + id + ", reply=" + reply + ", del=" + del + ", replydate=" + replydate
				+ ", boardnum=" + boardnum + ", reply_seq=" + reply_seq + "]";
	}

}
