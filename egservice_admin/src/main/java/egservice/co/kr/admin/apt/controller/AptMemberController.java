package egservice.co.kr.admin.apt.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egservice.co.kr.admin.common.Api;
import egservice.co.kr.admin.common.PageUtil;
import egservice.co.kr.admin.common.SessionUtil;

@Controller
@RequestMapping("/apt")
public class AptMemberController {

	private final Logger logger = LoggerFactory.getLogger(AptMemberController.class);
	
	/**
	 * 
	 * @param session
	 * @param model
	 * @param mainMenu
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/memberList")
	public String aptMemberList(HttpSession session, Model model,
			@RequestParam(value="mainMenu", defaultValue="member")String mainMenu
			) throws Exception{
		
		String moveUrl = "redirect:../";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
			
			if("3".equals(team_type)) {	//	????Ʈ
				
				HashMap sessionMap = SessionUtil.getSessionMap(session, "ADMIN");
				List list_site = (List) sessionMap.get("list_site");
				HashMap site_map = (HashMap) list_site.get(0);
				
				
				HashMap memberList = Api.getSiteMemberList(String.valueOf(site_map.get("seq_site")));
				HashMap summaryList = Api.getSiteMemberSummary(String.valueOf(site_map.get("seq_site")));
				
				
				moveUrl = "apt/member/aptMemberList";
				model.addAttribute("LIST_MEMBER", memberList.get("list_member"));
				model.addAttribute("COUNT_MAP", summaryList);
				model.addAttribute("mainMenu", mainMenu);
		
			}
			
		}
		
		return moveUrl;
		
	}
	
}
