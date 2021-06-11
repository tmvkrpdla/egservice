package egservice.co.kr.admin.common;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.ILoggerFactory;
import org.slf4j.LoggerFactory;

import ch.qos.logback.classic.Logger;
import egservice.co.kr.admin.bld.controller.BldController;

public class ApiUtil {
	
	private static final Logger logger = (Logger) LoggerFactory.getLogger(Api.class);
	
	/**
	 * round_usage = ��Ʈ�� 0000.00
	 * text_usage = ���̺��� 1,234.00
	 * @param hashMap
	 * @return
	 */
	public static HashMap dataComma(HashMap hashMap) {
		
		HashMap returnMap = new HashMap();
		List returnList = new ArrayList();
		
		List list_usage = (List) hashMap.get("list_usage");
		
		StringUtil stringUtil = new StringUtil();
		
		double max_usage = 0;
		double min_usage = 0;
				
		for(int i=0; i<list_usage.size(); i++) {
			
			
			
			
			HashMap tempMap = (HashMap)list_usage.get(i);
			
			String round_usage = "";
			String text_usage = "";
			
			if(tempMap.get("usage") == null) {	// ���� null �ΰ�� �����͸� ó������ ����
				//System.out.println(tempMap.get("usage"));
				
				round_usage = null;
				text_usage = null;
				
			}else {
				
				double usage =  (double) tempMap.get("usage");
				round_usage = stringUtil.round3(String.valueOf(usage));
				text_usage = stringUtil.commaRound3(String.valueOf(usage));
				
				
				//	�ʱ�ȭ
				if(i == 0) {
					max_usage = Double.parseDouble(round_usage);
					min_usage = Double.parseDouble(round_usage);
				}
				
				
				//	�ִ밪
				if( Double.parseDouble(round_usage) > max_usage) {
					max_usage = Double.parseDouble(round_usage);
				}		
				
				//	�ּҰ�
				if( Double.parseDouble(round_usage) < min_usage) {
					min_usage = Double.parseDouble(round_usage);
				}
				
			}
			
			tempMap.put("round_usage", round_usage);	//	�Ҽ��� 3�ڸ� �ݿø� 0.00
			tempMap.put("text_usage", text_usage);
			
			//	��ü
			returnList.add(tempMap);
		}
		
		returnMap.put("min_round_usage", stringUtil.round3(String.valueOf(min_usage)));
		returnMap.put("max_round_usage", stringUtil.round3(String.valueOf(max_usage)));
		returnMap.put("max_usage", max_usage);
		returnMap.put("list_usage", returnList);
		//logger.info(returnMap.toString());
		return returnMap;
	}
	
	public static String isHolidayText(int num) {
		String str = "";
		
		if(1 == num) {
			str = "�޹���";
		}else if(0 == num)  {
			str = "�ٹ���";
		}else {
			str = "-";
		}
		
		return str;
	}
	
	public static String dayOfWeekText (int num) {
		String str = "";
		
		switch (num) {
	    	case 1: 
	    		str = "��";
	    		break;
	    	case 2: 
	    		str = "��";
	    		break;
	    	case 3 :
	    		str = "ȭ";
	    		break;
	    	case 4 : 
	    		str = "��";
	    		break;
	    	case 5 : 
	    		str = "��";
	    		break;
	    	case 6 : 
	    		str = "��";
	    		break;
	    	case 7 : 
	    		str = "��";
	    		break;
	    	
	    	case -1 :
	    		str = "";
	    		break;
		}
		
		return str;
	}
		
	public static String weatherCodeText (int num) {
		String str = "";
		
		switch (num) {
			case -1 :
				str = "";
				break;
			case 1 : 
				//str = "����";
				//str = "<img src =${pageContext.request.contextPath}/resources/images/img_sun.png style='width:20px;'>";
				str = "/resources/images/img_sun.png";
				break;
			case 2 :
				//str = "�帲";
				//str = "<img src =${pageContext.request.contextPath}/resources/images/img_cloud.png style='width:20px;'>";
				str = "/resources/images/img_cloud.png";
				break;
				
			case 3 :
				//str = "��";
				//str = "<img src =${pageContext.request.contextPath}/resources/images/img_rain.png style='width:20px;'>";
				str = "/resources/images/img_rain.png";
				break;
			case 4 :
				//str = "��";
				//str = "<img src =${pageContext.request.contextPath}/resources/images/img_snow.png style='width:20px;'>";
				str = "/resources/images/img_snow.png";
				break;
		} 
		
		return str;
	}
	
	
	public static HashMap getMapWeather(HashMap weatherMap) {
		
		int isHoliday;
		int dayOfWeek;
		int weatherCode;
	
		
		if(weatherMap.containsKey("is_holiday")) {
			isHoliday = (Integer) weatherMap.get("is_holiday");	//	�ٹ������� �޹�������..
			
			weatherMap.put("text_is_holiday", isHolidayText(isHoliday));
		}
		
		if(weatherMap.containsKey("day_of_week")) {
			dayOfWeek = (Integer) weatherMap.get("day_of_week");	//	���� ��������
			weatherMap.put("text_day_of_week", dayOfWeekText(dayOfWeek));
		}
		
		if(weatherMap.containsKey("weather_code")) {
			weatherCode = (Integer) weatherMap.get("weather_code");	//	����
			weatherMap.put("text_weather_code", weatherCodeText(weatherCode));
		}
		
		
		
		
		
		
		
		return weatherMap;
	}
	
