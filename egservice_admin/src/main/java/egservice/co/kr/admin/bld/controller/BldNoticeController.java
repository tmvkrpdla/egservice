package egservice.co.kr.admin.bld.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egservice.co.kr.admin.common.Api;
import egservice.co.kr.admin.common.PageUtil;
import egservice.co.kr.admin.common.SessionUtil;

@Controller
@RequestMapping("/bld")
public class BldNoticeController {
	//	공지사항	목록
	@RequestMapping("/noticeList")
	public String noticeList(HttpSession session, Model model, 
			@RequestParam(value="mainMenu", defaultValue="notice")String mainMenu,
			@RequestParam(value="nowPage", defaultValue = "1") int nowPage) throws Exception{
		
		String moveUrl = "redirect:../";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			//logger.info(" nowPage : " + nowPage);
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
			String seq_admin = SessionUtil.getString(session, "ADMIN", "seq_admin");
			
			if("4".equals(team_type)) {	//	건물
								
				String targetType = "3";
				
				HashMap<String, Object> totalMap = Api.getNoticeCount(targetType);
				int totalCount = (Integer)totalMap.get("count_notice_total");
				
				
				PageUtil pageUtil = new PageUtil(nowPage, totalCount, 10);
				
				
				HashMap<String, Object> noticeData = Api.getNoticeListForPaging("1", targetType , pageUtil.getStartNum(), pageUtil.getEndNum());//(seq_admin, timeCreatedMax, 1000000);
				
				
				List notice_list = (List) noticeData.get("notice_list");
				
				moveUrl = "bld/notice/list";
				model.addAttribute("mainMenu", mainMenu);
				
				model.addAttribute("NOTICE_LIST", notice_list);
				model.addAttribute("PAGEUTIL", pageUtil);
				model.addAttribute("nowPage", nowPage);
			}
			
		}		
		
		return moveUrl;
	}
	
	@RequestMapping("/noticeView")
	public String noticeView(HttpSession session, Model model,
			@RequestParam(value="mainMenu", defaultValue="notice") String mainMenu,
			@RequestParam(value="nowPage")int nowPage,
			@RequestParam HashMap paramMap
			)throws Exception{
		
		String moveUrl = "redirect:../";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			if(! (paramMap.isEmpty()) ) {
				
				String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
				
				if("4".equals(team_type)) {	//	건물
															
					String seq_admin = SessionUtil.getString(session, "ADMIN", "seq_admin");
					
					String seq_notice = String.valueOf(paramMap.get("seq_notice"));
					
					HashMap<String, Object> resultMap = Api.setBldNoticeListAsRead(seq_admin, seq_notice);
					//logger.info("call	/bld/noticeView");
					//logger.info("result : " + returnMap.toString());
					
					moveUrl = "bld/notice/view";
					model.addAttribute("NOTICE", paramMap);
					model.addAttribute("mainMenu", mainMenu);
					model.addAttribute("nowPage", nowPage);
				}
			}
		}
		
		return moveUrl;
	}
}
