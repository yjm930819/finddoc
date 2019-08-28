package doc.find.member;

public class UserDTO extends MemberDTO {
	private String userid;
	private String name;
	private int age;
	private String sn1;
	private String sn2;
	private String gender;
	private String cp;
	private String addr;
	private String detailaddr;
	private String email;
	private String signdate;
	private String useridox;

	public UserDTO(String userid, String name, int age, String pw, String sn1, String sn2, String gender, String cp,
			String addr, String detailaddr, String email, String signdate, String useridox, String state) {
		super(pw, state);
		this.userid = userid;
		this.name = name;
		this.age = age;
		this.sn1 = sn1;
		this.sn2 = sn2;
		this.gender = gender;
		this.cp = cp;
		this.addr = addr;
		this.detailaddr = detailaddr;
		this.email = email;
		this.signdate = signdate;
		this.useridox = useridox;
	}

	public UserDTO() {
		super();
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;

	}

	public String getSn1() {
		return sn1;
	}

	public void setSn1(String sn1) {
		this.sn1 = sn1;
	}

	public String getSn2() {
		return sn2;
	}

	public void setSn2(String sn2) {
		this.sn2 = sn2;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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

	public String getUseridox() {
		return useridox;
	}

	public void setUseridox(String useridox) {
		this.useridox = useridox;
	}

	@Override
	public String toString() {
		return "UserDTO [userid=" + userid + ", name=" + name + ", age=" + age + ", sn1=" + sn1 + ", sn2=" + sn2
				+ ", gender=" + gender + ", cp=" + cp + ", addr=" + addr + ", detailaddr=" + detailaddr + ", email="
				+ email + ", signdate=" + signdate + ", useridox=" + useridox + ", toString()=" + super.toString()
				+ "]";
	}

}