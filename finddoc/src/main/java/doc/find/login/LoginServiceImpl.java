package doc.find.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import doc.find.member.MemberDTO;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	LoginDAO dao;

	/*@Override
	public MemberDTO login(String action, LoginDTO logindto) {
		String tag;
		if (action.equals("user")) {
			tag = "finddoc.login.loginUser";
		} else if (action.equals("hadmin")) {
			tag = "finddoc.login.loginHadmin";
		} else {
			tag = "finddoc.login.loginAdmin";
		}
		return dao.login(logindto, tag);
	}*/

	@Override
	public MemberDTO idSearch(LoginDTO logindto) {
		String tag1, tag2;
		tag1 = "finddoc.login.idSearchUser";
		tag2 = "finddoc.login.idSearchHadmin";
		MemberDTO result = dao.idSearch(tag1, logindto.getName(), logindto.getEmail());
		if (result != null) {
			return result;
		} else {
			result = dao.idSearch(tag2, logindto.getName(), logindto.getEmail());
			return result;
		}
	}

	@Override
	public MemberDTO pwSearch(LoginDTO logindto) {
		String tag1, tag2;
		tag1 = "finddoc.login.pwSearchUser";
		tag2 = "finddoc.login.pwSearchHadmin";
		MemberDTO result = dao.pwSearch(tag1, logindto.getName(), logindto.getId(), logindto.getEmail());
		if (result != null) {
			return result;
		} else {
			result = dao.pwSearch(tag2, logindto.getName(), logindto.getId(), logindto.getEmail());
			return result;
		}
	}

}
