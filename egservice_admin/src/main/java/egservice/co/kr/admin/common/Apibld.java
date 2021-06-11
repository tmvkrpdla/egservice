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
 * 2021.04.23
 *
 */
public class Apibld {

	private static final String apiUrl = "https://www.egservice.co.kr:7187/api";
	
	
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
	 * ������ ��¥�� ����, �޹��� ����, ���� ���� DateTarget : ������¥(20200625 ����)
	 * 
	 * is_holiday : 1 �޹���, 0 �ٹ��� day_of_week : 1= �Ͽ���, 7 ����� weather_code : -1 = ��,
	 * 1=����, 2=�帲, 3=��, 4=��
	 * 
	 * @param DateTarget
	 * @return
	 * @throws Exception
	 */
	public static final HashMap<String, Object> getWeatherDay(String DateTarget) throws Exception {
		String targetUrl = apiUrl + "/GetWeatherDay";
		String parameters = "DateTarget=" + DateTarget;

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
	
	public static final HashMap<String, Object> getWeatherMonth (String MonthTarget) throws Exception{
		String targetUrl = apiUrl + "/GetWeatherMonth";
		String parameters = "MonthTarget=" + MonthTarget;
		
		return sendPost(targetUrl, parameters);
		
	}
	
	public static HashMap<String, Object> getUsageMeterMonth(String SeqMeter, String Year, String Month) throws Exception{
		
		String targetUrl = apiUrl + "/GetUsageMeterMonth";
		
		String parameters = "SeqMeter=" + SeqMeter ;
		parameters += "&Year=" + Year;
		parameters += "&Month=" + Month;
		
		
		return sendPost(targetUrl, parameters);
		
	}	
	
	public static final HashMap<String, Object> getWeather(String DateFrom , String DateTo ) throws Exception{
		String targetUrl = apiUrl + "/GetWeather";
		String parameters = "DateFrom=" + DateFrom;
		parameters += "&DateTo=" + DateTo;
		
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
	
	public static HashMap<String, Object> getSavePlanInfo(String SeqSavePlan) throws Exception{
		String targetUrl = apiUrl + "/GetSavePlanInfo";
		String parameters = "SeqSavePlan=" + SeqSavePlan;
		
		return sendPost(targetUrl, parameters);
	}

	/**
	 * HashMap<String, Object> �� ������ ���� ����Ʈ ��û
	 * 
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
	
} //Apibld end

