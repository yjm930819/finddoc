package doc.find.receipt;

public class ReceiptDTO {
	// 사용자 아이디
	private String userid;
	// 접수번호
	private int receiptnum_seq;
	// 병원 회원번호
	private String APPROVALNUM;
	// 진료과
	private String major;
	// 접수날짜
	private String receiptdate;
	// 사용자 이름
	private String name;
	// 사용자 생년월일
	private String birthday;
	// 사용자 전화번호
	private String cp;
	// 비고
	private String text;
	// 예약현황
	private String ing;

	public ReceiptDTO(String userid, int receiptnum_seq, String aPPROVALNUM, String major, String receiptdate,
			String name, String birthday, String cp, String text, String ing) {
		super();
		this.userid = userid;
		this.receiptnum_seq = receiptnum_seq;
		APPROVALNUM = aPPROVALNUM;
		this.major = major;
		this.receiptdate = receiptdate;
		this.name = name;
		this.birthday = birthday;
		this.cp = cp;
		this.text = text;
		this.ing = ing;
	}

	public ReceiptDTO() {
		super();
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getReceiptnum_seq() {
		return receiptnum_seq;
	}

	public void setReceiptnum_seq(int receiptnum_seq) {
		this.receiptnum_seq = receiptnum_seq;
	}

	public String getAPPROVALNUM() {
		return APPROVALNUM;
	}

	public void setAPPROVALNUM(String aPPROVALNUM) {
		APPROVALNUM = aPPROVALNUM;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getReceiptdate() {
		return receiptdate;
	}

	public void setReceiptdate(String receiptdate) {
		this.receiptdate = receiptdate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getCp() {
		return cp;
	}

	public void setCp(String cp) {
		this.cp = cp;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getIng() {
		return ing;
	}

	public void setIng(String ing) {
		this.ing = ing;
	}

	@Override
	public String toString() {
		return "ReceiptDTO [userid=" + userid + ", receiptnum_seq=" + receiptnum_seq + ", APPROVALNUM=" + APPROVALNUM
				+ ", major=" + major + ", receiptdate=" + receiptdate + ", name=" + name + ", birthday=" + birthday
				+ ", cp=" + cp + ", text=" + text + ", ing=" + ing + "]";
	}

}