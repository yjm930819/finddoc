package doc.find.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAO dao;

	@Override
	public int noticeinsert(Notice_BoardDTO noticedto) {
		return dao.noticeinsert(noticedto);
	}

	@Override
	public List<Notice_BoardDTO> noticelist(String id, String state) {
		List<Notice_BoardDTO> noticedto = null;
		String tag;
		if (state.equals("hadmin")) {
			tag = "finddoc.board.noticeall";
			noticedto = dao.noticelist(id, tag);
		} else {
			tag = "finddoc.board.noticeuserall";
			noticedto = dao.noticelist(id, tag);
		}
		return noticedto;
	}

	@Override
	public Notice_BoardDTO noticeread(String noticeboardnum) {
		dao.noticecount(noticeboardnum);
		Notice_BoardDTO dto = dao.noticeread(noticeboardnum);
		return dto;
	}

	@Override
	public int noticedelete(String noticeboardnum) {
		return dao.noticedelete(noticeboardnum);
	}

	@Override
	public int noticeupdate(Notice_BoardDTO noticedto) {
		return dao.noticeupdate(noticedto);
	}

	@Override
	public List<Notice_BoardDTO> noticesearch(String category, String search) {
		return dao.noticesearch(category, search);
	}
}
