package egservice.co.kr.admin.bld.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.executor.ReuseExecutor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egservice.co.kr.admin.common.Api;
import egservice.co.kr.admin.common.Apibld;
import egservice.co.kr.admin.common.PageUtil;
import egservice.co.kr.admin.common.SessionUtil;
import egservice.co.kr.admin.common.StringUtil;

/**
 * 
 * @author enernet99
 * 전기 요금 절감하기
 *
 */
@Controller
@RequestMapping("/bld")
public class BldElecController {
	
	private static Logger logger = LoggerFactory.getLogger(BldElecController.class);
	
	/**
	 * 용어 설명
	 * @param session
	 * @param model
	 * @param mainMenu
	 * @param subMenu
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/elecTerm")
	public String bldElecTerm(HttpSession session
			, Model model
			, @RequestParam(value="mainMenu", defaultValue="elec") String mainMenu
			, @RequestParam(value="subMenu", defaultValue="term") String subMenu) throws Exception{
		String moveUrl = "redirect:../";

		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
			
			if("4".equals(team_type)) {	//	건물
				
				moveUrl = "bld/elec/bldElecTerm";
				
				model.addAttribute("mainMenu", mainMenu);
				model.addAttribute("subMenu", subMenu);
			}

		}	
		
		return moveUrl;		
	}
	

	@RequestMapping("/elecPopHelpful")
	public String bldElecHelpful(HttpSession session , Model model) throws Exception{
		String moveUrl = "redirect:../";

		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
			
			if("4".equals(team_type)) {	//	건물
				
				moveUrl = "bld/elec/bldElecPopHelpful";

			}

		}	
		
		return moveUrl;		
	}
	
	//	일간 절감 성과 보기
	@RequestMapping("/elecDaily")
	public String elecDaily(HttpSession session, Model model
			, @RequestParam(value="mainMenu", defaultValue="elec")String mainMenu
			, @RequestParam(value="subMenu", defaultValue="daily")String subMenu
			, @RequestParam(value="dateTarget", defaultValue="") String dateTarget
			) throws Exception {
		
		String moveUrl = "redirect:../";

		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
			
			if("4".equals(team_type)) {	//	건물
				
				
				HashMap sessionMap = (HashMap) session.getAttribute("ADMIN");
				List list_site = (List) sessionMap.get("list_site");
				HashMap site_map = (HashMap) list_site.get(0);
				String seq_site = String.valueOf(site_map.get("seq_site"));
				
				HashMap returnMap = Apibld.getActiveSavePlan(seq_site);
				String seq_save_plan = String.valueOf(returnMap.get("seq_save_plan"));
				
				if("0".equals(seq_save_plan)) {
					//	절감계획이 없으므로 절감계획 새로 만들기 페이지로 이동
					moveUrl = "bld/elec/bldElecDailyProc";
					
				}else {
					
					moveUrl = "bld/elec/bldElecDaily";

					StringUtil strUtil = new StringUtil();
					
					if("".equals(dateTarget)) {
						dateTarget = strUtil.getFullYearYYYY() +"-"+ strUtil.getMonthMM()+"-"+ strUtil.getDayDD(); 
					}
					
					returnMap = Apibld.getSaveResultDaily(seq_save_plan, dateTarget.replaceAll("-", ""));
					
					HashMap save_result_daily = (HashMap) returnMap.get("save_result_daily");
					
					String time_created = String.valueOf(save_result_daily.get("time_created"));
					
					time_created = time_created.substring(0, 10);
					
					String time_ended = String.valueOf(save_result_daily.get("end_created"));
					
					
					if("null".equals(time_ended)) {
						time_ended = strUtil.getFullYearYYYY() +"-"+ strUtil.getMonthMM()+"-"+ strUtil.getDayDD();
					}
					
					model.addAttribute("SAVE_RESULT_DAILY",save_result_daily);
					model.addAttribute("DATETARGET",   dateTarget);		//	조회일자
					model.addAttribute("TIME_CREATED", time_created);	//	조회가능 시작 일자
					model.addAttribute("END_CREATED",  time_ended);		//	조회가능 마지막 일자
										
				}
								
				model.addAttribute("mainMenu", mainMenu);
				model.addAttribute("subMenu", subMenu);

			}

		}	
		
		return moveUrl;
	}
	
	//	기간별 절감 성과 보기
	@RequestMapping("/elecDate")
	public String elecDate(HttpSession session, Model model
			, @RequestParam(value="mainMenu", defaultValue="elec")String mainMenu
			, @RequestParam(value="subMenu", defaultValue="date")String subMenu
			, @RequestParam(value="dateTarget", defaultValue = "")String dateTarget) throws Exception {
		
		String moveUrl = "redirect:../";

		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
			StringUtil strUtil = new StringUtil();
			
			if("4".equals(team_type)) {	//	건물
				
				HashMap sessionMap = (HashMap) session.getAttribute("ADMIN");
				List list_site = (List) sessionMap.get("list_site");
				HashMap site_map = (HashMap) list_site.get(0);
				String seq_site = String.valueOf(site_map.get("seq_site"));
				
				HashMap returnMap = Apibld.getActiveSavePlan(seq_site);
				String seq_save_plan = String.valueOf(returnMap.get("seq_save_plan"));
				
				if("0".equals(seq_save_plan)) {
					//	절감계획이 없으므로 절감계획 새로 만들기 페이지로 이동
					moveUrl = "bld/elec/bldElecDateProc";
					
				}else {
					
					String date_created = String.valueOf(returnMap.get("date_created"));
					date_created = date_created.substring(0, 4)+"-"+date_created.substring(4, 6)+"-"+date_created.substring(6);
					
					//	date_ended 는 어제 날짜로 고정
					String date_ended = strUtil.getYesterDay();
					
					moveUrl = "bld/elec/bldElecDate";

					if("".equals(dateTarget)) {
						dateTarget = strUtil.getYesterDay();
					}
					
					HashMap save_result = Apibld.getSaveResult(seq_save_plan, date_created.replaceAll("-", ""), dateTarget.replaceAll("-", ""));
					
					model.addAttribute("DATETARGET", dateTarget);
					model.addAttribute("DATE_ENDED", date_ended);
					model.addAttribute("DATE_CREATED", date_created);
					model.addAttribute("SAVE_RESULT", save_result);
					
				}
				
				model.addAttribute("mainMenu", mainMenu);
				model.addAttribute("subMenu", subMenu);

			}

		}	
		
		return moveUrl;
	}
	
	//	계측기별 절감 성과 보기
	@RequestMapping("/elecMeter")
	public String bldElecMeter(HttpSession session, Model model
			, @RequestParam(value="mainMenu", defaultValue="elec")String mainMenu
			, @RequestParam(value="subMenu", defaultValue="meter")String subMenu
			, @RequestParam(value="dateTarget", defaultValue = "")String dateTarget) throws Exception {
		
		String moveUrl = "redirect:../";

		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
			StringUtil strUtil = new StringUtil();
			
			if("4".equals(team_type)) {	//	건물
				
				HashMap sessionMap = (HashMap) session.getAttribute("ADMIN");
				List list_site = (List) sessionMap.get("list_site");
				HashMap site_map = (HashMap) list_site.get(0);
				String seq_site = String.valueOf(site_map.get("seq_site"));
				
				HashMap returnMap = Apibld.getActiveSavePlan(seq_site);
				String seq_save_plan = String.valueOf(returnMap.get("seq_save_plan"));
				
				
				if("0".equals(seq_save_plan)) {
					//	절감계획이 없으므로 절감계획 새로 만들기 페이지로 이동
					moveUrl = "bld/elec/bldElecMeterProc";
					
				}else {
					
					String date_created = String.valueOf(returnMap.get("date_created"));
					date_created = date_created.substring(0, 4)+"-"+date_created.substring(4, 6)+"-"+date_created.substring(6);
					
					//	date_ended 는 어제 날짜로 고정
					String date_ended = strUtil.getYesterDay();
					
					moveUrl = "bld/elec/bldElecMeter";

					if("".equals(dateTarget)) {
						dateTarget = strUtil.getYesterDay();
					}
					
					HashMap save_result = Apibld.getSaveResult(seq_save_plan, date_created.replaceAll("-", ""), dateTarget.replaceAll("-", ""));
					
					model.addAttribute("DATETARGET", dateTarget);
					model.addAttribute("DATE_ENDED", date_ended);
					model.addAttribute("DATE_CREATED", date_created);
					model.addAttribute("SAVE_RESULT", save_result);
					
				}
								
				model.addAttribute("mainMenu", mainMenu);
				model.addAttribute("subMenu", subMenu);

			}

		}	
		
		return moveUrl;
	}
	
	
	//	절감 계획 새로 만들기
	@RequestMapping("/elecPlanWriteCheck")
	public String elecPlanCheck(HttpSession session, Model model,
			@RequestParam(value="mainMenu", defaultValue="elec")String mainMenu,
			@RequestParam(value="subMenu", defaultValue="planWrite")String subMenu) throws Exception {
		
		String moveUrl = "redirect:../";

		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
			
			if("4".equals(team_type)) {	//	건물
				
				HashMap sessionMap = (HashMap) session.getAttribute("ADMIN");
				List list_site = (List) sessionMap.get("list_site");
				HashMap site_map = (HashMap) list_site.get(0);
				String seq_site = String.valueOf(site_map.get("seq_site"));
				
				HashMap returnMap = Apibld.getActiveSavePlan(seq_site);
				String seq_save_plan = String.valueOf(returnMap.get("seq_save_plan"));
				
				//System.out.println(seq_save_plan);

				if("0".equals(seq_save_plan)) {
					//	절감계획이 없으므로 절감계획 새로 만들기 페이지로 이동
					moveUrl = "redirect:../bld/elecPlanWrite";
					
				}else {
					//	절감계획이 있으므로 popup창으로 이동
					moveUrl = "bld/elec/bldElecPlanWriteCheck";
					model.addAttribute("seq_save_plan", seq_save_plan);
				}
				

			}

		}	
		
		return moveUrl;
	}
	
	//	절감 계획 새로 만들기
	@RequestMapping("/elecPlanWrite")
	public String elecPlanWrite(HttpSession session, Model model,
			@RequestParam(value="mainMenu", defaultValue="elec")String mainMenu,
			@RequestParam(value="subMenu", defaultValue="planWrite")String subMenu) throws Exception {
		
		String moveUrl = "redirect:../";

		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
			
			if("4".equals(team_type)) {	//	건물
				moveUrl = "bld/elec/bldElecPlanWrite";
				
				StringUtil sUtil = new  StringUtil();
				
				HashMap siteInfoBldMap = SessionUtil.getSessionMap(session, "SITE_INFO_BLD");
				
				HashMap savePlanMap = Apibld.createSavePlan(String.valueOf(siteInfoBldMap.get("seq_site")));
				 				
				model.addAttribute("seq_save_plan", savePlanMap.get("seq_save_plan"));
				model.addAttribute("selectPerList", sUtil.getSelectPerList());
				model.addAttribute("selectTimeList", sUtil.getSelectTimeList());
				model.addAttribute("mainMenu", mainMenu);
				model.addAttribute("subMenu", subMenu);

			}

		}	
		
		return moveUrl;
	}
	
	//	절감 기준 목록 : 팝업 - 절감기준 선택
	@RequestMapping("/elecPopStdList")
	public String elecPopStdList(HttpSession session, Model model,
			@RequestParam(value="nowPage", defaultValue="1")int nowPage) throws Exception{
		
		String moveUrl = "redirect:../";

		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
			
			if("4".equals(team_type)) {	//	건물
				moveUrl = "bld/elec/bldElecPopStdList";
				
				StringUtil stringUtil = new StringUtil();
				
				//	seq_site 구하기
				HashMap sessionMap = (HashMap) session.getAttribute("ADMIN");
				ArrayList list_site = (ArrayList) sessionMap.get("list_site");
				HashMap siteMap = (HashMap) list_site.get(0);
				String seq_site = String.valueOf(siteMap.get("seq_site"));
				
				//	총갯수 구하기
				HashMap countMap = Apibld.getSaveRefCount(seq_site);
				
				PageUtil pageUtil = new PageUtil(nowPage, Integer.parseInt(String.valueOf(countMap.get("count_save_ref"))), 10);
				
				
				HashMap refListMap = Apibld.getSaveRefListForPaging(seq_site, pageUtil.getStartNum(), pageUtil.getEndNum());
				List list_save_ref = (List) refListMap.get("list_save_ref");
				
				
				model.addAttribute("nowPage", nowPage);
				model.addAttribute("PAGEUTIL", pageUtil);
				model.addAttribute("LIST_SAVE_REF", list_save_ref);
				
			}

		}	
		
		return moveUrl;
		
	}//
	
	//	절감 기준 만들기 : 팝업
	@RequestMapping("/elecPopStdWrite")
	public String popStdWrite(HttpSession session, Model model) throws Exception{
		
		String moveUrl = "redirect:../";

		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
			
			if("4".equals(team_type)) {	//	건물
				moveUrl = "bld/elec/bldElecPopStdWrite";
				 
					
			}

		}	
		
		return moveUrl;
		
	}//
	
	//	절감 기준 만들기 디테일
	@RequestMapping("/elecPopStdDetail")
	public String popStdDetail(HttpSession session, Model model
			,@RequestParam(value="seq_save_ref", defaultValue="")String seq_save_ref ) throws Exception{
		
		String moveUrl = "redirect:../";

		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
			
			if("4".equals(team_type)) {	//	건물
				moveUrl = "bld/elec/bldElecPopStdDetail";
				HashMap resultMap = Apibld.getSaveRefInfo(seq_save_ref);
				
				model.addAttribute("SAVE_REF_INFO", resultMap);
				model.addAttribute("seq_save_ref", seq_save_ref);
			}

		}	
		
		return moveUrl;
		
	}//
	
	// 절감 조치 만들기 : 팝업
	@RequestMapping("/elecPopActWrite")
	public String popActWrite(HttpSession session, Model model) throws Exception{
		
		String moveUrl = "redirect:../";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
			
			if("4".equals(team_type)) {	//	건물
				moveUrl = "bld/elec/bldElecPopActWrite";
				
			}

		}	
		
		return moveUrl;
		
	}
	
	// 절감 조치 수정 : 팝업
	@RequestMapping("/elecPopActMod")
	public String popActMod(HttpSession session, Model model) throws Exception{
		
		String moveUrl = "redirect:../";
		
		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
			
			if("4".equals(team_type)) {	//	건물
				moveUrl = "bld/elec/bldElecPopActMod";
				
			}

		}	
		
		return moveUrl;
		
	}
	
	//	절감 계획 목록 조회
	@RequestMapping("/elecPlanList")
	public String elecPlanList(HttpSession session, Model model
			, @RequestParam(value="mainMenu", defaultValue="elec")String mainMenu
			, @RequestParam(value="subMenu", defaultValue="planList")String subMenu
			, @RequestParam(value="nowPage", defaultValue="1") int nowPage
			) throws Exception {
		
		String moveUrl = "redirect:../";

		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
			
			if("4".equals(team_type)) {	//	건물
				moveUrl = "bld/elec/bldElecPlanList";
				
				HashMap sessionMap = (HashMap) session.getAttribute("ADMIN");
				List list_site = (List) sessionMap.get("list_site");
				HashMap site_map = (HashMap) list_site.get(0);
				String seq_site = String.valueOf(site_map.get("seq_site"));
				
				HashMap returnMap = Apibld.getSavePlanCount(seq_site);
				
				int totCnt = Integer.parseInt(String.valueOf(returnMap.get("count_save_plan")));
				
				PageUtil pageUtil = new PageUtil(nowPage, totCnt, 6);
				HashMap savePlanMap = Apibld.getSavePlanListForPaging(seq_site, pageUtil.getStartNum(), pageUtil.getEndNum());
				
				
				model.addAttribute("LIST_SAVE_PLAN", savePlanMap.get("list_save_plan"));
				model.addAttribute("PAGEUTIL", pageUtil);
				model.addAttribute("nowPage", nowPage);
				model.addAttribute("mainMenu", mainMenu);
				model.addAttribute("subMenu", subMenu);

			}

		}	
		
		return moveUrl;
	}
	
	/**
	 * 절감계획 상세보기 
	 * 	절감계획목록조회에서 상세정보 버튼 클릭
	 * @param session
	 * @param model
	 * @param paramMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/elecPopPlanView")
	public String elecPopPlanView(HttpSession session, Model model
			, @RequestParam HashMap paramMap ) throws Exception {
		
		String moveUrl = "redirect:../";

		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
			
			if("4".equals(team_type)) {	//	건물
				moveUrl = "bld/elec/bldElecPopPlanView";
				
				
				StringUtil strUtil = new StringUtil();
				
				String seq_save_plan = String.valueOf(paramMap.get("seq_save_plan"));
				String date_created = String.valueOf(paramMap.get("date_created"));		
				String date_ended = String.valueOf(paramMap.get("date_ended"));
				if("".equals(date_ended)) {
					date_ended = strUtil.getFullYearYYYY() +"-"+ strUtil.getMonthMM()+"-"+ strUtil.getDayDD(); 
				}
				
				//	해당 절감계획의 date_ended or 오늘날짜 (date_ended 가 없으면 오늘날짜로 조회)
				
				HashMap returnMap = Apibld.getSaveResultDaily(seq_save_plan, date_ended.replaceAll("-", ""));
				
				model.addAttribute("SAVE_RESULT_DAILY", returnMap.get("save_result_daily"));
				model.addAttribute("seq_save_plan", seq_save_plan);
				model.addAttribute("date_created", date_created);
				model.addAttribute("date_ended", date_ended);
				
			}

		}	
		
		return moveUrl;
	}
	
	
	//	전기 요금표
	@RequestMapping("/elecRatesTable")
	public String elecRatesTable(HttpSession session, Model model,
			@RequestParam(value="mainMenu", defaultValue = "elec")String mainMenu,
			@RequestParam(value="subMenu", defaultValue="ratesTable")String subMenu) throws Exception {
		
		String moveUrl = "redirect:../";

		if(!SessionUtil.isNull(session, "ADMIN")) {
			
			String team_type = SessionUtil.getString(session, "ADMIN", "team_type");
			
			if("4".equals(team_type)) {	//	건물
				moveUrl = "bld/elec/bldElecRatesTable";
				
				
				model.addAttribute("mainMenu", mainMenu);
				model.addAttribute("subMenu", subMenu);

			}

		}	
		
		return moveUrl;
	}
	

}
