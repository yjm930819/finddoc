package doc.find.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {

	// 후기 게시판
	@RequestMapping("/board/reviewBoardList.do")
	public ModelAndView review(String category) {
		ModelAndView mav = new ModelAndView();
		if (category.equals("all")) {
			mav.setViewName("board/reviewBoardList");
		}
		return mav;
	}

	// 후기 게시판 글등록버튼 눌렀을때
	@RequestMapping("/board/reviewBoard_insert.do")
	public ModelAndView reviewInsert() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/reviewBoardList");
		return mav;
	}

	// Q&A 게시판
	@RequestMapping("/board/qaBoardList.do")
	public ModelAndView qa(String category) {
		ModelAndView mav = new ModelAndView();
		if (category.equals("all")) {
			mav.setViewName("board/qaBoardList");
		}
		return mav;
	}

	// Q&A 게시판 글등록버튼 눌렀을때
	@RequestMapping("/board/qaBoard_insert.do")
	public ModelAndView qaInsert() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/qaBoardList");
		return mav;
	}

	// 공지사항 게시판
	@RequestMapping("/board/noticeBoardList.do")
	public ModelAndView notice(String category) {
		ModelAndView mav = new ModelAndView();
		if (category.equals("all")) {
			mav.setViewName("board/noticeBoardList");
		}
		return mav;
	}

	// 공시사항 게시판 글등록버튼 눌렀을때
	@RequestMapping("/board/noticeBoard_insert.do")
	public ModelAndView noticeInsert() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/noticeBoardList");
		return mav;
	}
}
