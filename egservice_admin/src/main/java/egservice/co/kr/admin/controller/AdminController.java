package egservice.co.kr.admin.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egservice.co.kr.admin.common.Api;
import egservice.co.kr.admin.common.ApiUtil;
import egservice.co.kr.admin.common.Apibld;
import egservice.co.kr.admin.common.FileUtil;
import egservice.co.kr.admin.common.SessionUtil;
import egservice.co.kr.admin.common.WebUtil;



@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	private final boolean devMode = false;
	
	/**
	 * 어드민 HOME
	 * team_type에 따른 관리자 페이지로 이동
	 * @param locale
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String adminLoginForm(Locale locale, HttpSession session, Model model) {
		String moveUrl = "";
		
		if(session.getAttribute("ADMIN") == null ) {
			
			moveUrl = "index";
					
		}else {
			//	team_type
			Map<String, Object> map =  (HashMap<String, Object>) session.getAttribute("ADMIN");
			
			String team_type = String.valueOf(map.get("team_type"));
			
			
			if("2".equals(team_type)) {			//	구청 관리자 인경우
				
				//moveUrl = "redirect:org/dashboard";
				moveUrl = "redirect:org/home";
				
			}else if("3".equals(team_type)) {	//	아파트 관리실 인경우	
				
				
				
				moveUrl = "redirect:apt/home";
				
			}else if("4".equals(team_type)) {	//	건물 관리자 인경우
				
				moveUrl = "redirect:bld/home";
				
			}else if("1".equals(team_type)) {	//	에너넷 인 경우
				
			}
			
		}
		
		
		
		return moveUrl;
	}
	
	/**
	 * 로그인 프로세스
	 * @param session
	 * @param paramMap
	 * @param rttr
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login/proc")
	public String loginProc(HttpSession session, @RequestParam HashMap<String, String> paramMap,
			RedirectAttributes rttr, Model model, HttpServletRequest request) throws Exception {
		
		String moveUrl = "";
		String Id = String.valueOf(paramMap.get("adminId"));
		String Password = String.valueOf(paramMap.get("adminPwd"));
		
		HashMap resultCheckAdminLoginMap = Api.checkAdminLogin(Id, Password);
		
		String result_code = String.valueOf(resultCheckAdminLoginMap.get("result_code"));
		
		
		if("1".equals(result_code)) {
			
			String seq_admin = String.valueOf(resultCheckAdminLoginMap.get("seq_admin"));
			String team_type = String.valueOf(resultCheckAdminLoginMap.get("team_type"));
			
			HashMap resultAdminInfoMap = Api.getAdminInfo(seq_admin);
			
			resultAdminInfoMap.put("admin_id", Id);
			resultAdminInfoMap.put("admin_pwd", Password);
			resultAdminInfoMap.put("seq_admin", seq_admin);
			//resultAdminInfoMap.put("team_type", team_type);
			
			session.setAttribute("ADMIN", resultAdminInfoMap);
			
			//	오늘의 근무일, 날씨 기온 등을 가져온다.
			//StringUtil stringUtil = new StringUtil();
			//HashMap weatherMap = Api.getWeatherDay(stringUtil.getFullYearYYYY() + stringUtil.getMonthMM() + stringUtil.getDayDD());
			HashMap weatherMap = Api.getWeatherCurrent("0");
			
			
			weatherMap = ApiUtil.getMapWeather(weatherMap);
			
			
			session.setAttribute("TODAY_WEATHER", weatherMap);
			
			String browser = WebUtil.getBrowser(request);
			
			session.setAttribute("BROWSER", browser);
			
			logger.info("= = = = = LOGIN LOG START = = = = =");
			
			
			logger.info("loginProc method : " + "loginProc");
			logger.info("loginProc session ADMIN: " + resultAdminInfoMap.toString());
			logger.info("loginProc browser check : " + browser);
			logger.info("loginProc session TODAY_WEATHER: " + weatherMap.toString());
			
			
			logger.info("= = = = = LOGIN LOG END = = = = =");
			
			if("2".equals(team_type)) {		//	기관 (구청) 인경우
				
				
				moveUrl = "redirect:../org/home";
				

			}else if("3".equals(team_type)) {	//	아파트 관리실 인경우	
				//	60초 * 60분 * 2 => 2시간
				//session.setMaxInactiveInterval(60*60*2);
				
				HashMap sessionMap = SessionUtil.getSessionMap(session, "ADMIN");
				List list_site = (List) sessionMap.get("list_site");
				HashMap site_map = (HashMap) list_site.get(0);
				
				HashMap siteInfoBld = Api.getSiteInfoBld(String.valueOf(site_map.get("seq_site")));
				
				session.setAttribute("SITE_INFO_BLD", siteInfoBld);
				
				moveUrl = "redirect:../apt/home";
				
			}else if("4".equals(team_type)) {	//	건물 관리자 인경우
				//session.setMaxInactiveInterval(60*60*2);
				
				//	세션에 담겨져있는 list_site 불러와서 seq_site를 확보 
				//	getSiteInfobld를 호출하여 계측기 리스트 확보	 
				HashMap sessionMap = SessionUtil.getSessionMap(session, "ADMIN");
				List list_site = (List) sessionMap.get("list_site");
				HashMap site_map = (HashMap) list_site.get(0);
				
				HashMap siteInfoBld = Api.getSiteInfoBld(String.valueOf(site_map.get("seq_site")));
				
				session.setAttribute("SITE_INFO_BLD", siteInfoBld);
				
				moveUrl = "redirect:../bld/home";
				
			}else if("1".equals(team_type)) {	//	에너넷 인 경우
				
				moveUrl = "redirect:../system/home";
			}
			
			session.setMaxInactiveInterval(-1);
			
		}else{
			//	seq_admin	==	0 이면 로그인 실패
			logger.info("= = = = = LOGIN FAIL LOG START = = = = =");
			logger.info("login proc paramMap : " + paramMap.toString());
			logger.info("login check return value : " + resultCheckAdminLoginMap.toString());
			logger.info("= = = = = LOGIN FAIL LOG END = = = = =");
					
			//String message ="로그인에 실패하였습니다. <br> 아이디와 비밀번호를 확인해주시기 바랍니다.";
		    //rttr.addFlashAttribute("message", message);
			
			rttr.addFlashAttribute("result_code", result_code);
			moveUrl = "redirect:../";
						
		}
		
		
		
		return moveUrl;
	}
	
	
	/**
	 * 로그아웃
	 * @param session
	 * @return
	 */
	@RequestMapping("/login/logout")
	public String logout(HttpSession session) {
		String moveUrl = "redirect:../";
		
		session.invalidate();
		
		return moveUrl;
	}
	
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @param session
	 * @param paramMap
	 * @throws Exception
	 */
	@RequestMapping(value="/file/fakeUpload", method=RequestMethod.POST)
	public void fakeUpload(HttpServletRequest request,HttpServletResponse response, HttpSession session, 
			@RequestParam HashMap paramMap) throws Exception{
		
		
		logger.info("= = = = = FAKEUPLOAD LOG START = = = = =");
    	logger.info("seq_admin : " +  SessionUtil.getString(session, "ADMIN", "seq_admin"));
    	logger.info("admin_id : " + SessionUtil.getString(session, "ADMIN", "admin_id"));
    	logger.info("admin_name : " + SessionUtil.getString(session, "ADMIN", "admin_name"));
		logger.info("paramMap : " + paramMap.toString());
		logger.info("= = = = = FAKEUPLOAD LOG END = = = = =");
		
	}
	
	
	/**
	 * 이미지 업로드 처리하는 함수
	 * @param request
	 * @param multiFile
	 * @param upload
	 * @throws Exception
	 */
	@RequestMapping(value="/file/imageUpload", method=RequestMethod.POST)
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, HttpSession session, 
			@RequestParam MultipartFile upload) throws Exception{

	    PrintWriter printWriter = null;
	    response.setCharacterEncoding("utf-8");
	    response.setContentType("text/html;charset=utf-8");
	      
	    //	원본 파일명
	    String oriFileName = upload.getOriginalFilename();		
	        
	    
	    //	이미지의 확장자를 가지고 있는지 체크
	    boolean isImage = FileUtil.isImage(oriFileName);
	   
	    //
	    String seq_admin = SessionUtil.getString(session, "ADMIN", "seq_admin");
	    String admin_id = SessionUtil.getString(session, "ADMIN", "admin_id");
	    String admin_name = SessionUtil.getString(session, "ADMIN", "admin_name"); 
	    
	    try {
	    	printWriter = response.getWriter();
	    	
	    	 //	이미지가 아니면 ...
		    if(!isImage) {
		    	
		    	logger.info("= = = = = IMAGEUPLOAD NOT IMAGE LOG START = = = = =");
		    	logger.info("seq_admin : " + seq_admin);
		    	logger.info("admin_id : " + admin_id);
		    	logger.info("admin_name : " + admin_name);
		    	logger.info("not image : " + oriFileName);
		    	logger.info("= = = = = IMAGEUPLOAD NOT IMAGE LOG END = = = = =");
		    	
		    	printWriter.print("0"+"|"+ oriFileName + " 는 이미지 파일이 아닙니다.");
		     
		    
		        
		    }else {
		    	
		    	
		    	//	용량확인
		    	long maxSize = 10485760;
		    	if(upload.getSize()>maxSize) {
		    		printWriter.print("0"+"|"+ "10MB 파일 미만으로 올려주시기 바랍니다.");
 
			        

		    	}else {
		    		//	파일 업로드 공통 패스
		    		String basePath = "D:/eg_service_img/image/egservice";
				    //	임시 저장 패스
				    String baseTempPath = "D:/tempPath/image/egservice";
				    
				    //	베이스 URL	(dev)
				    String baseFileUrl = null;
				    //	개발 서버
				    //String baseFileUrl = "http://192.168.100.140:60000/admin/fileImg/image/egservice";
				    


				    
				    if(devMode) {
				    	//	개발자 컴퓨터
				    	baseFileUrl = "http://192.168.100.111:14000/admin/fileImg/image/egservice";
				    }else {
					    //	운영 서버		
				    	
				    	baseFileUrl = "https://www.egservice.co.kr/admin/fileImg/image/egservice";
				    }
				    
				    Map<String, Object> fileInfoMap = FileUtil.imageUpload(response, upload, basePath, baseTempPath);
				    String datePath = (String) fileInfoMap.get("datePath");			    
				    String fileName = (String) fileInfoMap.get("fileName");
				    
				    logger.info("= = = = = IMAGEUPLOAD SUCCESS LOG START = = = = =");
				    logger.info("seq_admin : " + seq_admin);
			    	logger.info("admin_id : " + admin_id);
			    	logger.info("admin_name : " + admin_name);
			    	logger.info("image name : " + oriFileName);
					
				    logger.info(fileInfoMap.toString());
				    logger.info("= = = = = IMAGEUPLOAD SUCCESS LOG END = = = = =");
				    
				    String url = baseFileUrl +"/" + datePath + "/" + fileName;
				       
				    //logger.info(url); 
				    //	| 구분자로 하여금 전달
				    //	성공 1, message , url
				    printWriter.print("1"+"|"+"이미지를 등록하였습니다." + "|" + url);
				   
				    
		    	}
		    }
		    
		    printWriter.flush();
		    
	    }catch(Exception e) {
	    	e.printStackTrace();
	    	
	    }finally {
	        if (printWriter != null) {
                printWriter.close();
            }
	    }
		    
    }//	end
	
	/**
	 * 에러 페이지로 이동
	 * @param request
	 * @param session
	 * @param exception
	 * @param error_code
	 * @return
	 */
	@RequestMapping(value = "/common/error{error_code}")
	public ModelAndView error(HttpServletRequest request, HttpSession session, Exception exception,
			@PathVariable String error_code) {

		ModelAndView mv = new ModelAndView("/common/error");

		String exceptionMsg = exception.getMessage();
		// 스택
		String statckTrace = "";

		StackTraceElement[] ele = exception.getStackTrace();
		for (int i = 0; i < ele.length; i++) {
			statckTrace += "\r\n" + ele[i];
		}

		String msg = "";

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("STATUS_CODE", request.getAttribute("javax.servlet.error.status_code"));
		map.put("REQUEST_URI", request.getAttribute("javax.servlet.error.request_uri"));
		map.put("EXCEPTION_TYPE", request.getAttribute("javax.servlet.error.exception_type"));
		map.put("EXCEPTION", request.getAttribute("javax.servlet.error.exception"));
		map.put("SERVLET_NAME", request.getAttribute("javax.servlet.error.servlet_name"));
		map.put("ERROR_MESSAGE", request.getAttribute("javax.servlet.error.message"));
		map.put("STATCKTRACE", statckTrace);

		try {
			int status_code = Integer.parseInt(error_code);
			switch (status_code) {
			case 400:
				msg = "잘못된 요청입니다.";
				break;
			case 403:
				msg = "접근이 금지되었습니다.";
				break;
			case 404:
				msg = "페이지를 찾을 수 없습니다.";
				break;
			case 405:
				msg = "요청된 메소드가 허용되지 않습니다.";
				break;
			case 500:
				msg = "서버에 오류가 발생하였습니다.";
				break;
			case 503:
				msg = "서비스를 사용할 수 없습니다.";
				break;
			default:
				msg = "알 수 없는 오류가 발생하였습니다.";
				break;
			}
		} catch (Exception e) {
			msg = "기타 오류가 발생하였습니다.";
		} finally {
			map.put("MESSAGE", msg);
		}

		// logging
		if (map.isEmpty() == false) {

			logger.info("= = = = = ERROR LOG START = = = = =");

			if (!SessionUtil.isNull(session, "ADMIN")) {
				logger.info("session info");
				logger.info(SessionUtil.getSessionMap(session, "ADMIN").toString());
			} else {
				logger.info("session is null");
			}

			for (String key : map.keySet()) {
				// Object value = map.get(key);
				logger.info("key : " + key + "," + "value : " + map.get(key));
			}

			logger.info("= = = = = ERROR LOG END = = = = =");
			
		}
		
		mv.addObject("error", map);
		return mv;
	}
	
	/**
	 * AJAX ERROR
	 * @param session
	 * @param paramMap
	 * @throws Exception
	 */
	 @ResponseBody  
	 @RequestMapping("/ajax/error") public void ajaxError(HttpSession session, 
			 @RequestBody HashMap<String, Object> paramMap ) throws Exception{
		  logger.info("= = = = = AJAX ERROR LOG START = = = = =");
		  logger.info("ajaxError admin_id : " + SessionUtil.getString(session, "ADMIN", "admin_id") );
		  logger.info("ajaxError admin_name : " + SessionUtil.getString(session, "ADMIN", "admin_name") );
		  logger.info("ajaxError param : " + paramMap.toString());
		  logger.info("= = = = = AJAX ERROR LOG END = = = = =");
	 }
	
}
