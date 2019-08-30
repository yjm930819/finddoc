package doc.find.mypage;

public class MyhospitalDTO {
	// 이용자 아이디
	private String userid;
	
	private String ykiho;
	// 병원이름
	private String hname;
	//병원주소
	private String addr;
	
	public MyhospitalDTO() {
		
	}

	public MyhospitalDTO(String userid, String ykiho, String hname, String addr) {
		super();
		this.userid = userid;
		this.ykiho = ykiho;
		this.hname = hname;
		this.addr = addr;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getYkiho() {
		return ykiho;
	}

	public void setYkiho(String ykiho) {
		this.ykiho = ykiho;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	@Override
	public String toString() {
		return "MyhospitalDTO [userid=" + userid + ", ykiho=" + ykiho + ", hname=" + hname + ", addr=" + addr + "]";
	}
	
	
	
}