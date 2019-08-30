package doc.find.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import doc.find.member.MemberDTO;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 로그인유무 체크 - 기존의 사용하던 세션에 loginUser라는 attribute가 있나 확인
		// 로그인 하지 않고 서비스를 사용하려고 하는 경우 방어적 코딩(로그인 페이지로 이동)
		HttpSession ses = request.getSession(false);
		if (ses != null) { // 현재 로그인이 되어 있지 않은 상태
			MemberDTO memberdto = (MemberDTO) ses.getAttribute("loginuser");
			if (memberdto == null) {
				response.sendRedirect("/finddoc/login/loginView.do");
				return false; // 컨트롤러가 호출되지 않도록 false를 리턴
			}
		}
		return true;
	}
}
