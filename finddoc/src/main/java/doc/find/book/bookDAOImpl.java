package doc.find.book;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class bookDAOImpl implements bookDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public int insertbook(BookDTO bookdto) {
		return sqlSession.insert("user.book.insert", bookdto);
	}

	@Override
	public int book_check(BookDTO checkbook) {
		String str = sqlSession.selectOne("user.book.check", checkbook);
		int result = Integer.parseInt(str);
		return result;
	}
	
	public List<BookDTO> booklist(String userid){
		return sqlSession.selectList("user.book.userbooklist", userid);
	}

	@Override
	public BookDTO userbookinfo(String booknum) {
		return sqlSession.selectOne("user.book.userbookinfo", booknum);
	}

	@Override
	public int userbookupdate(BookDTO bookdto) {
		return sqlSession.update("user.book.bookupdate", bookdto);
	}

	@Override
	public int userbookcancel(String booknum) {
		return sqlSession.delete("user.book.bookcancel", booknum);
	}

	@Override
	public List<BookDTO> todaylist(String hadminid) {
		return sqlSession.selectList("user.book.todaylist", hadminid);
	}

	@Override
	public List<BookDTO> hos_booklist_all(String hadminid) {
		return sqlSession.selectList("user.book.booklist_all", hadminid);
	}
	
}
