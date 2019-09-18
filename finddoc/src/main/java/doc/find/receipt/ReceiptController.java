package doc.find.receipt;

import java.io.IOException;
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
import doc.find.member.HadminDTO;
import doc.find.member.UserDTO;
import doc.find.mypage.mypageDTO;
import doc.find.search.searchService;

@Controller
public class ReceiptController {
	@Autowired
	ReceiptService receiptService;

	// 접수 화면과 접수버튼 눌렀을때 둘다 처리
	@RequestMapping("/receipt/book.do")
	public ModelAndView receipt_book(String action, Principal principal, ReceiptDTO receiptdto) {
		ModelAndView mav = new ModelAndView();
		if (action.equals("view")) {
			SecurityLoginDTO loginUser = (SecurityLoginDTO) ((UsernamePasswordAuthenticationToken) principal)
					.getPrincipal();

			List<HadminDTO> hoslist = receiptService.myhospital(loginUser.getId());
			mav.addObject("hoslist", hoslist);
			mav.setViewName("receipt/book");
			return mav;
		} else {
			receiptService.book(receiptdto);
			mav.setViewName("redirect:/receipt/booklist.do");
			return mav;
		}

	}

	// 접수 목록
	@RequestMapping("/receipt/booklist.do")
	public ModelAndView receipt_booklist(Principal principal) {
		ModelAndView mav = new ModelAndView();
		SecurityLoginDTO loginUser = (SecurityLoginDTO) ((UsernamePasswordAuthenticationToken) principal)
				.getPrincipal();

		List<ReceiptDTO> receiptlist = receiptService.receiptlist(loginUser.getId());
		mav.addObject("receiptlist", receiptlist);
		mav.setViewName("receipt/booklist");
		return mav;
	}

	// 접수 병원 삭제
	@RequestMapping(value = "/receipt/cancel.do", method = RequestMethod.GET, produces = "application/text; charset=utf-8")
	public @ResponseBody String cancel(ReceiptDTO receiptdto) {
		int result = receiptService.cancelreceipt(receiptdto);
		String message = "접수 취소 완료";
		return message;
	}

	// 접수 상세 페이지
	@RequestMapping("/receipt/bookinfo.do")
	public ModelAndView receipt_bookinfo(String action, String receiptnum) {
		ModelAndView mav = new ModelAndView();
		if (action.equals("read")) {
			ReceiptDTO receiptdto = receiptService.receiptinfo(receiptnum);
			mav.addObject("receiptdto", receiptdto);
			mav.setViewName("receipt/bookinfo");
			return mav;
		} else {
			ReceiptDTO receiptdto = receiptService.receiptinfo(receiptnum);
			mav.addObject("receiptdto", receiptdto);
			mav.setViewName("receipt/bookupdate");
			return mav;
		}

	}

	// 접수 수정
	@RequestMapping("/receipt/bookupdate.do")
	public String receipt_bookupdate(ReceiptDTO receiptdto) {
		receiptService.receiptupdate(receiptdto);
		return "redirect:/receipt/booklist.do";
	}

	// 병원관계자 접수 목록
	@RequestMapping("/doc/receiptlist.do")
	public ModelAndView doc_receiptlist(Principal principal) {
		ModelAndView mav = new ModelAndView();
		SecurityLoginDTO loginUser = (SecurityLoginDTO) ((UsernamePasswordAuthenticationToken) principal)
				.getPrincipal();

		List<ReceiptDTO> doclist = receiptService.doclist(loginUser.getId());
		mav.addObject("doclist", doclist);
		mav.setViewName("doc/receiptlist");
		return mav;
	}

	// 병원 관리자가 병원 진료완료
	@RequestMapping(value = "/doc/docok.do", method = RequestMethod.GET, produces = "application/text; charset=utf-8")
	public @ResponseBody String docok(ReceiptDTO receiptdto) {
		int result = receiptService.docok(receiptdto);
		String message = "진료 완료";
		return message;
	}
}
