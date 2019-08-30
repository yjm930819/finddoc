package doc.find.board;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public int noticeinsert(Notice_BoardDTO noticedto) {
		return sqlSession.insert("finddoc.board.insertnotice", noticedto);
	}

	@Override
	public List<Notice_BoardDTO> noticelist(String id, String tag) {
		return sqlSession.selectList(tag, id);
	}

	@Override
	public Notice_BoardDTO noticeread(String noticeboardnum) {
		return sqlSession.selectOne("finddoc.board.noticeread", noticeboardnum);
	}

	@Override
	public int noticecount(String noticeboardnum) {
		return sqlSession.update("finddoc.board.noticecount", noticeboardnum);
	}

	@Override
	public int noticedelete(String noticeboardnum) {
		return sqlSession.update("finddoc.board.noticedelete", noticeboardnum);
	}

	@Override
	public int noticeupdate(Notice_BoardDTO noticedto) {
		return sqlSession.update("finddoc.board.noticeupdate", noticedto);
	}

	@Override
	public List<Notice_BoardDTO> noticesearch(String category, String search) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("search", search);
		return sqlSession.selectList("finddoc.board.noticesearch", map);
	}

}
