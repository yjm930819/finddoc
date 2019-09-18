package doc.find.book;

import java.sql.Date;

public class BookDTO {
	// 사용자 아이디
	private String userid;
	// 예약번호
	private int booknum;
	// 병원 회원번호
	private String ykiho;
	
	private String hname;
	// 진료과
	private String major;
	// 예약날짜
	private Date bookdate;
	// 예약시간
	private String hour;
	// 예약 분
	private String mint;
	// 예약자 이름
	private String name;
	// 예약자 생년월일
	private Date birthday;
	// 예약자 전화번호
	private String cp;
	// 비고
	private String text;
	// 예약현황
	private String ing;
	
	public BookDTO() {
		
	}
	
	public BookDTO(String userid, int booknum, String ykiho, String hname, String major, Date bookdate,
			String hour, String mint, String name, Date birthday, String cp, String text, String ing) {
		super();
		this.userid = userid;
		this.booknum = booknum;
		this.ykiho = ykiho;
		this.hname = hname;
		this.major = major;
		this.bookdate = bookdate;
		this.hour = hour;
		this.mint = mint;
		this.name = name;
		this.birthday = birthday;
		this.cp = cp;
		this.text = text;
		this.ing = ing;
	}

	//병원예약시
	public BookDTO(String ykiho, String hname, String major, Date bookdate, String hour, String mint,
			String name, Date birthday, String cp, String text) {
		super();
		this.ykiho = ykiho;
		this.hname = hname;
		this.major = major;
		this.bookdate = bookdate;
		this.hour = hour;
		this.mint = mint;
		this.name = name;
		this.birthday = birthday;
		this.cp = cp;
		this.text = text;
	}

	//예약 수정
	public BookDTO(int booknum, String ykiho, String hname, String major, Date bookdate, String hour, String mint,
			String name, Date birthday, String cp, String text) {
		super();
		this.booknum = booknum;
		this.ykiho = ykiho;
		this.hname = hname;
		this.major = major;
		this.bookdate = bookdate;
		this.hour = hour;
		this.mint = mint;
		this.name = name;
		this.birthday = birthday;
		this.cp = cp;
		this.text = text;
	}

	//예약 중복확인용
	public BookDTO(String ykiho, String major, Date bookdate, String hour, String mint) {
		super();
		this.ykiho = ykiho;
		this.major = major;
		this.bookdate = bookdate;
		this.hour = hour;
		this.mint = mint;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getBooknum() {
		return booknum;
	}

	public void setBooknum(int booknum) {
		this.booknum = booknum;
	}

	public String getYkiho() {
		return ykiho;
	}

	public void setYkiho(String ykiho) {
		this.ykiho = ykiho;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public Date getBookdate() {
		return bookdate;
	}

	public void setBookdate(Date bookdate) {
		this.bookdate = bookdate;
	}

	public String getHour() {
		return hour;
	}

	public void setHour(String hour) {
		this.hour = hour;
	}

	public String getMint() {
		return mint;
	}

	public void setMint(String mint) {
		this.mint = mint;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
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

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	@Override
	public String toString() {
		return "BookDTO [userid=" + userid + ", booknum=" + booknum + ", ykiho=" + ykiho + ", hname=" + hname
				+ ", major=" + major + ", bookdate=" + bookdate + ", hour=" + hour + ", mint=" + mint + ", name=" + name
				+ ", birthday=" + birthday + ", cp=" + cp + ", text=" + text + ", ing=" + ing + "]";
	}

}