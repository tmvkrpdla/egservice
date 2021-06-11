package egservice.co.kr.admin.common;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.net.URL;
import java.util.HashMap;

import javax.net.ssl.HttpsURLConnection;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 
 * @author 
 * 2020.05.14
 *
 */
public class Api {

	private static final String apiUrl = "https://www.egservice.co.kr:3187/api";
	
	/**
	 * �α���
	 * @param Id
	 * @param Password
	 * @return
	 * @throws Exception
	 */
	public static HashMap<String, Object> checkAdminLogin(String Id, String Password) throws Exception{

		String targetUrl = apiUrl + "/CheckAdminLogin";
		String parameters = "AdminId=" + Id;
		parameters += "&Password=" + Password;
		
		
		return sendPost(targetUrl, parameters);
	};
	
	/**
	 * ������� ������ �������� �Լ�
	 * @param SeqAdmin
	 * @return
	 * @throws Exception
	 */
	public static final HashMap<String, Object> getAdminInfo(String SeqAdmin) throws Exception{

		String targetUrl = apiUrl + "/GetAdminInfo";
		String parameters = "SeqAdmin=" + SeqAdmin;
		
		
		return sendPost(targetUrl, parameters);
	};
	
	/**
	 * ���� ���� API ȣ��
	 * @param AreaCode
	 * @return
	 * @throws Exception
	 * 
	 	"is_holiday": 0,
    	"weather_code": 3,
    	"temp": 1.3161976316855384
	 */
	public static final HashMap<String, Object> getWeatherCurrent(String AreaCode) throws Exception{

		String targetUrl = apiUrl + "/GetWeatherCurrent";
		String parameters = "AreaCode=" + AreaCode;
		
		
		return sendPost(targetUrl, parameters);
	};
	
	
	/**
		������ ��¥�� ����, �޹��� ����, ���� ����
		DateTarget : ������¥(20200625 ����)
		
		is_holiday : 1 �޹���, 0 �ٹ���
		day_of_week : 1= �Ͽ���, 7 �����
		weather_code : -1 = ��, 1=����, 2=�帲, 3=��, 4=��

	 * @param DateTarget
	 * @return
	 * @throws Exception
	 */
	public static final HashMap<String, Object> getWeatherDay(String DateTarget) throws Exception{
		String targetUrl = apiUrl + "/GetWeatherDay";
		String parameters = "DateTarget=" + DateTarget;
		
		return sendPost(targetUrl, parameters);
	}
	

	public static final HashMap<String, Object> getWeatherMonth (String MonthTarget) throws Exception{
		String targetUrl = apiUrl + "/GetWeatherMonth";
		String parameters = "MonthTarget=" + MonthTarget;
		
		return sendPost(targetUrl, parameters);
		
	} 
	
	public static final HashMap<String, Object> getWeather(String DateFrom , String DateTo ) throws Exception{
		String targetUrl = apiUrl + "/GetWeather";
		String parameters = "DateFrom=" + DateFrom;
		parameters += "&DateTo=" + DateTo;
		
		return sendPost(targetUrl, parameters);
		
	}
	
	/**
	 * ������¥�� Site�� �ð��뺰 ��뷮
	 * SeqSite : Site�� Seq ��ȣ
Year : 2020
Month : 6
Day : 17

	 * @param SeqSite
	 * @param Year
	 * @param Month
	 * @param Day
	 * @return
	 * is_holiday : 1=�޹���, 0=�ٹ���
		[list_usage]
		unit : 0 ~ 23 
		usage : ��뷮 (kWh)

	 * @throws Exception
	 */
	public static final HashMap<String, Object> getUsageSiteDay(String SeqSite, String Year, String Month, String Day) throws Exception{
		String targetUrl = apiUrl + "/GetUsageSiteDay";
		String parameters = "SeqSite=" + SeqSite;
		parameters += "&Year=" + Year;
		parameters += "&Month=" + Month;
		parameters += "&Day=" + Day;
		
		return sendPost(targetUrl, parameters); 
	}
	

