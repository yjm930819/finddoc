package doc.find.authentication;

import java.util.List;

public interface AuthorityDAO {
	// 사용자별권한을 리턴하는 메소드
	String getAuthorityList(String id, String action);
}
