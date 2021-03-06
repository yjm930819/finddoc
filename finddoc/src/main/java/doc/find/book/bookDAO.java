package doc.find.book;

import java.util.List;

import org.springframework.stereotype.Repository;

public interface bookDAO {
	int insertbook(BookDTO bookdto);
	int book_check(BookDTO checkbook);
	List<BookDTO> booklist(String userid);
	BookDTO userbookinfo(String booknum);
	int userbookupdate(BookDTO bookdto);
	int userbookcancel(String booknum);
	List<BookDTO> todaylist(String hadminid);
	List<BookDTO> hos_booklist_all(String hadminid);
	int patientCount(String hadminid);
	int todaycomplate(String booknum);
	List<BookDTO> todaylist_accept(String hadminid);
}