	public static List getListWeather(List listWeather) {
		List returnList = new ArrayList();
		
		for(int i=0; i<listWeather.size(); i++) {
			HashMap weatherMap = (HashMap) listWeather.get(i);
			
			weatherMap = getMapWeather(weatherMap);
			
			returnList.add(weatherMap);
			
		}
		
		return returnList;
	} 
	
	/*	unit 1~7 -> �� ~ �� �ؽ�Ʈ �߰�
	 * 
	 */
	public static HashMap getListUsageWeek(HashMap map) {
		
		//	������ ��ü�� ���� �ʰ� ����Ʈ
		HashMap returnMap = new HashMap();
		List returnList = new ArrayList();
		
		List list = (List) map.get("list_usage");
		
		
		for(int i=0; i<list.size(); i++) {
			HashMap usageMap = (HashMap) list.get(i);
			
			
			String text_unit = dayOfWeekText((Integer)usageMap.get("unit"));
			
			usageMap.put("text_unit", text_unit);
			
			returnList.add(usageMap);
			
		}
		
		returnMap.put("list_usage", returnList);
		
		return returnMap;
	}
	
	/*	��뷮, �۳���, �½ǰ��� ��뷮  ��� */
	@SuppressWarnings("deprecation")
	public static HashMap usageCalc(HashMap dataMap) {
		//HashMap tempMap = dataMap;
		System.out.println(dataMap.toString());
		
		BigDecimal fromYear = new BigDecimal( String.valueOf(dataMap.get("total_kwh_from_year")));
		BigDecimal fromMonth = new BigDecimal( String.valueOf(dataMap.get("total_kwh_from_month")));
		BigDecimal fromDay = new BigDecimal( String.valueOf(dataMap.get("total_kwh_from_day")));
		
		BigDecimal prevYear = new BigDecimal( String.valueOf(dataMap.get("total_kwh_from_year_prev_year")));
		BigDecimal prevMonth = new BigDecimal( String.valueOf(dataMap.get("total_kwh_from_month_prev_year")));
		BigDecimal prevDay = new BigDecimal( String.valueOf(dataMap.get("total_kwh_from_day_prev_year")));
		
		BigDecimal compareYear = fromYear.subtract(prevYear);		//	�۳��� �̹����� ��뷮
		BigDecimal compareMonth = fromMonth.subtract(prevMonth);	//	�۳��� �̹��� ��뷮
		BigDecimal compareDay = fromDay.subtract(prevDay).abs();	//	�۳��� ���� ��뷮
		
		
		//	������ ��. 0���� ũ�� 1, 0���� ������ -1, 0�� ������ 0
		int compareToDay = compareDay.compareTo(new BigDecimal("0"));
		int compareToMonth = compareMonth.compareTo(new BigDecimal("0"));
		int compareToYear = compareYear.compareTo(new BigDecimal("0"));
		
		
		//	1000
		BigDecimal unit = new BigDecimal("1000");
		
		//	�½ǰ���
		BigDecimal gas = new BigDecimal("0.46625");
		
		BigDecimal dayGas = compareDay.multiply(gas);		//	�� �½� ���� ������
		dayGas = dayGas.setScale(2, BigDecimal.ROUND_DOWN).abs();
		
		BigDecimal monthGas = compareMonth.multiply(gas);	//	�� �½� ���� ������
		monthGas = monthGas.divide(unit);					//	���� ���� ton
		monthGas = monthGas.setScale(2, BigDecimal.ROUND_DOWN).abs();
		
		BigDecimal yearGas = compareYear.multiply(gas);		//	�� �½ǰ���
		yearGas = yearGas.divide(unit);						//	���� ���� ton
		yearGas = yearGas.setScale(2, BigDecimal.ROUND_DOWN).abs();
		
		
		compareYear = compareYear.divide(unit); //	  �۳��� �̹����� ��뷮 kWh- MWh
		compareYear = compareYear.setScale(2,BigDecimal.ROUND_DOWN).abs();	// �۳��� �̹����� ��뷮		
		compareMonth = compareMonth.setScale(2, BigDecimal.ROUND_DOWN).abs();//	�۳��� �̹��� ��뷮
		compareDay = compareDay.setScale(2, BigDecimal.ROUND_DOWN).abs();	//	�۳��� ���� ��뷮
		
		fromYear = fromYear.divide(unit);	//	�̹��⵵ ��뷮 ���� ���� kWh- MWh
		fromYear = fromYear.setScale(2,BigDecimal.ROUND_DOWN).abs();
		fromMonth = fromMonth.setScale(2, BigDecimal.ROUND_DOWN).abs();
		fromDay = fromDay.setScale(2, BigDecimal.ROUND_DOWN).abs();		
		
		dataMap.put("compare_to_day", compareToDay);
		dataMap.put("compare_to_month", compareToMonth);
		dataMap.put("compare_to_year", compareToYear);
		
		
		dataMap.put("from_year", fromYear);
		dataMap.put("from_month", fromMonth);
		dataMap.put("from_day", fromDay);
		
		dataMap.put("compare_year", compareYear);
		dataMap.put("compare_month", compareMonth);
		dataMap.put("compare_day", compareDay);
		
		dataMap.put("day_gas", dayGas);
		dataMap.put("month_gas", monthGas);
		dataMap.put("year_gas", yearGas);
		return dataMap;
	}

