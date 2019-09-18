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
	List<BookDTO> doclist(String hadminid);
}
