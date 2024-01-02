package com.postgres.sample.controller.ljh;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.postgres.sample.dto.AccessLog;
import com.postgres.sample.dto.ActionReport;
import com.postgres.sample.dto.Alarm;
import com.postgres.sample.dto.BreakReport;
import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.LjhResponse;
import com.postgres.sample.dto.Paging;
import com.postgres.sample.dto.UserInfo;
import com.postgres.sample.dto.WaterResources;
import com.postgres.sample.service.jmh.JmhUserInfoService;
import com.postgres.sample.service.ljh.LjhService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class LjhController {

	private final LjhService ljhService;

    private final JmhUserInfoService uiService;		//사용자 관리
	//접속이력 남기는 메소드
	public void insertAccessLog(HttpServletRequest request, Model model) {
		System.out.println("JmhController insertAccessLog Start..");
		//접속이력
		UserInfo userInfoDTO = (UserInfo) request.getSession().getAttribute("userInfo");
		
		String requestURI = request.getRequestURI();        //  요청받은 페이지
		String ip = request.getRemoteAddr();
		String user_id = userInfoDTO.getUser_id();
		
		AccessLog accessLog = new AccessLog();
		accessLog.setProgram_url(requestURI);
		accessLog.setIp(ip);
		accessLog.setUser_id(user_id);
		//-------------------------------------------------
		int result = uiService.InsertAccessLog(accessLog);
		//-------------------------------------------------		
		System.out.println("JmhController insertAccessLog End..");
	}

	// 고장/조치결과보고 > 고장 보고서 목록
	@RequestMapping("/error_report_list")
	public String errorRptList(String currentPage, HttpServletRequest request, Model model) {
		System.out.println("LjhController errorReportList Start");

		// 페이징 작업
		int total = ljhService.breakRptCount();

		Paging paging = new Paging(total, currentPage, 10);
		BreakReport breakRpt = new BreakReport();
		breakRpt.setStart(paging.getStart());
		breakRpt.setEnd(paging.getEnd());
		List<BreakReport> breakRptList = ljhService.getBreakRptListPage(breakRpt);

		List<WaterResources> waterCategory = new ArrayList<WaterResources>();
		waterCategory = ljhService.getWaterCategory();		// 수자원 시설물 종류 SELECT

		model.addAttribute("breakRptList", breakRptList);
		model.addAttribute("page", paging);
		model.addAttribute("waterCategory", waterCategory);

		insertAccessLog(request, model); //접속이력

		return "/system3/ljh/water_resources/error/error_report_list";
	}

	// 고장 보고서 작성 페이지로 이동
	@RequestMapping("/error_report_write_form")
	public String errorRptWriteForm(Model model, HttpServletRequest request) {
		System.out.println("LjhController errorReportWriteForm Start");

		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo");
		String user_id = userInfo.getUser_id();
		String user_name = userInfo.getUser_name();
		System.out.println("로그인 유저 : " + user_id + " / " + user_name);

		List<WaterResources> waterCategory = new ArrayList<WaterResources>();
		waterCategory = ljhService.getWaterCategory();

		List<Code> checkCodeList = new ArrayList<Code>();
		checkCodeList = ljhService.getCheckCode();

		model.addAttribute("waterCategory", waterCategory);
		model.addAttribute("checkCodeList", checkCodeList);
		model.addAttribute("user_id", user_id);
		model.addAttribute("user_name", user_name);

		insertAccessLog(request, model); //접속이력

		return "/system3/ljh/water_resources/error/error_report_write";
	}

	// 고장보고서 작성 페이지에서 시설물 종류(facility_category) 선택 시 AJAX 실행 - 시설물 코드 SELECT
	@ResponseBody
	@RequestMapping("/get_facility_code")
	public List<WaterResources> getWRCode(String facility_category) {
		System.out.println("LjhController getWRCode Start");

		List<WaterResources> wrCodeList = new ArrayList<WaterResources>();
		wrCodeList = ljhService.getWRCode(facility_category);

		// System.out.println("WRCodeList" + wrCodeList);
		return wrCodeList;
	}

	// 고장보고서 작성 페이지에서 시설물 코드(facility_code) 선택 시 AJAX 실행 - 알람내역 SELECT
	@ResponseBody
	@RequestMapping("/get_alarm")
	public List<Alarm> getAlarm(String facility_code, HttpServletRequest request, Model model) {
		System.out.println("LjhController getAlarm Start");

		List<Alarm> alarmList = new ArrayList<Alarm>();
		alarmList = ljhService.getAlarm(facility_code);

		insertAccessLog(request, model); //접속이력

		return alarmList;
	}

	// 고장 보고서 INSERT
	@RequestMapping("/error_report_write")
	public String errorRptWrite(BreakReport breakReport, Alarm alarm, HttpServletRequest request, Model model) {
		System.out.println("LjhController errorReportWrite Start");

//		System.out.println("breakReport -> " + breakReport);
//		System.out.println("alarm -> " + alarm);

		if (breakReport.getHandling_flag() == null) {
			breakReport.setHandling_flag("N");
			System.out.println("breakReport.getHandling_flag() -> " + breakReport.getHandling_flag());

			int result = ljhService.errorRptWrite(breakReport, alarm);
		} else {
			int result = ljhService.errorRptWrite(breakReport, alarm);
		}

		insertAccessLog(request, model); //접속이력

		return "redirect:/error_report_list";
	}

	// 고장 보고서 상세
	@RequestMapping("/error_report_read")
	public String errorRptRead(Integer doc_no, String popup, HttpServletRequest request, Model model) {
		System.out.println("LjhController errorRptRead Start");

		BreakReport breakReport = new BreakReport();
		breakReport = ljhService.getErrorRpt(doc_no);		// 고장 보고서 SELECT

		List<Alarm> alarmList = new ArrayList<Alarm>();
		alarmList = ljhService.getErrorRptAlarm(doc_no);	// 고장 보고서에 등록된 알람 SELECT

		model.addAttribute("breakReport", breakReport);
		model.addAttribute("alarmList", alarmList);

		insertAccessLog(request, model); //접속이력

		if ("Y".equals(popup)) {
			// popup=Y (조치 결과 보고서 작성 페이지 > 고장보고서 보기 클릭 시)
			return "/system3/ljh/water_resources/error/choice_error_report_read";
		} else {
			return "/system3/ljh/water_resources/error/error_report_read";
		}
	}

	// 고장 보고서 수정
	@RequestMapping("/error_report_update_form")
	public String errorRptUpdateForm(Integer doc_no, HttpServletRequest request, Model model) {
		System.out.println("LjhController errorRptUpdateForm Start");

		List<WaterResources> waterCategory = new ArrayList<WaterResources>();
		waterCategory = ljhService.getWaterCategory();		// 수자원 시설물 종류 SELECT

		List<Code> checkCodeList = new ArrayList<Code>();
		checkCodeList = ljhService.getCheckCode();			// 점검대상, 중분류, 소분류 SELECT

		BreakReport breakReport = new BreakReport();
		breakReport = ljhService.getErrorRpt(doc_no);		// 고장 보고서 SELECT

		String facility_category = breakReport.getFacility_category();
		List<WaterResources> wrCodeList = new ArrayList<WaterResources>();
		wrCodeList = getWRCode(facility_category);			// SELECT한 고장 보고서의 시설물 종류에 해당하는 시설물 코드 리스트

		String facility_code = breakReport.getFacility_code();
		List<Alarm> alarmList = new ArrayList<Alarm>();
		alarmList = ljhService.getAlarm(facility_code);		// 시설물 코드에 해당하는 알람 전체 SELECT

		List<Alarm> rptAlarmList = new ArrayList<Alarm>();
		rptAlarmList = ljhService.getErrorRptAlarm(doc_no);	// 고장 보고서에 등록된 알람 SELECT

		model.addAttribute("waterCategory", waterCategory);
		model.addAttribute("checkCodeList", checkCodeList);
		model.addAttribute("breakReport", breakReport);
		model.addAttribute("wrCodeList", wrCodeList);
		model.addAttribute("alarmList", alarmList);
		model.addAttribute("rptAlarmList", rptAlarmList);

		insertAccessLog(request, model); //접속이력

		return "/system3/ljh/water_resources/error/error_report_update";
	}

	// 고장 보고서 수정 실행
	@RequestMapping("/error_report_update")
	public String errorRptUpdate(BreakReport breakReport, Alarm alarm, HttpServletRequest request, Model model) {
		System.out.println("LjhController errorRptUpdate Start");

		System.out.println("breakReport -> " + breakReport);
		System.out.println("alarm -> " + alarm);

		int result = ljhService.errorRptUpdate(breakReport, alarm);

		insertAccessLog(request, model); //접속이력

		return "redirect:/error_report_read?doc_no=" + breakReport.getDoc_no();
	}

	// 고장 보고서 삭제
	@ResponseBody
	@RequestMapping("/error_report_delete")
	public int errorRptDelete(Integer doc_no, HttpServletRequest request, Model model) {
		System.out.println("LjhController LjhController Start");

		System.out.println("doc_no : " + doc_no);
		int result = ljhService.errorRptDelete(doc_no);

		insertAccessLog(request, model); //접속이력

		return result;
	}

	// 고장 보고서 검색
	@ResponseBody
	@RequestMapping("/search_error")
	public LjhResponse searchError(@RequestParam(defaultValue = "1") String currentPage, BreakReport breakReport, HttpServletRequest request, Model model) {
		System.out.println("LjhController searchError Start");

		breakReport.setTotal(ljhService.searchErrCnt(breakReport));

		Paging page = new Paging(breakReport.getTotal(), currentPage, 10);
		breakReport.setStart(page.getStart());
		breakReport.setEnd(page.getEnd());

		// System.out.println("endPage : " + page.getEndPage());

		List<BreakReport> breakRptList = new ArrayList<BreakReport>();
		breakRptList = ljhService.searchError(breakReport);

		LjhResponse ljhResponse = new LjhResponse();
		ljhResponse.setList(breakRptList);
		ljhResponse.setObj(page);

		insertAccessLog(request, model); //접속이력

		return ljhResponse;
	}


	//-----------------------------------------------------------------------------------------
	// 고장/조치결과보고 > 조치 결과 보고서 목록
	@RequestMapping("/action_report_list")
	public String actionRptList(String currentPage, HttpServletRequest request, Model model) {
		System.out.println("LjhController actionRptList Start");

		// 페이징 작업
		int total = ljhService.actionRptCount();

		Paging paging = new Paging(total, currentPage, 10);
		ActionReport actionRpt = new ActionReport();
		actionRpt.setStart(paging.getStart());
		actionRpt.setEnd(paging.getEnd());
		List<ActionReport> actionRptList = ljhService.getActionRptListPage(actionRpt);

		List<WaterResources> waterCategory = new ArrayList<WaterResources>();
		waterCategory = ljhService.getWaterCategory();		// 수자원 시설물 종류 SELECT

		model.addAttribute("actionRptList", actionRptList);
		model.addAttribute("page", paging);
		model.addAttribute("waterCategory", waterCategory);

		return "/system3/ljh/water_resources/error/action_report_list";
	}

	// 조치 결과 보고서 작성
	@RequestMapping("/action_report_write_form")
	public String actionRptWriteForm(HttpServletRequest request, Model model) {
		System.out.println("LjhController actionRptWriteForm Start");

		UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo");
		String user_id = userInfo.getUser_id();
		String user_name = userInfo.getUser_name();
		System.out.println("로그인 유저 : " + user_id + " / " + user_name);

		List<WaterResources> waterCategory = new ArrayList<WaterResources>();
		waterCategory = ljhService.getWaterCategory();

		List<Code> checkCodeList = new ArrayList<Code>();
		checkCodeList = ljhService.getCheckCode();

		model.addAttribute("waterCategory", waterCategory);
		model.addAttribute("checkCodeList", checkCodeList);
		model.addAttribute("user_id", user_id);
		model.addAttribute("user_name", user_name);
		
		insertAccessLog(request, model); //접속이력

		return "/system3/ljh/water_resources/error/action_report_write";
	}

	// 조치 결과 보고서 INSERT
	@RequestMapping("/action_report_write")
	public String actionRptWrite(ActionReport actionReport, HttpServletRequest request, Model model) {
		System.out.println("LjhController actionRptWrite Start");

		int result = ljhService.actionRptWrite(actionReport);
		
		insertAccessLog(request, model); //접속이력

		return "redirect:/action_report_list";
	}

	// 조치 결과 보고서 상세
	@RequestMapping("/action_report_read")
	public String actionRptRead(Integer doc_no, HttpServletRequest request, Model model) {
		System.out.println("LjhController actionRptRead Start");

		ActionReport actionRpt = new ActionReport();
		actionRpt = ljhService.getActionRpt(doc_no);

		model.addAttribute("actionRpt", actionRpt);
		
		insertAccessLog(request, model); //접속이력

		return "/system3/ljh/water_resources/error/action_report_read";
	}

	// 조치 결과 보고서 수정
	@RequestMapping("/action_report_update_form")
	public String actionRptUpdateForm(Integer doc_no, HttpServletRequest request, Model model) {
		System.out.println("LjhController actionRptUpdateForm Start");

		List<WaterResources> waterCategory = new ArrayList<WaterResources>();
		waterCategory = ljhService.getWaterCategory();		// 수자원 시설물 카테고리 SELECT

		List<Code> checkCodeList = new ArrayList<Code>();
		checkCodeList = ljhService.getCheckCode();			// 점검대상, 중분류, 소분류 SELECT

		ActionReport actionRpt = new ActionReport();
		actionRpt = ljhService.getActionRpt(doc_no);		// 조치 결과 보고서 SELECT

		String facility_category = actionRpt.getFacility_category();
		List<WaterResources> wrCodeList = new ArrayList<WaterResources>();
		wrCodeList = getWRCode(facility_category);			// SELECT한 고장 보고서의 시설물 종류에 해당하는 시설물 코드 리스트

		model.addAttribute("waterCategory", waterCategory);
		model.addAttribute("checkCodeList", checkCodeList);
		model.addAttribute("actionRpt", actionRpt);
		model.addAttribute("wrCodeList", wrCodeList);

		insertAccessLog(request, model); //접속이력

		return "/system3/ljh/water_resources/error/action_report_update";
	}

	// 조치 결과 보고서 수정 실행
	@RequestMapping("/action_report_update")
	public String actionRptUpdate(ActionReport actionReport, HttpServletRequest request, Model model) {
		System.out.println("LjhController actionRptUpdate Start");

		int result = ljhService.actionRptUpdate(actionReport);

		insertAccessLog(request, model); //접속이력

		return "redirect:/action_report_read?doc_no=" + actionReport.getDoc_no();
	}

	// 조치 결과 보고서 삭제
	@ResponseBody
	@RequestMapping("/action_report_delete")
	public int actionRptDelete(Integer doc_no, HttpServletRequest request, Model model) {
		System.out.println("LjhController actionRptDelete Start");

		int result = ljhService.actionRptDelete(doc_no);

		insertAccessLog(request, model); //접속이력

		return result;
	}

	// 조치 결과 보고서 검색
	@ResponseBody
	@RequestMapping("/search_action")
	public LjhResponse searchAction(@RequestParam(defaultValue = "1") String currentPage, ActionReport actionReport, HttpServletRequest request, Model model) {
		System.out.println("LjhController searchAction Start");

		actionReport.setTotal(ljhService.searchActCnt(actionReport));

		Paging page = new Paging(actionReport.getTotal(), currentPage, 10);
		actionReport.setStart(page.getStart());
		actionReport.setEnd(page.getEnd());

		List<ActionReport> actionRptList = new ArrayList<ActionReport>();
		actionRptList = ljhService.searchAction(actionReport);

		LjhResponse ljhResponse = new LjhResponse();
		ljhResponse.setList(actionRptList);
		ljhResponse.setObj(page);

		insertAccessLog(request, model); //접속이력

		return ljhResponse;
	}

	// 조치 결과 보고서 작성 > 고장보고서 보기
	@RequestMapping("/choice_error_report_list")
	public String choiceErrRpt(@RequestParam(defaultValue = "1") String currentPage, ActionReport actionReport, HttpServletRequest request, Model model) {
		System.out.println("LjhController choiceErrRpt Start");

		int total = ljhService.choiceErrRptCnt(actionReport);

		Paging page = new Paging(total, currentPage, 10);
		actionReport.setStart(page.getStart());
		actionReport.setEnd(page.getEnd());

		List<BreakReport> breakRptList = new ArrayList<BreakReport>();
		breakRptList = ljhService.choiceErrRptList(actionReport);

		model.addAttribute("breakRptList", breakRptList);
		model.addAttribute("page", page);

		insertAccessLog(request, model); //접속이력

		return "/system3/ljh/water_resources/error/choice_error_report_list";
	}



	//-----------------------------------------------------------------------------------------
	// 통계 페이지
	@RequestMapping("/chart")
	public String chart(String currentPage, HttpServletRequest request, Model model) {
		System.out.println("LjhController chart Start");

		// 페이징 작업
		int total = ljhService.actionRptCount();

		Paging paging = new Paging(total, currentPage, 5);
		ActionReport actionRpt = new ActionReport();
		actionRpt.setStart(paging.getStart());
		actionRpt.setEnd(paging.getEnd());
		List<ActionReport> actionRptList = ljhService.getActionRptListPage(actionRpt);

		model.addAttribute("actionRptList", actionRptList);
		model.addAttribute("page", paging);

		insertAccessLog(request, model); //접속이력

		return "/system3/ljh/chart/chart";
	}

	// 고장 및 조치 통계
	@ResponseBody
	@RequestMapping("/errorChart")
	public LjhResponse errorChart(HttpServletRequest request, Model model) {
		List<Integer> errorChart = new ArrayList<Integer>();
		errorChart = ljhService.errorChart();

		List<Integer> acitonChart = new ArrayList<Integer>();
		acitonChart = ljhService.actionChart();

		LjhResponse ljhResponse = new LjhResponse();
		ljhResponse.setList(errorChart);
		ljhResponse.setSecList(acitonChart);

		insertAccessLog(request, model); //접속이력

		return ljhResponse;
	}



}