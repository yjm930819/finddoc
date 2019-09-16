package doc.find.authentication;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class SecurityLoginDTO extends User {
	private String category;
	private String id;
	private String pw;
	private String email;
	private String name;

	public SecurityLoginDTO(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
	}

	public SecurityLoginDTO(String username, String password, Collection<? extends GrantedAuthority> authorities,
			String category, String id, String pw, String email, String name) {
		super(username, password, authorities);
		this.category = category;
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "SecurityLoginDTO [category=" + category + ", id=" + id + ", pw=" + pw + ", email=" + email + ", name="
				+ name + "]";
	}

}