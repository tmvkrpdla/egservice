package egservice.co.kr.admin.org.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egservice.co.kr.admin.common.Api;
import egservice.co.kr.admin.common.SessionUtil;

@Controller
@RequestMapping("/org")
public class OrgDashboardController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrgDashboardController.class);
	
	@RequestMapping("/dashboard")
	public String orgDashboard(HttpSession session, Model model, 
			@RequestParam(value="mainMenu", defaultValue = "adminHome") String mainMenu) throws Exception{
		
		
		String moveUrl = "redirect:/";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");

			if("2".equals(team_type)) {	//	
				
				//	아파트/건물 정보를 가져옮
				/*
				HashMap adminUsageCurrentData = Api.getAdminUsageCurrent(SessionUtil.getString(session, "ADMIN", "seq_admin"));
								
				model.addAttribute("SITE_LIST", adminUsageCurrentData.get("site_list"));
				*/
				moveUrl = "org/dashboard/dashboard";
			}
			
		}
		
		return moveUrl;
	}
	
	

	
	

}
