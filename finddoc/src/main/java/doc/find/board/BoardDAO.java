package doc.find.board;

import java.util.List;

public interface BoardDAO {
	// 공지사항게시판에 글쓰기
	int noticeinsert(Notice_BoardDTO noticedto);

	// 공지사항들어오면 보여지는 공지사항리스트
	List<Notice_BoardDTO> noticelist(String id, String tag, int startIndex);

	// 공지사항 게시판 전체 글갯수
	int noticeCount(String id, String tag);

	// 공지사항게시판 글읽기
	Notice_BoardDTO noticeread(String noticeboardnum);

	// 공지사항게시판 조회수
	int noticecount(String noticeboardnum);

	// 공지사항 게시판 글삭제
	int noticedelete(String noticeboardnum);

	// 공지사항 게시판 글수정
	int noticeupdate(Notice_BoardDTO noticedto);

	// 공지사항 게시판에서 자주가능병원리스트
	List<Notice_BoardDTO> myhospitallist(String userid);

	// 공지사항 게시판 검색
	List<Notice_BoardDTO> noticesearch(String tag, String id, String category, String search, String hadminid,
			int startIndex);

	// 공지사항 게시판 검색별로 총갯수
	List<Notice_BoardDTO> noticesearchcount(String tag, String id, String category, String search, String hadminid);

	// 후기 게시판 전체 글갯수
	int reviewCount(String id, String tag);

	// 후기 게시판에서 병원목록
	//List<Review_BoardDTO> hospitallist();

	// 후기 게시판 조회수
	int reviewcount(String reviewboardnum);

	// 후기 게시판 글읽기
	Review_BoardDTO reviewread(String reviewboardnum);

	// 후기 게시판 글쓰기
	int reviewinsert(Review_BoardDTO reviewdto);

	// 후기 게시판 들어오면 보여지는 공지사항리스트
	List<Review_BoardDTO> reviewlist(String id, String tag, int startIndex);

	// 후기 게시판 검색
	List<Review_BoardDTO> reviewsearch(String category, String search, int startIndex);

	// 후기게시판에서 병원명으로 검색
	List<Review_BoardDTO> reviewsearchhname(String category, String id, int startIndex);
}