	public static final HashMap<String, Object> getUsageSiteMonth(String SeqSite, String Year, String Month) throws Exception{
		String targetUrl = apiUrl + "/GetUsageSiteMonth";
		String parameters = "SeqSite=" + SeqSite;
		parameters += "&Year=" + Year;
		parameters += "&Month=" + Month;
		
		return sendPost(targetUrl, parameters); 
	}

	public static final HashMap<String, Object> getUsageSiteWeek (String SeqSite, String YearFrom,  String MonthFrom, String DayFrom, String YearTo, String MonthTo, String DayTo) throws Exception{
		String targetUrl = apiUrl + "/GetUsageSiteWeek";
		
		String parameters = "SeqSite=" + SeqSite;
		parameters += "&YearFrom=" + YearFrom;
		parameters += "&MonthFrom=" + MonthFrom;
		parameters += "&DayFrom=" + DayFrom;
		
		parameters += "&YearTo=" + YearTo;
		parameters += "&MonthTo=" + MonthTo;
		parameters += "&DayTo=" + DayTo;

		
		return sendPost(targetUrl, parameters);
	}
	
	/**
	 * �����⵵�� Site�� ���� ��뷮
	 * @param SeqSite
	 * @param Year
	 * @return
	 * @throws Exception
	 */
	public static final HashMap<String, Object> getUsageSiteYear(String SeqSite, String Year) throws Exception{
		String targetUrl = apiUrl + "/GetUsageSiteYear";
		String parameters = "SeqSite=" + SeqSite;
		parameters += "&Year=" + Year;
		
		
		return sendPost(targetUrl, parameters); 
	}
	
	
	/**
	 * �ǹ��� ������ ������
	 * @param SeqSite
	 * @return
	 * @throws Exception
	 	seq_site : ���� Seq ��ȣ
		site_type : 1=����Ʈ����, 2=�ǹ�
		name : 
		address :
		dx : �浵
		dy : ����
		kw_contracted : �ǹ� �������
		read_day : ���� ��ħ��
		built_year : �ϰ� �⵵
		built_month : �ϰ� ��
		home_page : �ǹ� Ȩ������
		area : �ǹ� ����
		floor_info : �ǹ� �� ���� (�� : ������1��, ����4����)
		
		[meter_list]
		seq_meter :
		mid : ���� ID
		mac_address :
		maker : ������
		model : ���ͱ� �𵨸�
		meter_name : �ǹ������ڰ� �ο��� ��Ī
		descr : �ǹ������ڰ� �ο��� ��Ī (�� : ����ⱸ, ������ ��)
		floor_installed : ��ġ�� ����, -1�� ����1��

	 */
	public static HashMap<String, Object> getSiteInfoBld(String SeqSite) throws Exception{
		String targetUrl = apiUrl + "/GetSiteInfoBld";
		
		String parameters = "SeqSite=" + SeqSite ;
		
		return sendPost(targetUrl, parameters);
	} 
	
	
	/**
	 * ������¥�� ���� ���ͱ��� �ð��뺰 ��뷮
	 * @param SeqSite
	 * @return
	 * @throws Exception
	 */
	public static HashMap<String, Object> getUsageMeterDay(String SeqMeter, String Year, String Month, String Day) throws Exception{
		
		String targetUrl = apiUrl + "/GetUsageMeterDay";
		
		String parameters = "SeqMeter=" + SeqMeter ;
		parameters += "&Year=" + Year;
		parameters += "&Month=" + Month;
		parameters += "&Day=" + Day;
		
		return sendPost(targetUrl, parameters);
		
	}
	
	
	
	public static HashMap<String, Object> getUsageMeterMonth(String SeqMeter, String Year, String Month) throws Exception{
		
		String targetUrl = apiUrl + "/GetUsageMeterMonth";
		
		String parameters = "SeqMeter=" + SeqMeter ;
		parameters += "&Year=" + Year;
		parameters += "&Month=" + Month;
		
		
		return sendPost(targetUrl, parameters);
		
	}
	
