package doc.find.admin;

public class Admin_AppDTO {
	// 병원관계자 아이디
	private String hadminid;
	// 승인유무
	private String approval;
	// 회원번호(=승인대기번호)
	private int approvalnum_seq;

	public Admin_AppDTO(String hadminid, String approval, int approvalnum_seq) {
		super();
		this.hadminid = hadminid;
		this.approval = approval;
		this.approvalnum_seq = approvalnum_seq;
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

	public int getApprovalnum_seq() {
		return approvalnum_seq;
	}

	public void setApprovalnum_seq(int approvalnum_seq) {
		this.approvalnum_seq = approvalnum_seq;
	}

	@Override
	public String toString() {
		return "Admin_AppDTO [hadminid=" + hadminid + ", approval=" + approval + ", approvalnum_seq=" + approvalnum_seq
				+ "]";
	}

}