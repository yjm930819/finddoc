package doc.find.authentication;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class MyUsernamePasswordAuthenticationFilter extends UsernamePasswordAuthenticationFilter {

	private String myField;
	// 사용자가 입력할 확률이 거의 없는 구분자를 사용한다

	private final String delimiter = ":===:";

	public String getMyField() {
		return myField;
	}

	public void setMyField(String myField) {
		this.myField = myField;
	}

	@Override
	protected String obtainUsername(HttpServletRequest request) {
		String action = request.getParameter("action");
		String id = request.getParameter("id");
		System.out.println(action + "," + id);
		String combinedUsername = id + delimiter + action;
		System.out.println("Combined username = " + combinedUsername);

		return combinedUsername;
	}

	/*
	 * @Override protected void successfulAuthentication(HttpServletRequest request,
	 * HttpServletResponse response, FilterChain chain, Authentication authResult)
	 * throws IOException, ServletException { //default-target-url에 해당하는 작업
	 * setAuthenticationSuccessHandler(new
	 * SimpleUrlAuthenticationSuccessHandler("/index.do"));
	 * super.successfulAuthentication(request, response, chain, authResult); }
	 */

	@Override
	protected String obtainPassword(HttpServletRequest request) {
		setPasswordParameter(request.getParameter("pw"));
		System.out.println(request.getParameter("pw"));
		return getPasswordParameter();
	}

	@Override
	protected void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException failed) throws IOException, ServletException {
		// authentication-failure-url에 해당하는 작업
		setAuthenticationFailureHandler(new SimpleUrlAuthenticationFailureHandler("/login/loginView.do"));
		super.unsuccessfulAuthentication(request, response, failed);
	}

}
