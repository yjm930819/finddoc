package doc.find.book;

import java.util.List;

public interface bookService {
	String insertbook(BookDTO bookdto);
	List<BookDTO> booklist(String userid);
	BookDTO userbookinfo(String booknum);
	int userbookupdate(BookDTO bookdto);
	int userbookcancel(String booknum);
	List<BookDTO> todaylist(String hadminid);
	List<BookDTO> todaylist_accept(String hadminid);
	List<BookDTO> hos_booklist_all(String hadminid);
	int hosp_check(String ykiho);
	int patientCount(String hadminid);
	int todaycomplate(String booknum);
}
