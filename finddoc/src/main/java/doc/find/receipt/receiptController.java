package doc.find.receipt;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class receiptController {
	// 접수 화면과 접수버튼 눌렀을때 둘다 처리
	@RequestMapping("/receipt/book.do")
	public String receipt_book(String action) {
		if (action.equals("view")) {
			return "receipt/book";
		} else {
			return "receipt/booklist";
		}

	}

	// 접수 목록
	@RequestMapping("/receipt/booklist.do")
	public String receipt_booklist(String action) {
		// 메인 화면에서 접수버튼 눌렀을때 접수리스트에 자동으로 접수등록
		if (action.equals("main")) {
			return "receipt/booklist";
		}
		return "receipt/booklist";
	}

	// 접수 상세 페이지
	@RequestMapping("/receipt/bookinfo.do")
	public String receipt_bookinfo(String action) {
		// 진료정보 링크 눌렀을때 접수 상세페이지
		if (action.equals("read")) {
			return "receipt/bookinfo";
			// 수정버튼 눌렀을때 수정 페이지로 이동
		} else {
			return "receipt/bookupdate";
		}

	}

	// 접수 수정
	@RequestMapping("/receipt/bookupdate.do")
	public String receipt_bookupdate() {
		return "receipt/booklist";
	}

	// 병원관계자 예약 목록
	@RequestMapping("/doc/receiptlist.do")
	public String doc_receiptlist() {
		return "doc/receiptlist";
	}
}
