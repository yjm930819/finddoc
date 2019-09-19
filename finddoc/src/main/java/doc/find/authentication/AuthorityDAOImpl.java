package doc.find.authentication;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("autho")
public class AuthorityDAOImpl implements AuthorityDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public String getAuthorityList(String id, String action) {
		String tag;
		if (action.equals("user")) {
			tag = "finddoc.login.authorityuser";
		} else if (action.equals("hadmin")) {
			tag = "finddoc.login.authorityhadmin";
		} else {
			tag = "finddoc.login.authorityadmin";
		}
		return sqlSession.selectOne(tag, id);
	}

}
