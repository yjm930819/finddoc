package doc.find.login;

import doc.find.member.MemberDTO;

public interface LoginService {
	// 로그인(// 로그인(사용자,병원관계자,관리자 한번에 조회))
	// MemberDTO login(String action, LoginDTO logindto);

	// 아이디찾기(사용자,병원관계자)
	MemberDTO idSearch(LoginDTO logindto);

	// 비밀번호찾기(사용자,병원관계자)
	MemberDTO pwSearch(LoginDTO logindto);
}
