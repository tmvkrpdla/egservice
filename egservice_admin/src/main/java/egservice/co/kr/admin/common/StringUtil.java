package egservice.co.kr.admin.common;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

public class StringUtil {
	
	
	
	
	/**
	 * 현재년도를 구하는 함수	String
	 * ex) 2020
	 * @return
	 */
	public String getFullYearYYYY() {
		return String.valueOf(getFullYearInt()); 
	}
	
	/**
	 * 현재년도를 구하는 함수	int
	 * @return
	 */
	public int getFullYearInt() {
		Calendar cal = Calendar.getInstance();
		return cal.get(cal.YEAR);
	}
	
	
	/**
	 * 현재 달을 구하는 함수	
	 * ex) 2자리이며, 1~9월일경우 0을 붙임 09
	 * @return
	 */
	public String getMonthMM() {
		int month = getMonthInt();
		String temp = "";
		
		if(month<10) {
			temp = "0"+month;
		}else {
			temp = ""+month;
		}
		
		return temp;
	}
	
	
	/**
	 * 현재 달을 구하는 함수
	 * ex) 1월~9월은 1자리 // 10~12월은 2자리	
	 * @return
	 */
	public String getMonthString() {
		
		return String.valueOf(getMonthInt());
	}
	
	/**
	 * 현재 달을 구하는 함수
	 * ex) 1월~9월은 1자리 // 10~12월은 2자리
	 * @return
	 */
	public int getMonthInt() {
		Calendar cal = Calendar.getInstance();
		int month = cal.get (cal.MONTH) + 1 ;
		return month;
	}
	
	/**
	 * 현재 일을 구하는 함수
	 * 1~9는 1자리
	 * @return
	 */
	public int getDayInt() {
		Calendar cal = Calendar.getInstance();
		return cal.get(cal.DATE);
	}
	
	/**
	 * 현재 일을 구하는 함수
	 * 1~9는 0을 붙여서 01~09 이며, 나머지는 2자리
	 * @return
	 */
	public String getDayDD() {
		int date = getDayInt();
		String temp = "";
		if(date<10) {
			temp = "0"+date;
		}else {
			temp = ""+date;
		}
		return temp;
	}
	
	/**
	 * 3자리수 컴마
	 */
	private String commaWon(String num) {
        BigDecimal bigDec= new BigDecimal(num);
        DecimalFormat formatter = new DecimalFormat("#,###");
        return formatter.format(bigDec);
	}
	
	//	소수점 3자리에서 반올림
	String round3(String num) {
		BigDecimal bigDec= new BigDecimal(num);
	    DecimalFormat formatter = new DecimalFormat("0.00");
	    return formatter.format(bigDec);
		
	}
	
	//	소수점 3자리에서 반올림, 3자리수 컴마
	public String commaRound3(String num) {
		BigDecimal bigDec= new BigDecimal(num);
	    DecimalFormat formatter = new DecimalFormat("#,##0.00");
	    return formatter.format(bigDec);
	}

	//	소수점 1자리에서 반올림, 3자리수 컴마
	public String commaRound1(String num) {
		BigDecimal bigDec= new BigDecimal(num);
	    DecimalFormat formatter = new DecimalFormat("#,##0");
	    return formatter.format(bigDec);
	}
	
	/**
	 * 01시 ~ 24시
	 * @return
	 */
	public ArrayList getSelectTimeList() {
		ArrayList list = new ArrayList();

		for(int i=1; i<=24; i++){
			HashMap map = new HashMap();
			
			String time = i < 10 ? "0"+(i) : (i)+ "";
			String time_str = time + " 시";
			map.put("time", time);
			map.put("time_str", time_str);
			list.add(map);
		}
		
		return list;
	}
	
	/**
	 * 5% ~ 100%
	 * @return
	 */
	public ArrayList getSelectPerList() {

		ArrayList list = new ArrayList();
		
		for(int i=1; i<=100; i++){
			HashMap map = new HashMap();
			String per = "" + i;
			String per_str = i + " %";
			map.put("per", per);
			map.put("per_str", per_str);
			list.add(map);
		}
		
		return list;
	}
	
	public String getYesterDay() {
		Calendar cal = new GregorianCalendar(Locale.KOREA);
	
		cal.add(Calendar.DAY_OF_MONTH, -1);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(cal.getTime());
		
	}
	
	/*
	 * public List getStdRefDataFmt(List list) { for(int i=0; i<list.size(); i++) {
	 * HashMap map = list.get(i); }
	 * 
	 * return list; }
	 */
	
};