	//	�����⺰ ��뷮 �м� -> �ְ� �� �м� ������ ����
	public static HashMap meterUsageWeekly(HashMap dataMap) {
		HashMap returnMap = new HashMap();
		ArrayList returnList = new ArrayList();
		
		ArrayList listUsage = (ArrayList) dataMap.get("list_usage");
		StringUtil stringUtil = new StringUtil();
		
		
		
		for(int i=0; i<listUsage.size(); i++) {
			HashMap weekMap = (HashMap) listUsage.get(i);
			
			int week_of_year = (Integer)weekMap.get("week_of_year");
			String text_week_of_year = "�� " + (week_of_year+1); 
			
			weekMap.put("text_week_of_year", text_week_of_year);
			
			
			ArrayList week = (ArrayList) weekMap.get("week");
			
			for(int j=0; j<week.size(); j++) {
				HashMap tempMap = (HashMap) week.get(j);
				
				String round_usage = null;
				String text_usage = null;
				
				if(tempMap.get("usage") != null) {
					round_usage = stringUtil.round3(String.valueOf(tempMap.get("usage")));
					text_usage = stringUtil.commaRound3(String.valueOf(tempMap.get("usage")));
					
				}
				
				tempMap.put("round_usage", round_usage);
				tempMap.put("text_usage", text_usage);
				tempMap.put("text_day_of_week", dayOfWeekText((Integer)tempMap.get("day_of_week")));
			}
			

			returnList.add(weekMap);
		}
		
		
		returnMap.put("list_usage", returnList);
		
		
		return returnMap;
	}

	
	public static String getWeekOfYear (int data) {
		String str = "";
		
		switch (data) {
			case 0 :
				str = "1����";
				break;
			case 1 :
				str = "2����";
				break;
			case 2 :
				str = "3����";
				break;
			case 3 :
				str = "4����";
				break;
			case 4 :
				str = "5����";
				break;
		}
		
		return str;
	}

	public static HashMap getUsageList(HashMap usageListMap) {
		StringUtil strUtil = new StringUtil();
		String text_won_avg = strUtil.commaRound1(String.valueOf(usageListMap.get("won_avg")));
		String text_kwh_avg = strUtil.commaRound3(String.valueOf(usageListMap.get("kwh_avg")));
		
		ArrayList list_usage = (ArrayList) usageListMap.get("list_usage");
		
		for(int i=0; i<list_usage.size(); i++) {
			HashMap dataMap = (HashMap) list_usage.get(i);
			String text_kwh = strUtil.commaRound3(String.valueOf(dataMap.get("kwh")));
			String text_won = strUtil.commaRound1(String.valueOf(dataMap.get("won")));
			
			String text_kwh_delta = strUtil.commaRound3(String.valueOf(dataMap.get("kwh_delta")));	//	���� ����
			String text_won_delta = strUtil.commaRound1(String.valueOf(dataMap.get("won_delta")));	//	���� ����
			
			dataMap.put("text_kwh", text_kwh);
			dataMap.put("text_won", text_won);
			dataMap.put("text_kwh_delta", text_kwh_delta);
			dataMap.put("text_won_delta", text_won_delta);
		}
		
		
		usageListMap.put("text_won_avg", text_won_avg);
		usageListMap.put("text_kwh_avg", text_kwh_avg);
		return usageListMap;
	}

	

}