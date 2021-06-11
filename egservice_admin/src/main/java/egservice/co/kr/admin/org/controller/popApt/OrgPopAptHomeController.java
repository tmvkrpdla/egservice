package egservice.co.kr.admin.org.controller.popApt;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egservice.co.kr.admin.common.Api;
import egservice.co.kr.admin.common.SessionUtil;

@Controller
@RequestMapping("/org/pop")
public class OrgPopAptHomeController {

	@RequestMapping("/aptProc")
	public String popAptProc(@RequestParam HashMap paramMap,
			Model model, HttpSession session) throws Exception {
		System.out.println(paramMap.toString());
		
		String moveUrl = "redirect:/";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
			
			if("2".equals(team_type)) {
				
				if(!paramMap.isEmpty()) {
					//	파라미터 : seq_site를 가져와서 
					String seq_site = String.valueOf(paramMap.get("seq_site"));
					
					HashMap siteInfoBld = Api.getSiteInfoBld(seq_site);
					
					session.setAttribute("SITE_INFO_BLD", siteInfoBld);	//	사이트의 정보를 가지고 있다.
					
					moveUrl = "redirect:./aptHome";
					
				}
				
				
			}
		}
		
		return moveUrl;
	}
	
	
	@RequestMapping("/aptHome")
	public String popAptHome(
			@RequestParam(value="home", defaultValue = "home") String mainMenu,
			@RequestParam HashMap paramMap,
			Model model, HttpSession session)throws Exception{
		
		String moveUrl = "redirect:/";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
			
			if("2".equals(team_type)) {
				
				moveUrl = "org/pop/apt/main/popAptMainHome";
				
				
				model.addAttribute("mainMenu", mainMenu);
				
				
			}
		}
		
		return moveUrl;
		 
	}//
	

	
	
	
}
