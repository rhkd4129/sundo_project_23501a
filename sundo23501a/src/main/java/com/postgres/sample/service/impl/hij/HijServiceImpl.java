package com.postgres.sample.service.impl.hij;

import java.sql.Date;
import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import com.postgres.sample.dto.CategoryVO;
import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.Flow;
import com.postgres.sample.dto.Observation;
import com.postgres.sample.dto.Organization;
import com.postgres.sample.dto.RainFall;
import com.postgres.sample.dto.WaterGate;
import com.postgres.sample.dto.WaterLevel;
import com.postgres.sample.service.hij.HijService;
import com.postgres.sample.service.impl.dao.hij.HijDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HijServiceImpl extends EgovAbstractServiceImpl implements HijService {
	private final HijDao hd;
	

	// 관측소 목록 갯수
	@Override
	public int totalCount() {
		int totalCount = hd.ijTotalCount();
		System.out.println("HijServiceImpl totalCount START");
		return totalCount;
	}
	
	// 관측소 목록 리스트
	@Override
	public List<Observation> observationList(Observation observation) {
		
		System.out.println("HijServiceImpl observationList START");
		List<Observation> observationList = hd.ijObservationList(observation);
		return observationList;
	}
	
	// 관측방식 리스트
	@Override
	public List<Code> getCodeList(String field_name) {
		System.out.println("HijServiceImpl getCodeList START");
		List<Code> codeList = hd.ijGetCodeList(field_name);
		return codeList;
	}
	
	//운영기관 리스트
	@Override
	public List<Organization> getOrgList() {
		System.out.println("HijServiceImpl getOrgList START");
		List<Organization> orgList = hd.ijGetOrgList();
		return orgList;
	}
	
	//행정구역 리스트	
	@Override
	public List<Organization> getCategoryList(CategoryVO categoryVO) {
		System.out.println("HijServiceImpl getCategoryList START");
		List<Organization> categoryList = hd.ijGetCategoryList(categoryVO);
		return categoryList;
	}
	
	//관측소 등록
	@Override
	public int obCreate(Observation observation) {
		System.out.println("HijServiceImpl obCreate START");
		int obCreate = hd.ijObCreate(observation);
		return obCreate;
	}

	@Override
	public List<WaterGate> waterGateList() {
		System.out.println("HijServiceImpl waterGateList START");
		List<WaterGate> waterGateList = hd.ijWaterGateList();
		return waterGateList;
	}

	@Override
	public Observation getObservation(Observation observation) {
		System.out.println("HijServiceImpl getObservation START");
		Observation result = hd.ijGetObservation(observation);
		return result;
	}
	
	// 수정 시행
	@Override
	public int obEdit(Observation observation) {
		System.out.println("HijServiceImpl obEdit START");
		int obEdit = hd.ijObEdit(observation);
		return obEdit;
	}
	
	// 관측소 삭제
	@Override
	public int obDelete(Observation observation) {
		System.out.println("HijServiceImpl obDelete START");
		int obDelete = hd.ijObDelete(observation);
		return obDelete;
	}
	
	// 검색 갯수
	@Override
	public int searchTotalO(Observation observation) {
		System.out.println("HijServiceImpl searchTotalO START");
		int totalCount = hd.ijSearchTotalO(observation);
		System.out.println("HijServiceImpl totalCount:"+totalCount);
		return totalCount;
	}
	
	// 관측소 검색
	@Override
	public List<Observation> searchO(Observation observation) {
		System.out.println("HijServiceImpl searchO START");
		List<Observation> searchO = hd.ijSearchO(observation);
		
		System.out.println("searchO 사이즈 : " + searchO.size());
		return searchO;
	}

//---------------------------------------------------------------------------------	
	// 시자료 목록
	@Override
	public List<WaterLevel> waterLevelList(WaterLevel waterLevel) {
		System.out.println("HijServiceImpl waterLevelList START");
		List<WaterLevel> waterLevelList = hd.ijWaterLevelList(waterLevel);
		return waterLevelList;
	}
	// 시자료 목록 : 통계
	@Override
	public WaterLevel waterLevelStat(WaterLevel waterLevel) {
		System.out.println("HijServiceImpl waterLevelStat START");
		WaterLevel waterLevelStat = hd.ijWaterLevelStat(waterLevel);
		return waterLevelStat;
	}

	
	// 수위 전체값
	@Override
	public int waterLevelTotal() {
		int totalCount = hd.ijWaterLevelTotal();
		System.out.println("HijServiceImpl totalCount START");
		return totalCount;
	}
	
	// 수위 pk에 따른 값
	@Override
	public WaterLevel getWaterLevel(WaterLevel waterLevel) {
		System.out.println("HijServiceImpl getWaterLevel START");
		
		waterLevel = hd.ijGetWaterLevel(waterLevel);
		return waterLevel;
	}
	
	// 수위 수정
	@Override
	public int tEdit(WaterLevel waterLevel) {
		System.out.println("HijServiceImpl tEdit START");
		int tEdit = hd.ijTEdit(waterLevel);
		return tEdit;
	}
//-------------------------------------------------------------------------
	@Override
	public int rainFallTotal() {
		int totalCount = hd.ijRainFallTotal();
		System.out.println("HijServiceImpl rainFallTotal START");
		return totalCount;
	}

	@Override
	public List<RainFall> rainFallList(RainFall rainFall) {
		System.out.println("HijServiceImpl waterLevelList START");
		List<RainFall> rainFallList = hd.ijRainFallList(rainFall);
		return rainFallList;
	}

	@Override
	public RainFall rainFallStat(RainFall rainFall) {
		System.out.println("HijServiceImpl rainFallStat START");
		RainFall rainFallStat = hd.ijRainFallStat(rainFall);
		return rainFallStat;
	}

	@Override
	public RainFall getRainFall(RainFall rainFall) {
		System.out.println("HijServiceImpl getRainFall START");
		rainFall = hd.ijGetRainFall(rainFall);
		return rainFall;
	}

	@Override
	public int tEditR(RainFall rainFall) {
		System.out.println("HijServiceImpl tEditR START");
		int tEditR = hd.ijTEditR(rainFall);
		return tEditR;
	}
//-------------------------------------------------------------------------
	@Override
	public int flowTotal() {
		int totalCount = hd.ijFlowTotal();
		System.out.println("HijServiceImpl flowTotal START");
		return totalCount;
	}

	@Override
	public List<Flow> flowList(Flow flow) {
		System.out.println("HijServiceImpl flowList START");
		List<Flow> flowList = hd.ijFlowList(flow);
		return flowList;
	}
	
	@Override
	public Flow getFlow(Flow flow) {
		System.out.println("HijServiceImpl getFlow START");
		flow = hd.ijGetFlow(flow);
		return flow;
	}

	@Override
	public int tEditF(Flow flow) {
		System.out.println("HijServiceImpl tEditF START");
		int tEditF = hd.ijTEditF(flow);
		return tEditF;
	}

	@Override
	public List<Flow> flowYearList() {
		System.out.println("HijServiceImpl flowYearList START");
		List<Flow> flowYearList = hd.ijFlowYearList();
		return flowYearList;
	}
	
	
	//----------------------------------------------------------------------------
	

	// 수위 검색 갯수
	@Override
	public int searchTotalW(WaterLevel waterLevel) {
		System.out.println("HijServiceImpl searchTotalW START");
		
		int totalCount = hd.ijSearchTotalW(waterLevel);
		
		return totalCount;
	}
	// 수위 검색
	@Override
	public List<WaterLevel> searchW(WaterLevel waterLevel) {
		System.out.println("HijServiceImpl searchW START");
		
    	System.out.println("river_code s: " + waterLevel.getRiver_code() );
    	System.out.println("start_date s: " + waterLevel.getStart_date() );
    	System.out.println("end_date s: " + waterLevel.getEnd_date() );
    	
		List<WaterLevel> searchWlist = hd.ijSearchW(waterLevel);
		
		System.out.println("searchWlist 사이즈s : " + searchWlist.size());
		return searchWlist;
	}
	
	// 강우량 검색 갯수
	@Override
	public int searchTotalR(RainFall rainFall) {
		int totalCount = hd.ijSearchTotalR(rainFall);
		System.out.println("HijServiceImpl searchTotalR START");
		return totalCount;
	}
	// 강우량 검색
	@Override
	public List<RainFall> searchR(RainFall rainFall) {
		System.out.println("HijServiceImpl searchR START");
		List<RainFall> searchR = hd.ijSearchR(rainFall);
		System.out.println("searchR 사이즈 : " + searchR.size());
		return searchR;
	}
	//우량 검색 갯수
	@Override
	public int searchTotalF(Flow flow) {
		int totalCount = hd.ijSearchTotalF(flow);
		System.out.println("HijServiceImpl searchTotalF START");
		return totalCount;
	}
	// 우량 검색
	@Override
	public List<Flow> searchF(Flow flow) {
		System.out.println("HijServiceImpl searchF START");
		List<Flow> searchF = hd.ijSearchF(flow);
		System.out.println("searchF 사이즈 : " + searchF.size());
		return searchF;
	}




}
