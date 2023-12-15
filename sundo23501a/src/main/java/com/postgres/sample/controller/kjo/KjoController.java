package com.postgres.sample.controller.kjo;

import java.time.LocalDate;
import java.util.List;

import javax.annotation.Resource;

import com.postgres.sample.dto.*;
import com.postgres.sample.service.kjo.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import lombok.RequiredArgsConstructor;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


//@RestController
@Controller
@RequiredArgsConstructor
public class KjoController {
	private static final Logger Logger = LoggerFactory.getLogger(KjoController.class);
	
	
    private final BoardService boardservice;
    private final ObservationService observice;
    private final WaterResourcesService wrservice;
    private final UserInfoService userservice;
    private final OrgAreaService orgService;
    private final CheckReportService checkReportService;
    private final CheckListService checkListService;
    private final CheckItemInfoService checkItemInfoService;


    @GetMapping("/hello")
    public List<BoardVO> HelloWorld() throws Exception {
        return (List<BoardVO>) boardservice.SelectBoardList();
    }
    @ResponseBody
    @GetMapping("/hello2")
    public List<Organization> HelloWorld_v2() throws Exception {
    	System.out.println("hello2");
        return (List<Organization>) boardservice.SelectBoardList();
    }
    @ResponseBody
    @GetMapping("/observationtest")
    public List<Observation> HelloWorld_v10() throws Exception {
    	System.out.println("hi");
    	
        return (List<Observation>) observice.SelectObsList();
    }   
    

    @GetMapping("/water_resourcesList")
    public String waterResoucesList(@RequestParam(defaultValue = "1") String currentPage, Model model) {
    	System.out.println("water_resourcesList");
    	WaterResources wr = new WaterResources();
    	//	페이징 위한 수자원시설물 개수
    	wr.setTotal(wrservice.cntWaterResource().getTotal());
    	Paging page = new Paging(wr.getTotal(), currentPage,10);
    	wr.setStart(page.getStart());
    	wr.setEnd(page.getEnd());
    	
    	List<WaterResources> wrctgList = wrservice.findFacilityCategory();
    	List<OrgArea> orgList = orgService.findAllOrgArea();
    	List<WaterResources> wrList = wrservice.PaingWaterResourceLists(wr);

    	model.addAttribute("wrctgList",wrctgList);
    	model.addAttribute("orgList",orgList);
    	model.addAttribute("wrList",wrList);
    	model.addAttribute("page",page);
    	return "kjo/water_resources/water_resourcesList";
    }

    @ResponseBody
    @GetMapping("/facility_code_List")
    public List<WaterResources> facilityCodeList(@RequestParam String facility_category) {
    	
        WaterResources wr = new WaterResources();
        wr.setFacility_category(facility_category);
        List<WaterResources> wrList = wrservice.findFacilityAddrbyCategory(wr);
        System.out.println(wrList);
        return wrList;
    }
    
    @ResponseBody
    @GetMapping("/searchWaterResources")
    public KjoResponse searchWaterResources(@RequestParam(defaultValue = "1") String currentPage, WaterResources wr) {
    	wr.toString();
        wr.setTotal(wrservice.searchcnt(wr).getTotal());
        Paging page = new Paging(wr.getTotal(), currentPage,10);
        wr.setStart(page.getStart());
        wr.setEnd(page.getEnd());

        List<WaterResources> wrList = wrservice.searchWaterResources(wr);
        System.out.println(wrList);
        KjoResponse response = new KjoResponse();
        response.setObj(page);
        response.setObjList(wrList);

//        KjoResponse response = KjoResponse.builder()
//                .objList(wrList)
//                .obj(page)
//                .build();

        return response;

    }
    

    @GetMapping("/checkresultform")
    public String checkresult(WaterResources wr, Model model) throws Exception {
    	System.out.println("checkresult");
        wr= wrservice.findWaterResourcesById(wr);


        model.addAttribute("WaterResources",wr);
    	
        return "kjo/check/checkresultform";
    }
    
    @PostMapping("/checkresultSave")
    public String checkresultSave(KJO_CheckReport cr, RedirectAttributes redirectAttributes) {
        //  입력된 사용자
        UserInfo ui = new UserInfo();
        ui.setUser_name(cr.getUser_name());
        ui.setUser_position(cr.getUser_position());
        ui.setUser_department(cr.getUser_department());

        WaterResources wr = new WaterResources();
        //  수자원정보
        wr.setFacility_code(cr.getFacility_code());
        UserInfo uid = (userservice.findUserId(ui));
        if (uid.equals(null)) {

            redirectAttributes.addAttribute("WaterResources",wr);
            return "redirect/checkresultSave";
        }

        CheckReport checkReport = new CheckReport();
        checkReport.setTotal(checkReportService.cntByFacilityCode(checkReport).getTotal());

        checkReport.setDoc_no(checkReport.getTotal()+1);      //글번호
        checkReport.setFacility_code(cr.getFacility_code());    //시설물코드
        checkReport.setWeather(cr.getWeather());        //날씨
        checkReport.setCheck_date(cr.getCheck_date());  //  점검일자

        String userId = uid.getUser_id();               //사용자ID
        checkReport.setUser_id(userId);
        checkReport.setCheck_result(cr.getCheck_result());  //점검결과
        checkReport.setSpec_memo(cr.getSpec_memo());        //특이항
// 다른 필드 설정
        checkReport.setCreate_datetime(String.valueOf(LocalDate.now()));

        int result = checkReportService.inputChkReport(checkReport);
/*              chkList저장                                                */
        String notes = cr.getNote();
        String grades = cr.getCheck_grade();
        String[] noteArray = notes.split("\\|");
        String[] gradeArray = grades.split("\\|");
        List<CheckItemInfo> chkItemInfoList = checkItemInfoService.findAllCheckItemInfo();



        CheckList chkList = new CheckList();
        int chklistresult = 0;

        chkList.setDoc_no(checkReport.getDoc_no());
        chkList.setFacility_code(checkReport.getFacility_code());
        for (int i = 0; i < chkItemInfoList.size(); i++) {
            chkList.setCheck_category(chkItemInfoList.get(i).getCheck_category());
            chkList.setCheck_item(chkItemInfoList.get(i).getCheck_item());
            chkList.setCheck_grade(gradeArray[i]);
            chkList.setNote(noteArray[i]);
            chklistresult += checkListService.inputChkList(chkList);
        }





//        values(#{doc_no},#{facility_code},#{check_category},#{check_item},#{check_grade},#{note})
//        int chklistresult = checkListService.inputChkList(chkList);
//        글번호(PK)(FK)	N/A	INTEGER
//        시설물 코드(FK)	N/A	VARCHAR(100)
//        점검위치(FK)	N/A	VARCHAR(10)
//        점검항목(FK)	N/A	VARCHAR(10)
//        평가점수	N/A	VARCHAR(3)
//        비고	N/A	VARCHAR(300)



        return null;
    }



    
    
	
}