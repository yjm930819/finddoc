package doc.find.board;

public class Review_ReplyDTO {
	private String id;
	private String reply;
	private String del;
	private String replydate;
	private int reviewboardnum;
	private int reviewreply;

	public Review_ReplyDTO(String id, String reply, String del, String replydate, int reviewboardnum, int reviewreply) {
		super();
		this.id = id;
		this.reply = reply;
		this.del = del;
		this.replydate = replydate;
		this.reviewboardnum = reviewboardnum;
		this.reviewreply = reviewreply;
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

	public int getreviewboardnum() {
		return reviewboardnum;
	}

	public void setreviewboardnum(int reviewboardnum) {
		this.reviewboardnum = reviewboardnum;
	}

	public int getreviewreply() {
		return reviewreply;
	}

	public void setreviewreply(int reviewreply) {
		this.reviewreply = reviewreply;
	}

	@Override
	public String toString() {
		return "Review_ReplyDTO [id=" + id + ", reply=" + reply + ", del=" + del + ", replydate=" + replydate
				+ ", reviewboardnum=" + reviewboardnum + ", reviewreply=" + reviewreply + "]";
	}

}