	public static HashMap<String, Object> getUsageMeterWeek(String SeqMeter, String YearFrom, String MonthFrom, String DayFrom, String YearTo, String MonthTo, String DayTo) throws Exception{
		
		String targetUrl = apiUrl + "/GetUsageMeterWeek";
		
		String parameters = "SeqMeter=" + SeqMeter ;
		parameters += "&YearFrom=" + YearFrom;
		parameters += "&MonthFrom=" + MonthFrom;
		parameters += "&DayFrom=" + DayFrom;
		
		parameters += "&YearTo=" + YearTo;
		parameters += "&MonthTo=" + MonthTo;
		parameters += "&DayTo=" + DayTo;

		
		return sendPost(targetUrl, parameters);
		
	}
	
	
	public static HashMap<String, Object> getUsageMeterYear(String SeqMeter, String Year) throws Exception{
		
		String targetUrl = apiUrl + "/GetUsageMeterYear";
		
		String parameters = "SeqMeter=" + SeqMeter ;
		parameters += "&Year=" + Year;
		
		
		
		return sendPost(targetUrl, parameters);
		
	}
	
	/////////////////////////////////////////////////////////////////////////////////
	
	//	�����⺰ ��뷮 �м� - �ְ� �� �м�
	public static HashMap<String, Object> getMeterUsageWeeklyComparison(String Mid, String YearFrom, String MonthFrom, String DayFrom, String YearTo, String MonthTo, String DayTo) throws Exception{
		
		String targetUrl = apiUrl + "/GetMeterUsageWeeklyComparison";
		
		String parameters = "Mid=" + Mid ;
		parameters += "&YearFrom=" + YearFrom;
		parameters += "&MonthFrom=" + MonthFrom;
		parameters += "&DayFrom=" + DayFrom;
		
		parameters += "&YearTo=" + YearTo;
		parameters += "&MonthTo=" + MonthTo;
		parameters += "&DayTo=" + DayTo;

		
		return sendPost(targetUrl, parameters);
		
	}
	////////////////////////////////////////////////////////////////////
	/**
	 * ���� ���� ��� ����Ʈ
	 * @param SeqSite
	 * @param IndexFrom
	 * @param IndexTo
	 * @return
	 * @throws Exception
	 */
	public static HashMap<String, Object> getSaveRefListForPaging(String SeqSite, int IndexFrom, int IndexTo) throws Exception{
		String targetUrl = apiUrl + "/GetSaveRefListForPaging";
		String parameters = "SeqSite=" + SeqSite;
		parameters += "&IndexFrom="+ IndexFrom;
		parameters += "&IndexTo="+ IndexTo;
		
		
		return sendPost(targetUrl, parameters);
	}
	
	/**
	 * ���� ���� ��� �� ����
	 * @param SeqSite
	 * @return
	 * @throws Exception
	 */
	public static HashMap<String, Object> getSaveRefCount(String SeqSite) throws Exception{
		String targetUrl = apiUrl + "/GetSaveRefCount";
		String parameters = "SeqSite=" + SeqSite;
		
		
		return sendPost(targetUrl, parameters);
	}
	
	/**
	 * ���� ���� ������ ����
	 * @param SeqSite
	 * @return
	 * @throws Exception
	 */
	public static HashMap<String, Object> createSavePlan(String SeqSite) throws Exception{
		String targetUrl = apiUrl + "/CreateSavePlan";
		String parameters = "SeqSite=" + SeqSite;
		
		
		return sendPost(targetUrl, parameters);
	}


	/**
	 * ���� �������� ������ȹ seq�� ������
	 * @param SeqSite
	 * @return
	 * @throws Exception
	 */
	public static HashMap<String, Object> getActiveSavePlan(String SeqSite) throws Exception{
		String targetUrl = apiUrl + "/GetActiveSavePlan";
		String parameters = "SeqSite=" + SeqSite;
		
		
		return sendPost(targetUrl, parameters);
	}
	
	
	/**
	 * �ϰ� ���� ���� ��ȸ
	 * @param SeqSavePlan
	 * @param DateTarget
	 * @return
	 * @throws Exception
	 */
	public static HashMap<String, Object> getSaveResultDaily(String SeqSavePlan, String DateTarget) throws Exception{
		String targetUrl = apiUrl + "/GetSaveResultDaily";
		String parameters = "SeqSavePlan=" + SeqSavePlan;
		parameters += "&DateTarget="+ DateTarget;
		
		return sendPost(targetUrl, parameters);
	}
	
