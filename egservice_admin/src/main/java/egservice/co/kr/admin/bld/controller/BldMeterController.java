package egservice.co.kr.admin.bld.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egservice.co.kr.admin.common.Api;
import egservice.co.kr.admin.common.ApiUtil;
import egservice.co.kr.admin.common.Apibld;
import egservice.co.kr.admin.common.SessionUtil;
import egservice.co.kr.admin.common.StringUtil;

@Controller
@RequestMapping("/bld")
public class BldMeterController {

	//	계측기별 사용량 분석 - 시간대별 분석
	@RequestMapping("/meterTime")
	public String meterTime(HttpSession session, Model model, 
			@RequestParam(value = "mainMenu", defaultValue = "meter" ) String mainMenu
			,@RequestParam(value = "subMenu" , defaultValue= "meter-time" ) String subMenu) throws Exception{
		
		
		String moveUrl = "redirect:/";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");

			if("4".equals(team_type)) {	//	건물
				moveUrl = "bld/meter/time";
				
				model.addAttribute("mainMenu", mainMenu);
				model.addAttribute("subMenu", subMenu);
			}
			
		}
		
		return moveUrl;
	}
	
	//	계측기별 사용량 분석 - 시간대별 사용량 다중분석
	@RequestMapping("/meterCompTime")
	public String meterCompTime(HttpSession session,Model model,
	  @RequestParam(value = "mainMenu", defaultValue = "meter" ) String mainMenu
	  ,@RequestParam(value = "subMenu", defaultValue = "meter-comptime" ) String subMenu) throws Exception{
	
	
		String moveUrl = "redirect:/";
	 
		if(!SessionUtil.isNull(session, "ADMIN")) {
	 
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
	  
			if("4".equals(team_type)) { // 건물 
				moveUrl = "bld/meter/compTime";
	  
				model.addAttribute("mainMenu", mainMenu); 
				model.addAttribute("subMenu",subMenu); 
	  	
			}
	
		}
	
		return moveUrl; 
	}
	 	
	
	
	//	계측기별 사용량 분석 - 날짜별 분석
	@RequestMapping("/meterWeek")
	public String meterWeek(HttpSession session, Model model, 
			@RequestParam(value="mainMenu", defaultValue = "meter") String mainMenu
			,@RequestParam(value="subMenu", defaultValue = "meter-week") String subMenu) throws Exception{
		
		
		String moveUrl = "redirect:../";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");

			if("4".equals(team_type)) {	//	건물
				moveUrl = "bld/meter/week";
				
				model.addAttribute("mainMenu", mainMenu);
				model.addAttribute("subMenu", subMenu);
			}
			
		}
		
		return moveUrl;
	}	
	
	//	계측기별 사용량 분석 - 요일별 분석
	@RequestMapping("/meterMonth")
	public String meterMonth(HttpSession session, Model model, 
			@RequestParam(value="mainMenu", defaultValue = "meter") String mainMenu
			,@RequestParam(value="subMenu", defaultValue = "meter-month") String subMenu) throws Exception{
		
		
		String moveUrl = "redirect:../";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");

			if("4".equals(team_type)) {	//	건물
				moveUrl = "bld/meter/month";
				
				model.addAttribute("mainMenu", mainMenu);
				model.addAttribute("subMenu", subMenu);
			}
			
		}
		
		return moveUrl;
	}	
	
	
	
	
	//	계측기별 사용량 분석 - 주간 비교 분석
	@RequestMapping("/meterWeekly")
	public String meterWeekly(HttpSession session, Model model, 
			@RequestParam(value="mainMenu", defaultValue = "meter") String mainMenu
			,@RequestParam(value="subMenu", defaultValue = "weekly") String subMenu
			, @RequestParam(value="dateFrom" ,defaultValue="")String dateFrom
			, @RequestParam(value="dateTo", defaultValue="") String dateTo
			, @RequestParam(value="mid", defaultValue = "") String mid) throws Exception{
		
		
		String moveUrl = "redirect:../";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");

			if("4".equals(team_type)) {	//	건물
				
				StringUtil stringUtil = new StringUtil();
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
				
				if("".equals(dateTo)) {
					
					dateTo = stringUtil.getFullYearYYYY() + "-" + stringUtil.getMonthMM() + "-" + stringUtil.getDayDD();
					
					Date d = df.parse(dateTo);
					Calendar c = Calendar.getInstance();
					c.setTime(d);
					c.add(Calendar.DATE, -1);
					
					dateTo = df.format(c.getTime());
					
				}
				
				
				if("".equals(dateFrom)) {
					 
					Date date = df.parse(dateTo);
					Calendar cal = Calendar.getInstance();
					
					cal.setTime(date);
					
					cal.add(Calendar.DATE, -14);
					
					dateFrom = df.format(cal.getTime());   
					
					
				}
				
				if("".equals(mid)) {
					HashMap siteInfoBldMap = SessionUtil.getSessionMap(session, "SITE_INFO_BLD");
					ArrayList meterList = (ArrayList) siteInfoBldMap.get("meter_list");
					
					HashMap meterMap = (HashMap) meterList.get(0);
					mid = (String) meterMap.get("mid");
					
					//System.out.println(mid);
				}
				
				String[] dateToArr = dateTo.split("-");
				String[] dateFromArr = dateFrom.split("-");
				
				HashMap usageWeekly = Apibld.getMeterUsageWeeklyComparison(mid, dateFromArr[0], dateFromArr[1], dateFromArr[2], dateToArr[0], dateToArr[1], dateToArr[2]);
				usageWeekly = ApiUtil.meterUsageWeekly(usageWeekly);
				
				//System.out.println(usageWeekly.toString());
				
				moveUrl = "bld/meter/weekly";
				
				model.addAttribute("MID", mid);	//	default mid
				
				model.addAttribute("LIST_USAGE", usageWeekly.get("list_usage"));
				model.addAttribute("DATEFROM", dateFrom);
				model.addAttribute("DATETO", dateTo);
				model.addAttribute("mainMenu", mainMenu);
				model.addAttribute("subMenu", subMenu);
			}
			
		}
		
		return moveUrl;
	}	
	
}
