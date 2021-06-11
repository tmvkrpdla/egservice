package egservice.co.kr.admin.org.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egservice.co.kr.admin.common.SessionUtil;

/**
 * 기관 관리자
 * 
 */
@Controller
@RequestMapping("/org")
public class OrgHomeController {
	
	private final Logger logger = LoggerFactory.getLogger(OrgHomeController.class);
	
	/**
	 * 기관 관리자 홈으로 이동
	 * @param session
	 * @param model
	 * @param mainMenu
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/home")
	public String orgHome(HttpSession session, Model model, 
			@RequestParam(value="mainMenu", defaultValue = "home") String mainMenu) throws Exception{
		
		
		String moveUrl = "redirect:/";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");

			if("2".equals(team_type)) {	//	건물
				moveUrl = "org/main/home";
				
				/*
				//	아파트/건물 정보를 가져옮
				HashMap adminUsageCurrentData = Api.getAdminUsageCurrent(SessionUtil.getString(session, "ADMIN", "seq_admin"));
				
				
				model.addAttribute("SITE_LIST", adminUsageCurrentData.get("site_list"));
				*/
				model.addAttribute("mainMenu", mainMenu);
			}
			
		}
		
		return moveUrl;
	}
	
	
}