	/**
	 * �������� �� ���� ��ȸ
	 * @param SeqSaveRef
	 * @return
	 * @throws Exception
	 */
	public static HashMap<String, Object> getSaveRefInfo(String SeqSaveRef ) throws Exception{
		String targetUrl = apiUrl + "/GetSaveRefInfo";
		String parameters = "SeqSaveRef=" + SeqSaveRef;
		
		
		return sendPost(targetUrl, parameters);
	}
	
	/**
	 * ������ȹ ��ü ����
	 * @param SeqSite
	 * @return
	 * @throws Exception
	 */
	public static HashMap<String, Object> getSavePlanCount(String SeqSite ) throws Exception{
		String targetUrl = apiUrl + "/GetSavePlanCount";
		String parameters = "SeqSite=" + SeqSite;
		
		
		return sendPost(targetUrl, parameters);
	}
	
	/**
	 * ������ ó���� ���� ������ȹ ���
	 * @param SeqSite
	 * @param IndexFrom
	 * @param IndexTo
	 * @return
	 * @throws Exception
	 */
	public static HashMap<String, Object> getSavePlanListForPaging(String SeqSite, int IndexFrom , int  IndexTo) throws Exception{
		String targetUrl = apiUrl + "/GetSavePlanListForPaging";
		String parameters = "SeqSite=" + SeqSite;
		parameters += "&IndexFrom=" + IndexFrom;
		parameters += "&IndexTo=" + IndexTo;
		
		return sendPost(targetUrl, parameters);
	}
	
	/**
	 * �Ⱓ�� ���� ���� ��ȸ 
	 * �����⺰ ���� ����
	 * @param SeqSavePlan
	 * @param DateFrom
	 * @param DateTo
	 * @return
	 * @throws Exception
	 */
	public static HashMap<String, Object> getSaveResult(String SeqSavePlan, String DateFrom, String DateTo ) throws Exception{
		String targetUrl = apiUrl + "/GetSaveResult";
		String parameters = "SeqSavePlan=" + SeqSavePlan;
		parameters += "&DateFrom="+ DateFrom;
		parameters += "&DateTo="+ DateTo;
		
		return sendPost(targetUrl, parameters);
	}
	
	//////////////////////////////////////////////////////////////////////////////////
	
		
	/**
	 * ������� ���� ��뷮�� �������� �Լ�
	 * @param SeqAdmin
	 * @return
	 * @throws Exception
	 */
	public static HashMap<String, Object> getAdminUsageCurrent(String SeqAdmin) throws Exception{

		String targetUrl = apiUrl + "/GetAdminUsageCurrent";
		String parameters = "SeqAdmin=" + SeqAdmin;
		
		
		return sendPost(targetUrl, parameters);
	}; 
	
	/**
	 *  SeqAdmin (�ǹ������� Seq / �������� ���� ���� �Ǵܿ�), TimeCreatedMax (������ �ð� ������ �������� �� = 20191013162045),
	 *  CountNotice (������ �������� �ִ� ����)
	 * �ǹ� �������� ����
	 * @param SeqAdmin
	 * @param timeCreatedMax
	 * @param CountNotice
	 * @return
	 * @throws Exception
	 */
	public static HashMap<String, Object> getBldNoticeList(String SeqAdmin, String TimeCreatedMax, int CountNotice) throws Exception{

		String targetUrl = apiUrl + "/GetBldNoticeList";
		String parameters = "SeqAdmin=" + SeqAdmin +"&TimeCreatedMax="+TimeCreatedMax +"&CountNotice="+String.valueOf(CountNotice);
		
		
		return sendPost(targetUrl, parameters);
	}; 
	
