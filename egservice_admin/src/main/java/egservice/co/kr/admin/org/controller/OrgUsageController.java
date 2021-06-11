package egservice.co.kr.admin.org.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
@RequestMapping("/org")
public class OrgUsageController {

	//	��뷮 - �ð�
	@RequestMapping("/usageDay")
	public String usageDay(HttpSession session, Model model, 
			@RequestParam(value="mainMenu", defaultValue = "usage") String mainMenu
			,@RequestParam(value="subMenu", defaultValue="day") String subMenu
			, @RequestParam(value="dateTarget", defaultValue="") String dateTarget ) throws Exception{
		
		
		String moveUrl = "redirect:/";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");

			if("2".equals(team_type)) {	//	
				
				if("".equals(dateTarget)) {
					StringUtil stringUtil = new StringUtil();
					dateTarget = stringUtil.getFullYearYYYY() + "-" + stringUtil.getMonthMM() + "-" + stringUtil.getDayDD(); 
				}
				
				//	����
				HashMap weatherDay =  Api.getWeatherDay(dateTarget.replaceAll("-", ""));
				
				weatherDay = ApiUtil.getMapWeather(weatherDay);
				///////////////////////////////////////////////////////////
				
				//	list_site�� �����ͼ� day ������ ȣ��
				HashMap adminMap = SessionUtil.getSessionMap(session, "ADMIN");
				List list_site =  (List) adminMap.get("list_site");
				
				//	2020-01-01	split �ϸ� �迭�� 
				String[] dateArr = dateTarget.split("-"); 
			
				//	����Ʈ ���� �� ����Ʈ�� �Ϸ� ��뷮�� ���� ����Ʈ
				List usage_site_day_list = new ArrayList();
				
				for(int i=0; i<list_site.size(); i++) {
					HashMap siteMap = (HashMap) list_site.get(i);
					
					String seq_site = String.valueOf(siteMap.get("seq_site"));	//	����Ʈ ������
					String site_name = String.valueOf(siteMap.get("site_name"));	//	����Ʈ ��
					
					HashMap usageSiteDay = Api.getUsageSiteDay(seq_site, dateArr[0], dateArr[1], dateArr[2]);
					//	{is_holiday=0, list_usage=[{unit=0, usage=28.403000000000002}, {unit=1, usage=24.634000000000004}, {unit=2, usage=23.411999999999995},
					//								{unit=3, usage=21.327999999999985}, {unit=4, usage=20.294}, {unit=5, usage=22.058999999999994}, {unit=6, usage=30.739}, {unit=7, usage=32.973000000000006}, {unit=8, usage=32.882000000000005}, {unit=9, usage=30.776000000000007}, {unit=10, usage=30.40399999999999}, {unit=11, usage=27.266000000000002}, {unit=12, usage=28.154999999999994}, {unit=13, usage=30.10700000000001}, {unit=14, usage=27.707000000000004}, {unit=15, usage=28.322}, {unit=16, usage=30.097999999999995}, {unit=17, usage=31.18266666666665}, {unit=18, usage=37.521166666666666}, {unit=19, usage=37.70716666666668}, {unit=20, usage=42.226000000000006},
					//								{unit=21, usage=39.741}, {unit=22, usage=39.795}, {unit=23, usage=35.468999999999994}]}
					
					usageSiteDay = ApiUtil.dataComma(usageSiteDay);
					usageSiteDay.put("seq_site", seq_site);
					usageSiteDay.put("site_name", site_name);
					
					
					usage_site_day_list.add(usageSiteDay);
					
					
				}
				
				
				
				moveUrl = "org/usage/day";
				
				model.addAttribute("DATETARGET", dateTarget);	//	��ȸ��
				model.addAttribute("WEATHERDAY", weatherDay);	//	���� ��ȸ ������
				
				model.addAttribute("USAGE_SITE_DAY_LIST", usage_site_day_list);
				
				model.addAttribute("mainMenu", mainMenu);
				model.addAttribute("subMenu", subMenu);
			}
			
		}
		
