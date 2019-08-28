package doc.find.login;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import doc.find.member.MemberDTO;

@Repository
public class LoginDAOImpl implements LoginDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public MemberDTO login(LoginDTO logindto, String tag) {
		return sqlSession.selectOne(tag, logindto);
	}

	@Override
	public MemberDTO idSearch(String tag, String name, String email) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);
		return sqlSession.selectOne(tag, map);
	}

	@Override
	public MemberDTO pwSearch(String tag, String name, String id, String email) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("id", id);
		map.put("email", email);
		return sqlSession.selectOne(tag, map);
	}

}
