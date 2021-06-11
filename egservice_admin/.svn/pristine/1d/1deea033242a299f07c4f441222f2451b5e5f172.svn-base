package egservice.co.kr.admin.org.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egservice.co.kr.admin.common.SessionUtil;

@Controller
@RequestMapping("/org")
public class OrgNoticeController {
	
	@RequestMapping("/noticeList")
	public String noticeList(HttpSession session, Model model, 
			@RequestParam(value="mainMenu", defaultValue = "notice") String mainMenu) throws Exception{
		
		
		String moveUrl = "redirect:/";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");

			if("2".equals(team_type)) {	//	건물
				moveUrl = "org/notice/list";
				
				model.addAttribute("mainMenu", mainMenu);
			}
			
		}
		
		return moveUrl;
	}
	
	//	공지사항 작성
	@RequestMapping("/noticeWrite")
	public String noticeWrite(HttpSession session, Model model, 
			@RequestParam(value="mainMenu", defaultValue = "notice") String mainMenu) throws Exception{
		
		
		String moveUrl = "redirect:/";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");

			if("2".equals(team_type)) {	//	건물
				moveUrl = "org/notice/write";
				
				model.addAttribute("mainMenu", mainMenu);
			}
			
		}
		
		return moveUrl;
	}
	
	//	공지사항 보기
	@RequestMapping("/noticeView")
	public String noticeView(HttpSession session, Model model, 
			@RequestParam(value="mainMenu", defaultValue = "notice") String mainMenu) throws Exception{
		String moveUrl = "redirect:/";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");

			if("2".equals(team_type)) {	//	건물
				moveUrl = "org/notice/view";
				
				model.addAttribute("mainMenu", mainMenu);
			}
			
		}
		
		return moveUrl;
	}
	
	//	공지사항 수정
	@RequestMapping("/noticeModify")
	public String noticeModify(HttpSession session, Model model, 
			@RequestParam(value="mainMenu", defaultValue = "notice") String mainMenu) throws Exception{
		String moveUrl = "redirect:/";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");

			if("2".equals(team_type)) {	//	건물
				moveUrl = "org/notice/modify";
				
				model.addAttribute("mainMenu", mainMenu);
			}
			
		}
		
		return moveUrl;
	}

}
