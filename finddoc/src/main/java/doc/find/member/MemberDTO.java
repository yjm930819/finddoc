package doc.find.member;

import javax.validation.constraints.Pattern;

public class MemberDTO {
	@Pattern(regexp = "((?=.*[A-z])(?=.*[0-9])(?=.*[!@#$%^&]).{8,10})", message = "비밀번호를 확인하세요")
	private String pw;
	private String state;

	public MemberDTO(String pw, String state) {
		super();
		this.pw = pw;
		this.state = state;
	}

	public MemberDTO() {
		super();
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "MemberDTO [pw=" + pw + ", state=" + state + "]";
	}

}
