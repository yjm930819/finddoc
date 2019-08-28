package doc.find.book;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class bookController {
	// 예약 화면과 예약버튼 눌렀을때 둘다 처리
	@RequestMapping("/user/book.do")
	public String user_book(String action) {
		if (action.equals("view")) {
			return "user/book";
		} else {
			return "user/booklist";
		}

	}

	// 예약 목록
	@RequestMapping("/user/booklist.do")
	public String user_booklist() {
		return "user/booklist";
	}

	// 예약 상세 페이지
	@RequestMapping("/user/bookinfo.do")
	public String user_bookinfo(String action) {
		// 진료정보 링크 눌렀을때 예약 상세페이지
		if (action.equals("read")) {
			return "user/bookinfo";
			// 수정버튼 눌렀을때 수정 페이지로 이동
		} else {
			return "user/bookupdate";
		}

	}

	// 예약 수정
	@RequestMapping("/user/bookupdate.do")
	public String user_bookupdate() {
		return "user/booklist";
	}

	// 병원관계자 예약 목록
	@RequestMapping("/doc/booklist.do")
	public String doc_booklist() {
		return "doc/booklist";
	}
}
