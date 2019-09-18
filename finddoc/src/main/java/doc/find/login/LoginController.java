package doc.find.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.HttpEntityMethodProcessor;

import doc.find.member.AdminDTO;
import doc.find.member.HadminDTO;
import doc.find.member.MemberDTO;
import doc.find.member.UserDTO;

@Controller
public class LoginController {
	@Autowired
	LoginService loginService;

	// 로그아웃
	/*@RequestMapping("/login/logout.do")
	public String logout(HttpServletRequest req) throws Exception {
		HttpSession ses = req.getSession(false);
		if (ses != null) {
			ses.invalidate();
		}
		return "login/login";
	}*/

	// 로그인 눌렀을때 아이디,비밀번호 비교해서 로그인처리
	/*@RequestMapping("/login/login.do")
	public ModelAndView login(String action, LoginDTO logindto, HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();
		if (action == null) {
			mav.addObject("select", "사용자 구분을 선택하세요.");
			mav.setViewName("login/login");
			return mav;
		}
		MemberDTO memberdto = loginService.login(action, logindto);
		if (memberdto == null) {
			mav.addObject("login", "아이디 비밀번호가 틀렸습니다.");
			mav.setViewName("login/login");
			return mav;
		} else {
			HttpSession ses = null;
			if (memberdto != null) {
				ses = req.getSession();
			}
			if (memberdto instanceof UserDTO) {
				UserDTO user = (UserDTO) memberdto;
				if (user.getUseridox().equals("x")) {
					mav.addObject("del", "회원탈퇴된 사용자입니다.");
					mav.setViewName("login/login");
					return mav;
				}
				ses.setAttribute("loginuser", user);
			} else if (memberdto instanceof HadminDTO) {
				HadminDTO hadmin = (HadminDTO) memberdto;
				if (hadmin.getHadminidox().equals("x")) {
					mav.addObject("del", "회원탈퇴된 사용자입니다.");
					mav.setViewName("login/login");
					return mav;
				}
				ses.setAttribute("loginuser", hadmin);
			} else {
				AdminDTO admin = (AdminDTO) memberdto;
				ses.setAttribute("loginuser", admin);
			}
			mav.setViewName("login/loginAfter");
			return mav;
		}
	}
*/
	// 로그인 성공후 화면
	@RequestMapping("/login/loginAfter.do")
	public String loginAfter() {
		return "login/loginAfter";
	}

	// 아이디찾기 버튼 눌렀을때
	@RequestMapping("/login/idSearch.do")
	public ModelAndView idSearch(LoginDTO user) {
		ModelAndView mav = new ModelAndView();
		MemberDTO memberdto = loginService.idSearch(user);
		if (memberdto == null) {
			mav.addObject("incorrect", "정보가 맞지 않습니다.");
			mav.setViewName("login/idSearchView");
			return mav;
		}
		String id;
		if (memberdto instanceof UserDTO) {
			UserDTO userdto = (UserDTO) memberdto;
			id = userdto.getUserid();
		} else {
			HadminDTO hadmindto = (HadminDTO) memberdto;
			id = hadmindto.getHadminid();
		}
		mav.addObject("result", id);
		mav.setViewName("login/idSearchView");
		return mav;
	}

	// 비밀번호 버튼 눌렀을때
	@RequestMapping("/login/pwSearch.do")
	public ModelAndView pwSearch(LoginDTO user) {
		ModelAndView mav = new ModelAndView();
		MemberDTO memberdto = loginService.pwSearch(user);
		if (memberdto == null) {
			mav.addObject("incorrect", "정보가 맞지 않습니다.");
			mav.setViewName("login/pwSearchView");
			return mav;
		}
		mav.addObject("result", memberdto.getPw());
		mav.setViewName("login/pwSearchView");
		return mav;
	}

	// 로그인화면으로 이동
	@RequestMapping("/login/loginView.do")
	public String loginView() {
		return "login/login";
	}
}
