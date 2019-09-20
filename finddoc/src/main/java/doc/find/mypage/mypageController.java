package doc.find.mypage;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import doc.find.authentication.SecurityLoginDTO;
import doc.find.member.UserDTO;

@Controller
public class mypageController {
	@Autowired
	mypageService service;

	// 자주가는 병원 목록보여주기
	@RequestMapping("/mypage/bookmark.do")
	public ModelAndView bookmarklist(Principal principal) {
		SecurityLoginDTO loginUser = (SecurityLoginDTO) ((UsernamePasswordAuthenticationToken) principal)
				.getPrincipal();

		ModelAndView mav = new ModelAndView();
		List<MyhospitalDTO> bookmarklist = service.selectAll(loginUser.getId());
		mav.setViewName("mypage/bookmark");
		mav.addObject("bookmarklist", bookmarklist);
		return mav;
	}

	// 자주가는 병원 등록
	@RequestMapping(value = "/mypage/insert_bookmark.do", method = RequestMethod.GET, produces = "application/text; charset=utf-8")
	public @ResponseBody String bookmark(String ykiho, Principal principal) {
		mypageDTO mypage = new mypageDTO();
		SecurityLoginDTO loginUser = (SecurityLoginDTO) ((UsernamePasswordAuthenticationToken) principal)
				.getPrincipal();
		mypage.setUserid(loginUser.getId());
		mypage.setYkiho(ykiho);
		String message = "";
		int result = service.insertbookmark(mypage); // 병원이 등록되었을 때 실행 하도록 변경
		if (result == 20000) {
			message = "등록할 수 없는 병원입니다. 확인을 누르면 자주가는 병원 목록으로 이동합니다.";
		} else if (result == 0) {
			message = "이미 등록된 병원입니다. 확인을 누르면 자주가는 병원 목록으로 이동합니다.";
		} else {
			message = "등록이 완료되었습니다. 확인을 누르면 자주가는 병원 목록으로 이동합니다.";
		}
		return message;
	}

	// 자주가는 병원 삭제
	@RequestMapping(value = "/mypage/delete_bookmark.do", method = RequestMethod.GET, produces = "application/text; charset=utf-8")
	public @ResponseBody String delete_bookmark(String ykiho, Principal principal) {
		mypageDTO mypage = new mypageDTO();
		SecurityLoginDTO loginUser = (SecurityLoginDTO) ((UsernamePasswordAuthenticationToken) principal)
				.getPrincipal();
		mypage.setYkiho(ykiho);
		mypage.setUserid(loginUser.getId());
		int result = service.deletebookmark(mypage);
		String message = "";
		if (result > 0) {
			message = "삭제완료";
		} else {
			message = "삭제실패";
		}
		return message;
	}

	// 자주가는 병원검색
	@RequestMapping("/mypage/search_bookmark.do")
	public ModelAndView search(String tag, String search, Principal principal) {
		ModelAndView mav = new ModelAndView();
		SecurityLoginDTO loginUser = (SecurityLoginDTO) ((UsernamePasswordAuthenticationToken) principal)
				.getPrincipal();
		List<MyhospitalDTO> searchlist = service.selectTag(tag, search, loginUser.getId());
		mav.addObject("bookmarklist", searchlist);
		mav.setViewName("mypage/bookmark");
		return mav;
	}

}
