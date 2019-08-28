package doc.find.book;

public class BookDTO {
	// 사용자 아이디
	private String userid;
	// 예약번호
	private int booknum_seq;
	// 병원 회원번호
	private String APPROVALNUM;
	// 진료과
	private String major;
	// 예약날짜
	private String bookdate;
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

	public BookDTO(String userid, int booknum_seq, String aPPROVALNUM, String major, String bookdate, String name,
			String birthday, String cp, String text, String ing) {
		super();
		this.userid = userid;
		this.booknum_seq = booknum_seq;
		APPROVALNUM = aPPROVALNUM;
		this.major = major;
		this.bookdate = bookdate;
		this.name = name;
		this.birthday = birthday;
		this.cp = cp;
		this.text = text;
		this.ing = ing;
	}

	public BookDTO() {
		super();
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getBooknum_seq() {
		return booknum_seq;
	}

	public void setBooknum_seq(int booknum_seq) {
		this.booknum_seq = booknum_seq;
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

	public String getBookdate() {
		return bookdate;
	}

	public void setBookdate(String bookdate) {
		this.bookdate = bookdate;
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
		return "BookDTO [userid=" + userid + ", booknum_seq=" + booknum_seq + ", APPROVALNUM=" + APPROVALNUM
				+ ", major=" + major + ", bookdate=" + bookdate + ", name=" + name + ", birthday=" + birthday + ", cp="
				+ cp + ", text=" + text + ", ing=" + ing + "]";
	}

}