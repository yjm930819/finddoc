package doc.find.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import doc.find.mypage.mypageDAO;

@Service
public class bookServiceImpl implements bookService {
	@Autowired
	bookDAO dao;
	@Autowired
	mypageDAO mypagedao;

	@Override
	public String insertbook(BookDTO bookdto) {
		int check = mypagedao.hosp_check(bookdto.getYkiho());
		BookDTO checkbook = new BookDTO(bookdto.getYkiho(), bookdto.getMajor(), bookdto.getBookdate(), bookdto.getHour(), bookdto.getMint());
		String message="";
		if(check>0) {
			System.out.println(checkbook);
			int bookcheck = dao.book_check(checkbook);
			if(bookcheck==0) {
				int result = dao.insertbook(bookdto); 
				if(result>0) {
					message="예약 신청 완료";
				}
				else {
					message="예약 신청 실패";
				}
			}
			else {
				message="예약 불가능한 시간입니다.";
			}
		}
		else {
			message="이용 불가한 병원입니다.";
		}
		System.out.println(message);
		return message;
	}
	
	public List<BookDTO> booklist(String userid){
		return dao.booklist(userid);
	}

	@Override
	public BookDTO userbookinfo(String booknum) {
		return dao.userbookinfo(booknum);
	}

	@Override
	public int userbookupdate(BookDTO bookdto) {
		int result = 3000;
		String message="";
		int bookcheck = 4000;
		bookcheck = dao.book_check(bookdto);
		System.out.println("예약 존재 유무"+bookcheck);
		System.out.println(bookdto);
		if(bookcheck==0) {
			result = dao.userbookupdate(bookdto); 
			if(result>0) {
				message="예약 수정 완료";
			}
			else {
				message="예약 수정 실패";
			}
		}
		else {
			message="예약 불가능한 시간입니다.";
		}
		System.out.println(message);
		return result;
	}

	@Override
	public int userbookcancel(String booknum) {
		return dao.userbookcancel(booknum);
	}

	@Override
	public List<BookDTO> todaylist(String hadminid) {
		return dao.todaylist(hadminid);
	}

	@Override
	public List<BookDTO> hos_booklist_all(String hadminid) {
		return dao.hos_booklist_all(hadminid);
	}

	@Override
	public int hosp_check(String ykiho) {
		return mypagedao.hosp_check(ykiho);
	}
	
}
