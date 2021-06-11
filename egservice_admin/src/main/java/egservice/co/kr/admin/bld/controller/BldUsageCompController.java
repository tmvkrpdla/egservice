package egservice.co.kr.admin.bld.controller;

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
import egservice.co.kr.admin.common.Apibld;
import egservice.co.kr.admin.common.SessionUtil;
import egservice.co.kr.admin.common.StringUtil;

@Controller
@RequestMapping("/bld")
public class BldUsageCompController {
	
	//	�����Ⱓ ��뷮 �� - �ð��뺰 ��
	@RequestMapping("/compDay")
	public String bldCompDay(HttpSession session, Model model, 
			@RequestParam(value="mainMenu", defaultValue = "comp") String mainMenu
			,@RequestParam(value="subMenu", defaultValue="day") String subMenu
			, @RequestParam(value="dateTarget", defaultValue="") String dateTarget) throws Exception{
		
		
		String moveUrl = "redirect:/";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");

			if("4".equals(team_type)) {	//	�ǹ�
				if("".equals(dateTarget)) {
					StringUtil stringUtil = new StringUtil();
					dateTarget = stringUtil.getFullYearYYYY() + "-" + stringUtil.getMonthMM() + "-" + stringUtil.getDayDD();
				}
				
				//	����
				HashMap weatherDay =  Apibld.getWeatherDay(dateTarget.replaceAll("-", ""));
				
				weatherDay = ApiUtil.getMapWeather(weatherDay);
				
				////////////////////////////////////////////////////////////
				
				//	2020-01-01	split �ϸ� �迭�� 
				String[] dateArr = dateTarget.split("-"); 
				
				//	���ǿ��� meter_list �� ������
				HashMap siteInfoBldMap = SessionUtil.getSessionMap(session, "SITE_INFO_BLD");
					
				//	meter_list����  ������ ��ȣ�� ������ �����Ⱓ ��뷮 ȣ��
				List meter_list = (List) siteInfoBldMap.get("meter_list");
				
				
				//	�����⺰ �����͸� ���� list
				List usage_meter_day_list = new ArrayList();
				
				for(int i=0; i<meter_list.size();i++) {
					HashMap meterMap = (HashMap) meter_list.get(i);
					
					String seq_meter = String.valueOf(meterMap.get("seq_meter")); 
					
					HashMap usageMeterDayMap = Apibld.getUsageMeterDay(seq_meter, dateArr[0], dateArr[1], dateArr[2]);
					
					//	��Ʈ�� �� ���̺��� �����ͷ� ����
					usageMeterDayMap = ApiUtil.dataComma(usageMeterDayMap);
					
					usageMeterDayMap.put("seq_meter", seq_meter);	//	���͹�ȣ
					usageMeterDayMap.put("meter_name", meterMap.get("meter_name"));
					usageMeterDayMap.put("descr", meterMap.get("descr"));	//	 �ǹ������ڰ� �ο��� ��Ī (�� : ����ⱸ, ������ ��)
					
					//System.out.println(usageMeterDayMap.toString());
					
					usage_meter_day_list.add(usageMeterDayMap);
					
				}
				
				moveUrl = "bld/comp/day";
				
				model.addAttribute("DATETARGET", dateTarget);	//	��ȸ��
				model.addAttribute("WEATHERDAY", weatherDay);	//	���� ��ȸ ������
				
				model.addAttribute("USAGE_METER_DAY_LIST", usage_meter_day_list);//��뷮
				
				model.addAttribute("mainMenu", mainMenu);
				model.addAttribute("subMenu", subMenu);
			}
			
		}
		
