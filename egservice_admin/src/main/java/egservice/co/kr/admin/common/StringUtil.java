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
	 * ����⵵�� ���ϴ� �Լ�	String
	 * ex) 2020
	 * @return
	 */
	public String getFullYearYYYY() {
		return String.valueOf(getFullYearInt()); 
	}
	
	/**
	 * ����⵵�� ���ϴ� �Լ�	int
	 * @return
	 */
	public int getFullYearInt() {
		Calendar cal = Calendar.getInstance();
		return cal.get(cal.YEAR);
	}
	
	
	/**
	 * ���� ���� ���ϴ� �Լ�	
	 * ex) 2�ڸ��̸�, 1~9���ϰ�� 0�� ���� 09
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
	 * ���� ���� ���ϴ� �Լ�
	 * ex) 1��~9���� 1�ڸ� // 10~12���� 2�ڸ�	
	 * @return
	 */
	public String getMonthString() {
		
		return String.valueOf(getMonthInt());
	}
	
	/**
	 * ���� ���� ���ϴ� �Լ�
	 * ex) 1��~9���� 1�ڸ� // 10~12���� 2�ڸ�
	 * @return
	 */
	public int getMonthInt() {
		Calendar cal = Calendar.getInstance();
		int month = cal.get (cal.MONTH) + 1 ;
		return month;
	}
	
	/**
	 * ���� ���� ���ϴ� �Լ�
	 * 1~9�� 1�ڸ�
	 * @return
	 */
	public int getDayInt() {
		Calendar cal = Calendar.getInstance();
		return cal.get(cal.DATE);
	}
	
	/**
	 * ���� ���� ���ϴ� �Լ�
	 * 1~9�� 0�� �ٿ��� 01~09 �̸�, �������� 2�ڸ�
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
	 * 3�ڸ��� �ĸ�
	 */
	private String commaWon(String num) {
        BigDecimal bigDec= new BigDecimal(num);
        DecimalFormat formatter = new DecimalFormat("#,###");
        return formatter.format(bigDec);
	}
	
	//	�Ҽ��� 3�ڸ����� �ݿø�
	String round3(String num) {
		BigDecimal bigDec= new BigDecimal(num);
	    DecimalFormat formatter = new DecimalFormat("0.00");
	    return formatter.format(bigDec);
		
	}
	
	//	�Ҽ��� 3�ڸ����� �ݿø�, 3�ڸ��� �ĸ�
	public String commaRound3(String num) {
		BigDecimal bigDec= new BigDecimal(num);
	    DecimalFormat formatter = new DecimalFormat("#,##0.00");
	    return formatter.format(bigDec);
	}

	//	�Ҽ��� 1�ڸ����� �ݿø�, 3�ڸ��� �ĸ�
	public String commaRound1(String num) {
		BigDecimal bigDec= new BigDecimal(num);
	    DecimalFormat formatter = new DecimalFormat("#,##0");
	    return formatter.format(bigDec);
	}
	
	/**
	 * 01�� ~ 24��
	 * @return
	 */
	public ArrayList getSelectTimeList() {
		ArrayList list = new ArrayList();

		for(int i=1; i<=24; i++){
			HashMap map = new HashMap();
			
			String time = i < 10 ? "0"+(i) : (i)+ "";
			String time_str = time + " ��";
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