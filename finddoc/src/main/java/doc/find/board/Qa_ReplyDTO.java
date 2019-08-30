package doc.find.board;

public class Qa_ReplyDTO {
	private String id;
	private String reply;
	private String del;
	private String replydate;
	private int qaboardnum;
	private int qareply;

	public Qa_ReplyDTO(String id, String reply, String del, String replydate, int qaboardnum, int qareply) {
		super();
		this.id = id;
		this.reply = reply;
		this.del = del;
		this.replydate = replydate;
		this.qaboardnum = qaboardnum;
		this.qareply = qareply;
	}

	public Qa_ReplyDTO() {
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

	public int getqaboardnum() {
		return qaboardnum;
	}

	public void setqaboardnum(int qaboardnum) {
		this.qaboardnum = qaboardnum;
	}

	public int getqareply() {
		return qareply;
	}

	public void setqareply(int qareply) {
		this.qareply = qareply;
	}

	@Override
	public String toString() {
		return "Qa_ReplyDTO [id=" + id + ", reply=" + reply + ", del=" + del + ", replydate=" + replydate
				+ ", qaboardnum=" + qaboardnum + ", qareply=" + qareply + "]";
	}

}
