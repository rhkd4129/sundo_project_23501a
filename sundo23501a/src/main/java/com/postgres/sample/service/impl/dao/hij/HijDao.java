package com.postgres.sample.service.impl.dao.hij;

import java.sql.Date;
import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.postgres.sample.dto.CategoryVO;
import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.Flow;
import com.postgres.sample.dto.Observation;
import com.postgres.sample.dto.Organization;
import com.postgres.sample.dto.RainFall;
import com.postgres.sample.dto.WaterGate;
import com.postgres.sample.dto.WaterLevel;

@Mapper
public interface HijDao {
	
	// 1. 관측소 - 목록
	public int ijTotalCount();
	public List<Observation> ijObservationList(Observation observation);
	public List<Code> ijGetCodeList(String field_name);
	public List<Organization> ijGetOrgList();
	public List<Organization> ijGetCategoryList(CategoryVO categoryVO);
	public int ijObCreate(Observation observation);
	public Observation ijGetObservation(Observation observation);
	public List<WaterGate> ijWaterGateList();
	public int ijObEdit(Observation observation);	//관측소 수정시행
	public int ijObDelete(Observation observation);	// 관측소 삭제
	public int ijSearchTotalO(Observation observation); // 검색 갯수
	public List<Observation> ijSearchO(Observation observation); //검색목록
	
	// 2. 관측소 - 시자료 - 수위
	public List<WaterLevel> ijWaterLevelList(WaterLevel waterLevel);//수위정보
	public WaterLevel ijWaterLevelStat(WaterLevel waterLevel);//수위정보-통계
	public int ijWaterLevelTotal();
	public WaterLevel ijGetWaterLevel(WaterLevel waterLevel); //수위 조회
	public int ijTEdit(WaterLevel waterLevel);	// 수위 수정
	public int ijSearchTotalW(WaterLevel waterLevel);	//수위 검색 갯수
	public List<WaterLevel> ijSearchW(WaterLevel waterLevel); // 수위 검색
	
	//3. 관측소 - 시자료 - 강우량
	public List<RainFall> ijRainFallList(RainFall rainFall);
	public RainFall ijRainFallStat(RainFall rainFall); //강우량-통계
	public int ijRainFallTotal();
	public RainFall ijGetRainFall(RainFall rainFall);
	public int ijTEditR(RainFall rainFall);
	public int ijSearchTotalR(RainFall rainFall); // 강우량 검색 갯수
	public List<RainFall> ijSearchR(RainFall rainFall); //강우량 검색
	
	//4. 관측소 - 시자료 - 우량
	public int ijFlowTotal();
	public List<Flow> ijFlowList(Flow flow);
	public Flow ijGetFlow(Flow flow);
	public int ijTEditF(Flow flow);
	public List<Flow> ijFlowYearList();
	public int ijSearchTotalF(Flow flow); // 우량 검색 갯수
	public List<Flow> ijSearchF(Flow flow); // 우량 검색
	
	

	

	
}
