package doc.find.mypage;

public class mypageDTO {
	public String userid;
	public String ykiho;
	
	public mypageDTO() {
		
	}
	
	public mypageDTO(String userid, String ykiho) {
		super();
		this.userid = userid;
		this.ykiho = ykiho;
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
	
}