		return moveUrl;
	}
	
	//	��뷮 - ��¥
	@RequestMapping("/usageMonth")
	public String usageMonth(HttpSession session, Model model, 
			@RequestParam(value="mainMenu", defaultValue = "usage") String mainMenu
			,@RequestParam(value="subMenu", defaultValue="month") String subMenu
			,@RequestParam(value="monthTarget", defaultValue = "") String monthTarget) throws Exception{
		
		
		String moveUrl = "redirect:/";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");

			if("2".equals(team_type)) {	//	
				
				if("".equals(monthTarget)) {
					StringUtil stringUtil = new StringUtil();
					monthTarget = stringUtil.getFullYearYYYY() + "-" + stringUtil.getMonthMM();
				}
				
				//	���� ������ ��������
				HashMap weatherMonth = Api.getWeatherMonth(monthTarget.replaceAll("-", ""));
				
				
				List list_weather = (List) weatherMonth.get("list_weather");
				
				//	�޹���üũ, ����üũ, ����üũ
				list_weather = ApiUtil.getListWeather(list_weather);
				//	������ �߰� �� ��ü
				weatherMonth.put("list_weather", list_weather);
				
				///////////////////////////////////////////////////////////
				
				//	����Ʈ ���� �� ����Ʈ�� ���� ��뷮�� ���� ����Ʈ
				List usage_site_month_list = new ArrayList();
				
				HashMap adminMap = SessionUtil.getSessionMap(session, "ADMIN");
				List list_site =  (List) adminMap.get("list_site");
				
				String[] dateArr = monthTarget.split("-");
				
				for(int i=0; i<list_site.size(); i++) {
					HashMap siteMap = (HashMap) list_site.get(i);
					
					String seq_site = String.valueOf(siteMap.get("seq_site"));	//	����Ʈ ������
					String site_name = String.valueOf(siteMap.get("site_name"));	//	����Ʈ ��
					
					HashMap usageSiteMonth = Api.getUsageSiteMonth(seq_site, dateArr[0], dateArr[1]);
					
					usageSiteMonth = ApiUtil.dataComma(usageSiteMonth);
					
					usageSiteMonth.put("seq_site", seq_site);
					usageSiteMonth.put("site_name", site_name);
					
					//System.out.println(usageSiteMonth.toString());
					usage_site_month_list.add(usageSiteMonth);
					
					
				}
				
				moveUrl = "org/usage/month";
				
				model.addAttribute("USAGE_SITE_MONTH_LIST", usage_site_month_list); // ����Ʈ�� ��뷮
				model.addAttribute("WEATHERMONTH", weatherMonth);	//	����
				
				model.addAttribute("MONTHTARGET", monthTarget);		//	�⵵-��	2020-06
				model.addAttribute("mainMenu", mainMenu);
				model.addAttribute("subMenu", subMenu);
			}
			
		}
		
		return moveUrl;
	}	
	
	//	��뷮 - ����
	@RequestMapping("/usageWeek")
	public String usageWeek(HttpSession session, Model model, 
			@RequestParam(value="mainMenu", defaultValue = "usage") String mainMenu
			,@RequestParam(value="subMenu", defaultValue="week") String subMenu
			, @RequestParam(value="dateFrom" ,defaultValue="")String dateFrom
			, @RequestParam(value="dateTo", defaultValue="") String dateTo) throws Exception{
		
		
		String moveUrl = "redirect:../";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");

			if("2".equals(team_type)) {	//	
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
				
				
				
				
				HashMap weather = Api.getWeather(dateFrom.replaceAll("-", ""), dateTo.replaceAll("-", ""));
				
				
				
				//	����Ʈ ���� �� ����Ʈ�� ���� ��뷮�� ���� ����Ʈ
				List usage_site_week_list = new ArrayList();
				
				HashMap adminMap = SessionUtil.getSessionMap(session, "ADMIN");
				List list_site =  (List) adminMap.get("list_site");
								
				String[] dateFromArr = dateFrom.split("-");
				String[] dateToArr = dateTo.split("-");
				
				for(int i=0; i<list_site.size(); i++) {
					HashMap siteMap = (HashMap) list_site.get(i);
					
					
					String seq_site = String.valueOf(siteMap.get("seq_site"));	//	����Ʈ ������
					String site_name = String.valueOf(siteMap.get("site_name"));	//	����Ʈ ��
					
					
					HashMap usageSiteWeek = Api.getUsageSiteWeek(seq_site, dateFromArr[0], dateFromArr[1], dateFromArr[2], dateToArr[0], dateToArr[1], dateToArr[2]);
					
					//System.out.println(usageSiteWeek.toString());
					usageSiteWeek = ApiUtil.getListUsageWeek(usageSiteWeek);	//	text_unit
					usageSiteWeek = ApiUtil.dataComma(usageSiteWeek);			//	round_usage, text_usage	
					
					
					usageSiteWeek.put("seq_site", seq_site);
					usageSiteWeek.put("site_name", site_name);
					
					/*
					 * if(i==0) { // �ݺ��� �������̹Ƿ� 0��° �����͸� ������ ���� �����. List tempList = (List)
					 * usageSiteWeek.get("list_usage"); for(int j=0; j<tempList.size(); j++) {
					 * HashMap tempMap = (HashMap) tempList.get(j);
					 * label_list.add(tempMap.get("text_unit")); } }
					 */
					
					
					//System.out.println(usageSiteWeek.toString());
					usage_site_week_list.add(usageSiteWeek);
					
					
				}
				
				
				
				
				moveUrl = "org/usage/week";
			
				model.addAttribute("USAGE_SITE_WEEK_LIST", usage_site_week_list);	//	����Ʈ�� �ְ� ���
				model.addAttribute("WEATHER", weather);
				
				model.addAttribute("DATEFROM", dateFrom);
				model.addAttribute("DATETO", dateTo);
				
				model.addAttribute("mainMenu", mainMenu);
				model.addAttribute("subMenu", subMenu);
			}
			
		}
		
		return moveUrl;
	}	
	
	//	��뷮 - ����
	@RequestMapping("/usageYear")
	public String usageYear(HttpSession session, Model model, 
			@RequestParam(value="mainMenu", defaultValue = "usage") String mainMenu
			,@RequestParam(value="subMenu", defaultValue="year") String subMenu
			, @RequestParam(value="dateTarget", defaultValue="") String dateTarget) throws Exception{
		
		
		String moveUrl = "redirect:../";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");

			if("2".equals(team_type)) {	//
				
				if("".equals(dateTarget)) {
					dateTarget = new StringUtil().getFullYearYYYY();
					
				}
				
				//	list_site�� �����ͼ� day ������ ȣ��
				HashMap adminMap = SessionUtil.getSessionMap(session, "ADMIN");
				List list_site =  (List) adminMap.get("list_site");
				
				List usage_site_year_list = new ArrayList();
				
				for(int i=0; i<list_site.size(); i++) {
					HashMap siteMap = (HashMap) list_site.get(i);
					
					String seq_site = String.valueOf(siteMap.get("seq_site"));	//	����Ʈ ������
					String site_name = String.valueOf(siteMap.get("site_name"));	//	����Ʈ ��
					
					HashMap usageSiteYear = Api.getUsageSiteYear(seq_site, dateTarget);
					
					//	��뷮 ������ ���� #,##0.00
					usageSiteYear = ApiUtil.dataComma(usageSiteYear);
					
					//System.out.println(usageSiteYear.toString());
					
					usageSiteYear.put("seq_site", seq_site);
					usageSiteYear.put("site_name", site_name);
					
					
					usage_site_year_list.add(usageSiteYear);
					
				}
				
				
				moveUrl = "org/usage/year";
				
				model.addAttribute("USAGE_SITE_YEAR_LIST", usage_site_year_list);
				model.addAttribute("DATETARGET", dateTarget);	//	��ȸ��
				model.addAttribute("mainMenu", mainMenu);
				model.addAttribute("subMenu", subMenu);
			}
			
		}
		
		return moveUrl;
	}	
}