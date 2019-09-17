package doc.find.authentication;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import doc.find.login.LoginDAO;
import doc.find.login.LoginDTO;
import doc.find.member.AdminDTO;
import doc.find.member.HadminDTO;
import doc.find.member.MemberDTO;
import doc.find.member.UserDTO;

@Service
// 로그인 인증 작업을 처리하는 서비스 클래스 - Spring security의 클래스(implements UserDetailsService
// 하기)
public class LoginSecurityService implements UserDetailsService {
	@Autowired
	LoginDAO dao;

	@Autowired
	@Qualifier("autho")
	AuthorityDAO authoDao;

	// dao의 메소드를 이용해서 입력받은 아이디에 해당하는 레코드가 있는지 확인한 후 조회한 사용자 정보를 UserDetails를 변환해서
	// 리턴하는 메소드
	// <security:user-service>작업
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println(username);
		String[] str = username.split(":===:");
		String id = str[0];
		String action = str[1];
		LoginDTO logindto = new LoginDTO(str[0], null, null, str[1]);
		System.out.println(str[0] + "," + str[1]);
		String tag;
		if (action.equals("user")) {
			tag = "finddoc.login.loginUser";
		} else if (action.equals("hadmin")) {
			tag = "finddoc.login.loginHadmin";
		} else {
			tag = "finddoc.login.loginAdmin";
		}
		MemberDTO loginUser = dao.login(id, tag);

		System.out.println(loginUser);

		// db에서 조회한 MemberDTO를 UserDetails타입으로 변환해서 리턴
		// ==>변환해서 리턴하지 않고 UserDetails을 상속하는 DTO를 직접 만들어서 작업해도 좋다.
		// ==>UserDetails을 구현하고 있는 User객체를 만들어서 리턴한다
		// 1. User클래스는 id, password, 권한리스트를 매개변수로 받고 있으며 권한리스트는 여러개가 될 수 있으므로 ArrayList에
		// 담아서 리턴
		// 2. ArrayList에 담는 권한 정보는 GrantedAuthority 객체타입이어야 하고 GrantedAuthority는 인터페이스
		// 이므로 이 인터페이스를
		// 구현하는 SimpleGrantedAuthority객체를 생성해서 ArrayList에 추가한다.
		// 형식이 존재하는 이유는 내부에서 자동으로 처리하는 것이 있기 때문
		UserDetails securityLoginUser = null;
		ArrayList<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

		// dao에서 조회한 user별 권한리스트를 이용해서 생성하기
		authorities.add(new SimpleGrantedAuthority(authoDao.getAuthorityList(id, action)));
		// securityLoginUser = new User(loginUser.getId(), loginUser.getPass(),
		// authorities);
		if (loginUser instanceof UserDTO) {
			UserDTO user = (UserDTO) loginUser;
			securityLoginUser = new SecurityLoginDTO(authorities, user.getUserid(), user.getPw(), user.getName(),
					user.getAge(), user.getSn1(), user.getSn2(), user.getGender(), user.getCp(), user.getAddr(),
					user.getDetailaddr(), user.getEmail(), user.getSigndate(), user.getUseridox(), user.getState(),
					null, null, null, null);
		} else if (loginUser instanceof HadminDTO) {
			HadminDTO hadmin = (HadminDTO) loginUser;
			securityLoginUser = new SecurityLoginDTO(authorities, hadmin.getHadminid(), hadmin.getPw(),
					hadmin.getName(), 0, null, null, null, hadmin.getCp(), hadmin.getAddr(), hadmin.getDetailaddr(),
					hadmin.getEmail(), hadmin.getSigndate(), hadmin.getHadminidox(), hadmin.getState(),
					hadmin.getHname(), hadmin.getYkiho(), hadmin.getXpos(), hadmin.getYpos());
		} else {
			AdminDTO admin = (AdminDTO) loginUser;
			securityLoginUser = new SecurityLoginDTO(authorities, admin.getAdminid(), admin.getPw(), null, 0, null,
					null, null, null, null, null, null, null, null, admin.getState(), null, null, null, null);
		}

		return securityLoginUser;
	}

}
