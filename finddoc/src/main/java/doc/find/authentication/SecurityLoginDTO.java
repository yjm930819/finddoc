package doc.find.authentication;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class SecurityLoginDTO extends User {
	private String id;
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
	private String ox;
	private String state;
	private String pw;
	private String hname;
	private String ykiho;
	private String xpos;
	private String ypos;

	public SecurityLoginDTO(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
	}

	public SecurityLoginDTO(Collection<? extends GrantedAuthority> authorities, String id, String pw, String name,
			int age, String sn1, String sn2, String gender, String cp, String addr, String detailaddr, String email,
			String signdate, String ox, String state, String hname, String ykiho, String xpos, String ypos) {
		super(id, pw, authorities);
		this.id = id;
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
		this.ox = ox;
		this.state = state;
		this.pw = pw;
		this.hname = hname;
		this.ykiho = ykiho;
		this.xpos = xpos;
		this.ypos = ypos;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getOx() {
		return ox;
	}

	public void setOx(String ox) {
		this.ox = ox;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
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
		return "SecurityLoginDTO [id=" + id + ", name=" + name + ", age=" + age + ", sn1=" + sn1 + ", sn2=" + sn2
				+ ", gender=" + gender + ", cp=" + cp + ", addr=" + addr + ", detailaddr=" + detailaddr + ", email="
				+ email + ", signdate=" + signdate + ", ox=" + ox + ", state=" + state + ", pw=" + pw + ", hname="
				+ hname + ", ykiho=" + ykiho + ", xpos=" + xpos + ", ypos=" + ypos + "]";
	}

}