	/**
	 * 
	 * @param TimeCreatedMax
	 * @param CountNotice
	 * @return
	 * @throws Exception
	 */
	public static HashMap<String, Object> getAdminNoticeList(String TimeCreatedMax, int CountNotice) throws Exception{

		String targetUrl = apiUrl + "/GetAdminNoticeList";
		String parameters = "TimeCreatedMax="+TimeCreatedMax +"&CountNotice="+String.valueOf(CountNotice);
		
		
		return sendPost(targetUrl, parameters);
	}; 
	
	/**
	 * �������� �����.
	SeqAdmin (�ۼ��� Seq), Top (0=�Ϲݰ���, 1=��ܰ��� ����), WriterType (�ۼ��ڱ��� : 1=����Ʈ������, 2=���ʳ�, 3=��û������), 
	TargetType (���Ŵ�� : 1=����Ʈ�ֹ�, 2=����Ʈ������, 3=�ǹ�������, 4=��û������), Title (����), Content (����)
	result_code : 0=����, 1=����
	seq_notice_inserted : ������ �������� Seq ��ȣ
	 * @return
	 * @throws Exception
	 */
	
	public static HashMap<String, Object> createNotice(String SeqAdmin, String Top, String WriterType, String TargetType,
			String Title, String Content) throws Exception{
		// TODO Auto-generated method stub
		String targetUrl = apiUrl + "/CreateNotice";
		
		
		String parameters = "SeqAdmin=" + SeqAdmin +"&Top="+Top +"&WriterType="+WriterType +
				"&TargetType="+TargetType+"&Title="+Title+"&Content="+Content;
		
		return sendPost(targetUrl, parameters);
	}
	
	/**
	 * �������� ����
	 * @param TargetType
	 * @return
	 * @throws Exception
	 */
	public static HashMap<String, Object> getNoticeCount(String TargetType) throws Exception {
		// TODO Auto-generated method stub
		
		String targetUrl = apiUrl + "/GetNoticeCount";
		
		String parameters = "TargetType=" + TargetType ;
		
		return sendPost(targetUrl, parameters);
		
	}
	
	
	/**
	 * �������� ���� ǥ��
	 * @param SeqAdmin
	 * @param SeqNoticeList
	 * @return
	 * @throws Exception
	 */
	public static HashMap<String, Object> setBldNoticeListAsRead(String SeqAdmin, String SeqNoticeList) throws Exception{
		String targetUrl = apiUrl + "/SetBldNoticeListAsRead";
		
		String parameters = "SeqAdmin=" + SeqAdmin ;
		
		parameters += "&SeqNoticeList=" + SeqNoticeList;
		
		return sendPost(targetUrl, parameters);
	}
	
	/**
	 * �������� ����¡
	 * @param SeqMember
	 * @param TargetType
	 * @param IndexFrom
	 * @param IndexTo
	 * @return
	 * @throws Exception
	 */
	public static HashMap<String, Object> getNoticeListForPaging(String SeqMember, String TargetType, int IndexFrom, int IndexTo) throws Exception{
		String targetUrl = apiUrl + "/GetNoticeListForPaging";
		
		String parameters = "SeqMember=" + SeqMember ;
		parameters += "&TargetType=" + TargetType;
		parameters += "&IndexFrom=" + IndexFrom;
		parameters += "&IndexTo=" + IndexTo;
		
		
		return sendPost(targetUrl, parameters);
	}
	
	/**
	 * �������� ����
	 * @param SeqNotice
	 * @param SeqAdmin
	 * @return
	 * @throws Exception
	 */
	public static HashMap deleteNotice(String SeqNotice, String SeqAdmin) throws Exception{
		String targetUrl = apiUrl + "/DeleteNotice";
		String parameters = "SeqNotice=" + SeqNotice;
		parameters += "&SeqAdmin=" + SeqAdmin;
		return sendPost(targetUrl, parameters);
	}
	
	
	
