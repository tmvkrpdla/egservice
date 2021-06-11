package egservice.co.kr.admin.bld.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egservice.co.kr.admin.common.Api;
import egservice.co.kr.admin.common.SessionUtil;

@Controller
@RequestMapping("/bld")
public class BldSetController {

//	설정 알림
	@RequestMapping("/setAlarm")
	public String alarm(HttpSession session, @RequestParam(value="mainMenu", defaultValue="alarm")String mainMenu,
			Model model) throws Exception{
		
		String moveUrl = "redirect:../";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
			
			if("4".equals(team_type)) {	//	건물
				
				String seq_admin = SessionUtil.getString(session, "ADMIN", "seq_admin");
				
				//	site_list	->	seq_site 확보
				HashMap adminUsageCurrentMap = Api.getAdminUsageCurrent(seq_admin);
				
				
				List siteList = (List) adminUsageCurrentMap.get("site_list");
				HashMap siteMap = (HashMap) siteList.get(0);
				
				String seq_site = String.valueOf(siteMap.get("seq_site"));
				
				
				//	알림 문자발송 대상자를 가져옮
				HashMap resultTeamAdminLister = Api.getTeamAdminList(seq_site);
				List admin_list = (List) resultTeamAdminLister.get("admin_list");
				
				//	admin_list 에서 seq_admin 같은 것을 찾고, admin_map에 저장
				HashMap admin_map = null; 
				
				for(int i=0; i<admin_list.size(); i++) {
					HashMap tempMap = (HashMap) admin_list.get(i);
					String tempSeqAdmin = String.valueOf(tempMap.get("seq_admin"));
					if(seq_admin.equals(tempSeqAdmin)) {
						admin_map = tempMap;
					}
					
				}
				
				//logger.info(admin_map.toString());
				
				moveUrl = "bld/set/alarm";
				model.addAttribute("mainMenu", mainMenu);
				
				model.addAttribute("ADMIN_LIST", admin_list);	//	알림문자발송 대상자 리스트
				model.addAttribute("ADMIN_MAP", admin_map);		//	로그인  한 사람의 알림 관련 데이터

			}
			
		}
		
		return moveUrl;
	}
	
	
}
