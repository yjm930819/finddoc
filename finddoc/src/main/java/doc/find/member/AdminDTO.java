package doc.find.member;

public class AdminDTO extends MemberDTO {
	private String adminid;

	public AdminDTO(String adminid, String pw, String state) {
		super(pw, state);
		this.adminid = adminid;
	}

	public AdminDTO() {
		super();
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	@Override
	public String toString() {
		return "AdminDTO [adminid=" + adminid + ", toString()=" + super.toString() + "]";
	}

}