	/**
	 * admin������ ����Ʈ
	 * @param SeqSite
	 * @return
	 * @throws Exception
	 */
	public static HashMap<String, Object> getTeamAdminList(String SeqSite) throws Exception{
		String targetUrl = apiUrl + "/GetTeamAdminList";
		
		String parameters = "SeqSite=" + SeqSite ;
		
		return sendPost(targetUrl, parameters);
	} 
//	=============================================================================================
	
	/**
	 * ����Ʈ ���� �ֹ� ����
	 * @param SeqSite
	 * @return
	 * @throws Exception
	 */
	public static HashMap getSiteMemberList(String SeqSite) throws Exception{
		String targetUrl = apiUrl + "/GetSiteMemberList";
		String parameters = "SeqSite=" + SeqSite ;
		return sendPost(targetUrl, parameters);
	}
	
	/**
	 * ����Ʈ ���� �ֹ� ����/ �� ������ ����
	 * @param SeqSite
	 * @return
	 * @throws Exception
	 */
	public static HashMap<String, Object> getSiteMemberSummary(String SeqSite) throws Exception{
		String targetUrl = apiUrl + "/GetSiteMemberSummary";
		String parameters = "SeqSite=" + SeqSite ;
		return sendPost(targetUrl, parameters);
	}
	
	
	/**
	 * ����Ʈ ���� ���뺰 1�� ��뷮 ���
	 * @param SeqSite
	 * @param Year
	 * @param Month
	 * @param Day
	 * @param Sort
	 * @return
	 * @throws Exception
	 */
	public static HashMap<String, Object> getUsageListOfSiteDay(String SeqSite, String Year, String Month, String Day, String Sort) throws Exception{

		String targetUrl = apiUrl + "/GetUsageListOfSiteDay";
		String parameters = "SeqSite=" + SeqSite ;
		parameters += "&Year=" + Year;
		parameters += "&Month=" + Month;
		parameters += "&Day=" + Day;
		parameters += "&Sort=" + Sort;
		
		return sendPost(targetUrl, parameters);
	}
	
	/**
	 * ����Ʈ ���� ���뺰 1���� ��뷮 ���
	 * @param SeqSite
	 * @param Year
	 * @param Month
	 * @param Sort
	 * @return
	 * @throws Exception
	 */
	public static HashMap<String, Object> getUsageListOfSiteMonth(String SeqSite, String Year, String Month, String Sort) throws Exception{

		String targetUrl = apiUrl + "/GetUsageListOfSiteMonth";
		String parameters = "SeqSite=" + SeqSite ;
		parameters += "&Year=" + Year;
		parameters += "&Month=" + Month;
		parameters += "&Sort=" + Sort;
		
		return sendPost(targetUrl, parameters);
	}
	
	/**
	 * HashMap<String, Object> �� ������ ����
	 * ����Ʈ ��û
	 * @param targetUrl
	 * @param parameters
	 * @return
	 * @throws Exception
	 */
	private static HashMap<String, Object> sendPost(String targetUrl, String parameters) throws Exception {
		HashMap<String, Object> returnMap = null;
		
		URL url = new URL(targetUrl);
		HttpsURLConnection con = (HttpsURLConnection) url.openConnection();


		con.setRequestMethod("POST"); // HTTP POST �޼ҵ� ����

		con.setRequestProperty("content-type", "application/x-www-form-urlencoded");
		con.setRequestProperty("Accept-Charset", "UTF-8");

		con.setDoOutput(true); // POST �Ķ���� ������ ���� ���� // Send post request
		
					
		
		OutputStream os = con.getOutputStream();
		os.write(parameters.getBytes());
		//System.out.println(parameters);
		os.flush();
		os.close();
		
		if (con.getResponseCode() == 200) {
			
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			String inputLine;

			StringBuffer response = new StringBuffer();
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}

			in.close();

			ObjectMapper mapper = new ObjectMapper();
			//	ajax ȣ��� �� �����Ͱ� �ʿ� ��ȯ �Ǿ� �������.
			returnMap = mapper.readValue(response.toString(), new TypeReference<HashMap<String, Object>>() {});

			
		}
		
		return returnMap;
	}
	
} //api end
