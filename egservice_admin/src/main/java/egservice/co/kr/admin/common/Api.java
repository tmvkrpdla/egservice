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
	 * 로그인
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
	 * 사용자의 정보를 가져오는 함수
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
	 * 현재 날씨 API 호출
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
		지정한 날짜의 요일, 휴무일 여부, 날씨 정보
		DateTarget : 지정날짜(20200625 형식)
		
		is_holiday : 1 휴무일, 0 근무일
		day_of_week : 1= 일요일, 7 토요일
		weather_code : -1 = 모름, 1=맑음, 2=흐림, 3=비, 4=눈

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
	 * 지정날짜의 Site의 시간대별 사용량
	 * SeqSite : Site의 Seq 번호
Year : 2020
Month : 6
Day : 17

	 * @param SeqSite
	 * @param Year
	 * @param Month
	 * @param Day
	 * @return
	 * is_holiday : 1=휴무일, 0=근무일
		[list_usage]
		unit : 0 ~ 23 
		usage : 사용량 (kWh)

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
	 * 지정년도의 Site의 월별 사용량
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
	 * 건물의 정보를 가져옮
	 * @param SeqSite
	 * @return
	 * @throws Exception
	 	seq_site : 단지 Seq 번호
		site_type : 1=아파트단지, 2=건물
		name : 
		address :
		dx : 경도
		dy : 위도
		kw_contracted : 건물 계약전력
		read_day : 정기 검침일
		built_year : 완공 년도
		built_month : 완공 월
		home_page : 건물 홈페이지
		area : 건물 면적
		floor_info : 건물 층 정보 (예 : “지하1층, 지상4층”)
		
		[meter_list]
		seq_meter :
		mid : 미터 ID
		mac_address :
		maker : 제조사
		model : 미터기 모델명
		meter_name : 건물관리자가 부여한 명칭
		descr : 건물관리자가 부여한 명칭 (예 : 전등기구, 에어컨 등)
		floor_installed : 설치된 층수, -1은 지하1층

	 */
	public static HashMap<String, Object> getSiteInfoBld(String SeqSite) throws Exception{
		String targetUrl = apiUrl + "/GetSiteInfoBld";
		
		String parameters = "SeqSite=" + SeqSite ;
		
		return sendPost(targetUrl, parameters);
	} 
	
	
	/**
	 * 지정날짜의 지정 미터기의 시간대별 사용량
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
	
	//	계측기별 사용량 분석 - 주간 비교 분석
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
	 * 절감 기준 목록 리스트
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
	 * 절감 기준 목록 총 갯수
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
	 * 절감 기준 시퀀스 생성
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
	 * 현재 시행중인 절감계획 seq를 리턴함
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
	 * 일간 절감 성과 조회
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
	 * 절감기준 상세 정보 조회
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
	 * 절감계획 전체 개수
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
	 * 페이지 처리를 위한 절감계획 목록
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
	 * 기간별 절감 성과 조회 
	 * 계측기별 절감 성과
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
	 * 사용자의 현재 사용량을 가져오는 함수
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
	 *  SeqAdmin (건물관리자 Seq / 공지사항 읽음 여부 판단용), TimeCreatedMax (지정한 시간 이전의 공지사항 예 = 20191013162045),
	 *  CountNotice (리턴할 공지사항 최대 갯수)
	 * 건물 공지사항 갯수
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
	 * 공지사항 만들기.
	SeqAdmin (작성자 Seq), Top (0=일반공지, 1=상단고정 공지), WriterType (작성자구분 : 1=아파트관리실, 2=에너넷, 3=구청관리자), 
	TargetType (수신대상 : 1=아파트주민, 2=아파트관리자, 3=건물관리자, 4=구청관리자), Title (제목), Content (내용)
	result_code : 0=실패, 1=성공
	seq_notice_inserted : 생성된 공지사항 Seq 번호
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
	 * 공지사항 갯수
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
	 * 공지사항 읽음 표시
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
	 * 공지사항 페이징
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
	 * 공지사항 삭제
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
	 * admin관리자 리스트
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
	 * 아파트 단지 주민 정보
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
	 * 아파트 단지 주민 숫자/ 앱 가입자 숫자
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
	 * 아파트 단지 세대별 1일 사용량 목록
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
	 * 아파트 단지 세대별 1개월 사용량 목록
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
	 * HashMap<String, Object> 로 데이터 리턴
	 * 포스트 요청
	 * @param targetUrl
	 * @param parameters
	 * @return
	 * @throws Exception
	 */
	private static HashMap<String, Object> sendPost(String targetUrl, String parameters) throws Exception {
		HashMap<String, Object> returnMap = null;
		
		URL url = new URL(targetUrl);
		HttpsURLConnection con = (HttpsURLConnection) url.openConnection();


		con.setRequestMethod("POST"); // HTTP POST 메소드 설정

		con.setRequestProperty("content-type", "application/x-www-form-urlencoded");
		con.setRequestProperty("Accept-Charset", "UTF-8");

		con.setDoOutput(true); // POST 파라미터 전달을 위한 설정 // Send post request
		
					
		
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
			//	ajax 호출로 된 데이터가 맵에 전환 되어 담겨진다.
			returnMap = mapper.readValue(response.toString(), new TypeReference<HashMap<String, Object>>() {});

			
		}
		
		return returnMap;
	}
	
} //api end

