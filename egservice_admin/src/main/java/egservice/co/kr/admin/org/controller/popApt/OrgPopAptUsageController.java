package egservice.co.kr.admin.org.controller.popApt;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egservice.co.kr.admin.common.Api;
import egservice.co.kr.admin.common.ApiUtil;
import egservice.co.kr.admin.common.SessionUtil;
import egservice.co.kr.admin.common.StringUtil;

@Controller
@RequestMapping("/org/pop")
public class OrgPopAptUsageController {

	//	날짜별 사용량 비교
	@RequestMapping("/aptUsageDay")
	public String aptUsageDay(HttpSession session, Model model,
			@RequestParam(value="mainMenu", defaultValue="usage")String mainMenu,
			@RequestParam(value="subMenu", defaultValue="day") String subMenu,
			@RequestParam(value="dateTarget", defaultValue="") String dateTarget,
			@RequestParam(value="sort", defaultValue="1") String sort ) throws Exception{

		String moveUrl = "redirect:../";
				
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
			
			if("2".equals(team_type)) {
				
				if("".equals(dateTarget)) {
					StringUtil stringUtil = new StringUtil();
					dateTarget = stringUtil.getFullYearYYYY() + "-" + stringUtil.getMonthMM() + "-" + stringUtil.getDayDD();
				}
				
				//	날씨
				HashMap weatherDay =  Api.getWeatherDay(dateTarget.replaceAll("-", ""));
				
				weatherDay = ApiUtil.getMapWeather(weatherDay);
				
				//	2020-01-01	split 하면 배열로 
				String[] dateArr = dateTarget.split("-"); 
				
				
				//	SeqSite를 세션에서 가져옮
				HashMap siteInfoBldMap = SessionUtil.getSessionMap(session, "SITE_INFO_BLD");
				String SeqSite = String.valueOf(siteInfoBldMap.get("seq_site"));
				
				//	아파트 단지 세대별 1일 사용량 목록을 가져옮
				HashMap usageListMap = Api.getUsageListOfSiteDay(SeqSite, dateArr[0], dateArr[1], dateArr[2], sort);
				
				ArrayList list_usage = (ArrayList) usageListMap.get("list_usage");
				if(list_usage.size() != 0) {
					usageListMap = ApiUtil.getUsageList(usageListMap);
				}
				
				//System.out.println(usageListMap.toString());
				
				moveUrl = "org/pop/apt/usage/popAptUsageDay";
				
				model.addAttribute("SORT", sort);				//	정렬 조건
				model.addAttribute("DATETARGET", dateTarget);	//	검색일
				model.addAttribute("WEATHERDAY", weatherDay);	//	검색 날짜의 날씨
				
				model.addAttribute("USAGELISTMAP", usageListMap);	//	조회된 데이터
				
				
				model.addAttribute("mainMenu", mainMenu);
				model.addAttribute("subMenu", subMenu);

			}
			
		}
		
		return moveUrl;
	}	

	
	@RequestMapping("/aptUsageMonth")
	public String aptUsageMonth(HttpSession session, Model model,
			@RequestParam(value="mainMenu", defaultValue="usage")String mainMenu,
			@RequestParam(value="subMenu", defaultValue="month") String subMenu,
			@RequestParam(value="monthTarget", defaultValue="") String monthTarget,
			@RequestParam(value="sort", defaultValue="1") String sort ) throws Exception{

		String moveUrl = "redirect:../";
				
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
			
			if("2".equals(team_type)) {
				
				if("".equals(monthTarget)) {
					StringUtil stringUtil = new StringUtil();
					monthTarget = stringUtil.getFullYearYYYY() + "-" + stringUtil.getMonthMM();
				}
				
				//	날씨 데이터 가져오기
				HashMap weatherMonth = Api.getWeatherMonth(monthTarget.replaceAll("-", ""));
				List list_weather = (List) weatherMonth.get("list_weather");
				//	휴무일체크, 날씨체크, 요일체크
				list_weather = ApiUtil.getListWeather(list_weather);
				//	데이터 추가 후 교체
				weatherMonth.put("list_weather", list_weather);
				
				//System.out.println(weatherMonth.toString());
				//	2020-01-01	split 하면 배열로 
				String[] dateArr = monthTarget.split("-"); 
				
				
				//	SeqSite를 세션에서 가져옮
				HashMap siteInfoBldMap = SessionUtil.getSessionMap(session, "SITE_INFO_BLD");
				String SeqSite = String.valueOf(siteInfoBldMap.get("seq_site"));
				
				//	아파트 단지 세대별 1개월 사용량 목록
				HashMap usageListMap = Api.getUsageListOfSiteMonth(SeqSite, dateArr[0], dateArr[1], sort);
				
				ArrayList list_usage = (ArrayList) usageListMap.get("list_usage");
				if(list_usage.size() != 0) {
					usageListMap = ApiUtil.getUsageList(usageListMap);
				}
				
				//System.out.println(usageListMap.toString());
				
				moveUrl = "org/pop/apt/usage/popAptUsageMonth";
				
				model.addAttribute("SORT", sort);				//	정렬 조건
				model.addAttribute("MONTHTARGET", monthTarget);	//	검색월
				model.addAttribute("WEATHERMONTH", weatherMonth);	//	검색 날짜의 날씨
				
				model.addAttribute("USAGELISTMAP", usageListMap);	//	조회된 데이터
				
				
				model.addAttribute("mainMenu", mainMenu);
				model.addAttribute("subMenu", subMenu);

			}
			
		}
		
		return moveUrl;
	}	
	
	
}
