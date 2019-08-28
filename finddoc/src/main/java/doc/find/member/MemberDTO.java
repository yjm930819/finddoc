package doc.find.member;

public class MemberDTO {
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
