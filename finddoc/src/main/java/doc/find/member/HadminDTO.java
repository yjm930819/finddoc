package doc.find.member;

public class HadminDTO extends MemberDTO {
	private String hadminid;
	private String name;
	private String cp;
	private String addr;
	private String detailaddr;
	private String email;
	private String signdate;
	private String hadminidox;
	private String hname;
	private String ykiho;
	private String xpos;
	private String ypos;

	public HadminDTO(String pw, String state, String hadminid, String name, String cp, String addr, String detailaddr,
			String email, String signdate, String hadminidox, String hname, String ykiho, String xpos, String ypos) {
		super(pw, state);
		this.hadminid = hadminid;
		this.name = name;
		this.cp = cp;
		this.addr = addr;
		this.detailaddr = detailaddr;
		this.email = email;
		this.signdate = signdate;
		this.hadminidox = hadminidox;
		this.hname = hname;
		this.ykiho = ykiho;
		this.xpos = xpos;
		this.ypos = ypos;
	}

	public HadminDTO() {
		super();
	}

	public String getHadminid() {
		return hadminid;
	}

	public void setHadminid(String hadminid) {
		this.hadminid = hadminid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCp() {
		return cp;
	}

	public void setCp(String cp) {
		this.cp = cp;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getDetailaddr() {
		return detailaddr;
	}

	public void setDetailaddr(String detailaddr) {
		this.detailaddr = detailaddr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSigndate() {
		return signdate;
	}

	public void setSigndate(String signdate) {
		this.signdate = signdate;
	}

	public String getHadminidox() {
		return hadminidox;
	}

	public void setHadminidox(String hadminidox) {
		this.hadminidox = hadminidox;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getYkiho() {
		return ykiho;
	}

	public void setYkiho(String ykiho) {
		this.ykiho = ykiho;
	}

	public String getXpos() {
		return xpos;
	}

	public void setXpos(String xpos) {
		this.xpos = xpos;
	}

	public String getYpos() {
		return ypos;
	}

	public void setYpos(String ypos) {
		this.ypos = ypos;
	}

	@Override
	public String toString() {
		return "HadminDTO [hadminid=" + hadminid + ", name=" + name + ", cp=" + cp + ", addr=" + addr + ", detailaddr="
				+ detailaddr + ", email=" + email + ", signdate=" + signdate + ", hadminidox=" + hadminidox + ", hname="
				+ hname + ", ykiho=" + ykiho + ", xpos=" + xpos + ", ypos=" + ypos + ", getPw()=" + getPw()
				+ ", getState()=" + getState() + ", toString()=" + super.toString() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + "]";
	}

}