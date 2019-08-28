package doc.find.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mypageController {

	@RequestMapping("/mypage/mypage.do")
	public String receipt() {
		return "mypage/bookmark";
	}
	
}
