package doc.find.mypage;

import java.util.List;

public interface mypageService {
	int insertbookmark(mypageDTO mypage);
	List<MyhospitalDTO> selectAll(String id);
	int deletebookmark(mypageDTO mypage);
	List<MyhospitalDTO> selectTag(String tag, String search, String id);
}
