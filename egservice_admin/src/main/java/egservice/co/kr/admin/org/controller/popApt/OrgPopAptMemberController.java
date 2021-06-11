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
public class OrgPopAptMemberController {
	
	@RequestMapping("/aptMemberList")
	public String popAptMemberList(HttpSession session, Model model,
			@RequestParam(value="mainMenu", defaultValue="member")String mainMenu
			) throws Exception{
		
		String moveUrl = "redirect:../";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
			
			if("2".equals(team_type)) {
				
				HashMap siteInfoBldMap = SessionUtil.getSessionMap(session, "SITE_INFO_BLD");
				
				//System.out.println(siteInfoBldMap.toString());
				
				
				HashMap memberList = Api.getSiteMemberList(String.valueOf(siteInfoBldMap.get("seq_site")));
				moveUrl = "org/pop/apt/member/popAptMemberList";
				model.addAttribute("LIST_MEMBER", memberList.get("list_member"));
				model.addAttribute("mainMenu", mainMenu);
				
				
		
			}
			
		}
		
		return moveUrl;
		
	}

}