		return moveUrl;
	}
	
	//	�����Ⱓ ��뷮 �� - ��¥�� �м�
	@RequestMapping("/compMonth")
	public String bldCompMonth(HttpSession session, Model model, 
			@RequestParam(value="mainMenu", defaultValue = "comp") String mainMenu
			,@RequestParam(value="subMenu", defaultValue="month") String subMenu
			,@RequestParam(value="monthTarget", defaultValue = "") String monthTarget) throws Exception{
		
		
		String moveUrl = "redirect:/";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");

			if("4".equals(team_type)) {	//	�ǹ�
				
				if("".equals(monthTarget)) {
					StringUtil stringUtil = new StringUtil();
					monthTarget = stringUtil.getFullYearYYYY() + "-" + stringUtil.getMonthMM();
				}
				
				//	���� ������ ��������
				HashMap weatherMonth = Apibld.getWeatherMonth(monthTarget.replaceAll("-", ""));
				
				List list_weather = (List) weatherMonth.get("list_weather");
				
				//	�޹���üũ, ����üũ, ����üũ
				list_weather = ApiUtil.getListWeather(list_weather);
				//	������ �߰� �� ��ü
				weatherMonth.put("list_weather", list_weather);
				
				/////////////////////////////////////////////////////////
				
				
				//	2020-01-01	split �ϸ� �迭�� 
				String[] dateArr = monthTarget.split("-"); 
				
				//	���ǿ��� meter_list �� ������
				HashMap siteInfoBldMap = SessionUtil.getSessionMap(session, "SITE_INFO_BLD");
				
				//	meter_list����  ������ ��ȣ�� ������ �����Ⱓ ��뷮 ȣ��
				List meter_list = (List) siteInfoBldMap.get("meter_list");
				
			
				//	�����⺰ �����͸� ���� list
				List usage_meter_month_list = new ArrayList();
				
				for(int i=0; i<meter_list.size(); i++) {
					HashMap meterMap = (HashMap) meter_list.get(i);
					String seq_meter = String.valueOf(meterMap.get("seq_meter"));
					
					HashMap usageMeterMonth = Apibld.getUsageMeterMonth(seq_meter, dateArr[0], dateArr[1]);
					
					
					usageMeterMonth = ApiUtil.dataComma(usageMeterMonth);
					
					usageMeterMonth.put("seq_meter", seq_meter);	//	���͹�ȣ
					usageMeterMonth.put("meter_name", meterMap.get("meter_name"));
					usageMeterMonth.put("descr", meterMap.get("descr"));	//	 �ǹ������ڰ� �ο��� ��Ī (�� : ����ⱸ, ������ ��)
					
										
					usage_meter_month_list.add(usageMeterMonth);
				}
				
				moveUrl = "bld/comp/month";
				model.addAttribute("WEATHERMONTH", weatherMonth);	//	����
				
				model.addAttribute("USAGE_METER_MONTH_LIST", usage_meter_month_list);	//	
				
				model.addAttribute("MONTHTARGET", monthTarget);		//	�⵵-��	2020-06
				model.addAttribute("mainMenu", mainMenu);
				model.addAttribute("subMenu", subMenu);
			}
			
		}
		
		return moveUrl;
	}	
	
	//	�����Ⱓ ��뷮 �� - ���Ϻ� �м�
	@RequestMapping("/compWeek")
	public String bldCompWeek(HttpSession session, Model model, 
			@RequestParam(value="mainMenu", defaultValue = "comp") String mainMenu
			,@RequestParam(value="subMenu", defaultValue="week") String subMenu
			, @RequestParam(value="dateFrom" ,defaultValue="")String dateFrom
			, @RequestParam(value="dateTo", defaultValue="") String dateTo
			) throws Exception{
		
		
		String moveUrl = "redirect:../";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");

			if("4".equals(team_type)) {	//	�ǹ�
				
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
				
				
				
				HashMap weather = Apibld.getWeather(dateFrom.replaceAll("-", ""), dateTo.replaceAll("-", ""));
				
				
				String[] dateFromArr = dateFrom.split("-");
				String[] dateToArr = dateTo.split("-");
				
				//	���ǿ��� meter_list �� ������
				HashMap siteInfoBldMap = SessionUtil.getSessionMap(session, "SITE_INFO_BLD");
				
				//	meter_list����  ������ ��ȣ�� ������ �����Ⱓ ��뷮 ȣ��
				List meter_list = (List) siteInfoBldMap.get("meter_list");
				
			
				//	�����⺰ �����͸� ���� list
				List usage_meter_week_list = new ArrayList();
				
				for(int i=0; i<meter_list.size(); i++) {
					HashMap meterMap = (HashMap) meter_list.get(i);
					String seq_meter = String.valueOf(meterMap.get("seq_meter"));
					
					HashMap usageMeterWeek = Apibld.getUsageMeterWeek(seq_meter, dateFromArr[0], dateFromArr[1], dateFromArr[2], dateToArr[0], dateToArr[1], dateToArr[2]);
					
					usageMeterWeek = ApiUtil.getListUsageWeek(usageMeterWeek);
					usageMeterWeek = ApiUtil.dataComma(usageMeterWeek);
					
					usageMeterWeek.put("seq_meter", seq_meter);	//	���͹�ȣ
					usageMeterWeek.put("meter_name", meterMap.get("meter_name"));
					usageMeterWeek.put("descr", meterMap.get("descr"));	//	 �ǹ������ڰ� �ο��� ��Ī (�� : ����ⱸ, ������ ��)
					
					//System.out.println(usageMeterWeek.toString());
					
					usage_meter_week_list.add(usageMeterWeek);
				}
				
				//System.out.println(weather.toString());
				moveUrl = "bld/comp/week";
				
				model.addAttribute("WEATHER", weather);
				
				model.addAttribute("DATEFROM", dateFrom);
				model.addAttribute("DATETO", dateTo);
				model.addAttribute("USAGE_METER_WEEK_LIST", usage_meter_week_list);
				
				model.addAttribute("mainMenu", mainMenu);
				model.addAttribute("subMenu", subMenu);
			}
			
		}
		
		return moveUrl;
	}	
	
	//	�����Ⱓ ��뷮 �� - ���� �м�
	@RequestMapping("/compYear")
	public String bldCompYear(HttpSession session, Model model, 
			@RequestParam(value="mainMenu", defaultValue = "comp") String mainMenu
			,@RequestParam(value="subMenu", defaultValue="year") String subMenu
			, @RequestParam(value="dateTarget", defaultValue="") String dateTarget) throws Exception{
		
		
		String moveUrl = "redirect:../";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");

			if("4".equals(team_type)) {	//	�ǹ�
				
				if("".equals(dateTarget)) {
					dateTarget = new StringUtil().getFullYearYYYY();
					
				}
				
				//	���ǿ��� meter_list �� ������
				HashMap siteInfoBldMap = SessionUtil.getSessionMap(session, "SITE_INFO_BLD");
				
				//	meter_list����  ������ ��ȣ�� ������ �����Ⱓ ��뷮 ȣ��
				List meter_list = (List) siteInfoBldMap.get("meter_list");
				
				//	�����⺰ �����͸� ���� list
				List usage_meter_year_list = new ArrayList();
				
				for(int i=0; i<meter_list.size(); i++) {
					HashMap meterMap = (HashMap) meter_list.get(i);
					String seq_meter = String.valueOf(meterMap.get("seq_meter"));
					
					HashMap usageMeterYear = Apibld.getUsageMeterYear(seq_meter, dateTarget);
					

					usageMeterYear = ApiUtil.dataComma(usageMeterYear);
					
					usageMeterYear.put("seq_meter", seq_meter);	//	���͹�ȣ
					usageMeterYear.put("meter_name", meterMap.get("meter_name"));
					usageMeterYear.put("descr", meterMap.get("descr"));	//	 �ǹ������ڰ� �ο��� ��Ī (�� : ����ⱸ, ������ ��)
					
					//System.out.println(usageMeterYear.toString());
					
					usage_meter_year_list.add(usageMeterYear);
				}
				
				
				
				moveUrl = "bld/comp/year";
				
				model.addAttribute("USAGE_METER_YEAR_LIST", usage_meter_year_list);
				model.addAttribute("DATETARGET", dateTarget);	//	��ȸ��
				
				model.addAttribute("mainMenu", mainMenu);
				model.addAttribute("subMenu", subMenu);
			}
			
		}
		
		return moveUrl;
	}	
	
}