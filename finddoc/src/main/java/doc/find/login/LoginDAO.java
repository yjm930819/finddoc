package doc.find.login;

import doc.find.member.MemberDTO;

public interface LoginDAO {
	// 로그인(사용자,병원관계자,관리자 한번에 조회)
	MemberDTO login(LoginDTO logindto, String tag);

	// 아이디찾기(사용자,병원관계자)
	MemberDTO idSearch(String tag, String name, String email);

	// 비밀번호찾기(사용자,병원관계자)
	MemberDTO pwSearch(String tag, String name, String id, String email);
}
