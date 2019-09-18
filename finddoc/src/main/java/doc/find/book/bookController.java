package doc.find.book;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import doc.find.authentication.SecurityLoginDTO;
import doc.find.member.HadminDTO;
import doc.find.member.UserDTO;
import doc.find.mypage.MyhospitalDTO;
import doc.find.mypage.mypageService;

@Controller
public class bookController {
	@Autowired
	bookService service;
	@Autowired
	mypageService mypageservice;

	// 예약 화면과 예약버튼 눌렀을때 둘다 처리
	@RequestMapping("/user/book.do")
	public ModelAndView user_book(String action, String hname, String ykiho, Principal principal) {
		ModelAndView mav = new ModelAndView();
		SecurityLoginDTO loginUser = (SecurityLoginDTO) ((UsernamePasswordAuthenticationToken) principal)
				.getPrincipal();
		List<MyhospitalDTO> myhos = mypageservice.selectAll(loginUser.getId());
		mav.setViewName("user/book");
		// 검색한 결과에서 예약 버튼눌렀을 때
		if (action.equals("search")) {
			mav.addObject("book", hname);
			mav.addObject("ykiho", ykiho);
		}
		// 자주가는 병원에서 예약버튼 눌렀을 때
		else if (action.equals("mypage")) {
			mav.addObject("myhos", myhos);
		}
		// 메인페이지나 탑메뉴의 예약버튼을 눌럿을 때 // 자주가는 병원에서 예약버튼 눌렀을 때
		else {
			mav.addObject("myhos", myhos);
		}
		mav.addObject("action", action);
		return mav;
	}

	// 예약하기
	@RequestMapping("/user/insertbook.do")
	public ModelAndView userbook(BookDTO bookdto, Principal principal) {
		ModelAndView mav = new ModelAndView();
		SecurityLoginDTO loginUser = (SecurityLoginDTO) ((UsernamePasswordAuthenticationToken) principal)
				.getPrincipal();
		bookdto.setUserid(loginUser.getId());
		String message = service.insertbook(bookdto);
		mav.setViewName("user/booklist");
		mav.addObject("message", message);
		return mav;
	}

	// 예약 목록
	@RequestMapping("/user/booklist.do")
	public ModelAndView user_booklist(Principal principal) {
		ModelAndView mav = new ModelAndView();
		SecurityLoginDTO loginUser = (SecurityLoginDTO) ((UsernamePasswordAuthenticationToken) principal)
				.getPrincipal();
		List<BookDTO> userbooklist = service.booklist(loginUser.getId());
		mav.setViewName("user/booklist");
		mav.addObject("userbooklist", userbooklist);
		return mav;
	}

	// 예약 상세 페이지
	@RequestMapping("/user/bookinfo.do")
	public ModelAndView user_bookinfo(String action, String booknum) {
		ModelAndView mav = new ModelAndView();
		// 진료정보 링크 눌렀을때 예약 상세페이지
		if (action.equals("read")) {
			mav.setViewName("user/bookinfo");
			// 수정버튼 눌렀을때 수정 페이지로 이동
		} else {
			mav.setViewName("user/bookupdate");
		}
		BookDTO userbookinfo = service.userbookinfo(booknum);
		mav.addObject("userbookinfo", userbookinfo);
		return mav;
	}

	// 예약 수정
	@RequestMapping("/user/bookupdate.do")
	public String user_bookupdate(BookDTO updatedto) {
		int result = service.userbookupdate(updatedto);
		return "redirect:/user/booklist.do";
	}

	// 예약 취소
	@RequestMapping("/user/bookcancel.do")
	public String user_bookcancel(String booknum) {
		int result = service.userbookcancel(booknum);
		return "redirect:/user/booklist.do";
	}

	// 병원관계자 예약 목록
	@RequestMapping("/doc/todaybooklist.do")
	public ModelAndView todaybooklist(Principal principal) {
		SecurityLoginDTO loginUser = (SecurityLoginDTO) ((UsernamePasswordAuthenticationToken) principal)
				.getPrincipal();
		List<BookDTO> todaylist = service.todaylist(loginUser.getId());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("doc/todaylist");
		mav.addObject("todaylist", todaylist);
		return mav;
	}

	// 병원관계자 예약 목록
	@RequestMapping("/doc/booklist.do")
	public ModelAndView doc_booklist(Principal principal) {
		SecurityLoginDTO loginUser = (SecurityLoginDTO) ((UsernamePasswordAuthenticationToken) principal)
				.getPrincipal();
		List<BookDTO> list = service.doclist(loginUser.getId());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("doc/booklist");
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("/user/book/findbookmarkhos.do")
	public ModelAndView find_bookmark_hos(Principal principal) {
		SecurityLoginDTO loginUser = (SecurityLoginDTO) ((UsernamePasswordAuthenticationToken) principal)
				.getPrincipal();
		ModelAndView mav = new ModelAndView();
		List<MyhospitalDTO> findbooklist = mypageservice.selectAll(loginUser.getId());
		mav.addObject("findbooklist", findbooklist);
		System.out.println("팝엄...");
		mav.setViewName("book/BookmarkHosPopup");
		return mav;
	}

	// 로그인 세션
	public String getid(Principal principal) {
		SecurityLoginDTO loginUser = (SecurityLoginDTO) ((UsernamePasswordAuthenticationToken) principal)
				.getPrincipal();
		return loginUser.getId();
	}
}
