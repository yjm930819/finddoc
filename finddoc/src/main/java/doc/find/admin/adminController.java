package doc.find.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class adminController {
	// 첫 화면 페이지
	@RequestMapping("/index.do")
	public String index() {
		return "index";
	}

	// 관리자 화면
	@RequestMapping("/admin.do")
	public String admin() {
		return "admin";
	}

	// 관리자 승인 대기 병원목록 화면
	@RequestMapping("/admin/accept_list.do")
	public String accept_list() {
		return "admin/accept_list";
	}

	// 관리자 병원 승인한 병원목록 화면
	@RequestMapping("/admin/doc_list.do")
	public String doc_list() {
		return "admin/doc_list";
	}

	// 관리자 1:1문의 게시판 목록 화면
	@RequestMapping("/admin/oneboardlist.do")
	public ModelAndView oneboardlist() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/oneboardlist");
		return mav;
	}

	// 관리자 1:1문의 게시판 글등록 화면
	@RequestMapping("/admin/oneboard_write.do")
	public ModelAndView oneboardwrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/oneboard_write");
		return mav;
	}
}
