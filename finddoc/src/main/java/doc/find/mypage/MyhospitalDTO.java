package doc.find.mypage;

public class MyhospitalDTO {
	// 이용자 아이디
	private String userid;
	// 병원 회원번호
	private String APPROVALNUM;
	// 병원삭제 유무
	private String ox;

	public MyhospitalDTO(String userid, String aPPROVALNUM, String ox) {
		super();
		this.userid = userid;
		APPROVALNUM = aPPROVALNUM;
		this.ox = ox;
	}

	public MyhospitalDTO() {
		super();
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getAPPROVALNUM() {
		return APPROVALNUM;
	}

	public void setAPPROVALNUM(String aPPROVALNUM) {
		APPROVALNUM = aPPROVALNUM;
	}

	public String getOx() {
		return ox;
	}

	public void setOx(String ox) {
		this.ox = ox;
	}

	@Override
	public String toString() {
		return "MyhospitalDTO [userid=" + userid + ", APPROVALNUM=" + APPROVALNUM + ", ox=" + ox + "]";
	}

}