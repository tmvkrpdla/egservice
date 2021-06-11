package egservice.co.kr.admin.apt.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egservice.co.kr.admin.common.SessionUtil;

@Controller
@RequestMapping("/apt")
public class AptHomeController {

	private final Logger logger = LoggerFactory.getLogger(AptHomeController.class);
	
	/**
	 * 아파트 관리자 HOME
	 * @param session
	 * @param model
	 * @param mainMenu
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/home")
	public String aptHome(HttpSession session, Model model,
			@RequestParam(value="mainMenu", defaultValue = "home")String mainMenu)throws Exception{
		
		String moveUrl = "redirect:../";
		//logger.info("call	:	/apt/home");
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
			
			if("3".equals(team_type)) {	//	아파트
				moveUrl = "apt/main/aptMainHome";

				
				//moveUrl = "redirect:../apt/noticeList";
				
				model.addAttribute("mainMenu", mainMenu);

			}
			
		}
		
		return moveUrl;
	}
	
	
	
	
	
	
	
}
