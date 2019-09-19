package doc.find.authentication;

public class AuthorityDTO {
	private String authority;

	public AuthorityDTO(String authority) {
		super();
		this.authority = authority;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	@Override
	public String toString() {
		return "AuthorityDTO [authority=" + authority + "]";
	}

}
