package doc.find.admin;

public class Admin_AppDTO {
	// 병원관계자 아이디
	private String hadminid;
	// 승인유무
	private String approval;
	// 회원번호(=승인대기번호)
	private int approvalnum;

	public Admin_AppDTO(String hadminid, String approval, int approvalnum) {
		super();
		this.hadminid = hadminid;
		this.approval = approval;
		this.approvalnum = approvalnum;
	}

	public Admin_AppDTO() {
		super();
	}

	public String getHadminid() {
		return hadminid;
	}

	public void setHadminid(String hadminid) {
		this.hadminid = hadminid;
	}

	public String getApproval() {
		return approval;
	}

	public void setApproval(String approval) {
		this.approval = approval;
	}

	public int getapprovalnum() {
		return approvalnum;
	}

	public void setapprovalnum(int approvalnum) {
		this.approvalnum = approvalnum;
	}

	@Override
	public String toString() {
		return "Admin_AppDTO [hadminid=" + hadminid + ", approval=" + approval + ", approvalnum=" + approvalnum
				+ "]";
	}

}