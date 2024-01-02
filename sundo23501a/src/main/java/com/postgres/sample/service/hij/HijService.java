package com.postgres.sample.service.hij;

import java.sql.Date;
import java.util.List;

import com.postgres.sample.dto.CategoryVO;
import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.Flow;
import com.postgres.sample.dto.Observation;
import com.postgres.sample.dto.Organization;
import com.postgres.sample.dto.RainFall;
import com.postgres.sample.dto.WaterGate;
import com.postgres.sample.dto.WaterLevel;

public interface HijService {

	// 1. 관측소 - 목록
	List<Code> getCodeList(String field_name);	//코드 리스트
	int totalCount();	// 관측소 목록 갯수
	List<Observation> observationList(Observation observation); //관측소 목록 리스트
	List<Organization> getOrgList();	//기관코드, 기관명칭 가져오기
	List<Organization> getCategoryList(CategoryVO categoryVO);	// 특정 Table에서 필요한거 가져오기
	int obCreate(Observation observation);	//관측소 등록
	List<WaterGate> waterGateList(); //river_code, river_name 가져오기
	Observation getObservation(Observation observation);	//관측소 정보
	int obEdit(Observation observation);	// 수정시행
	int obDelete(Observation observation);	// 삭제시행
	int searchTotalO(Observation observation); // 검색 갯수
	List<Observation> searchO(Observation observation); // 관측소 검색
	
	// 2. 관측소 - 시자료 - 수위
	
	List<WaterLevel> waterLevelList(WaterLevel waterLevel);//수위 목록
	WaterLevel waterLevelStat(WaterLevel waterLevel);//수위 목록-통계
	int waterLevelTotal();				// 수위 총 갯수
	WaterLevel getWaterLevel(WaterLevel waterLevel); //조회
	int tEdit(WaterLevel waterLevel);	// 수위 수정
	int searchTotalW(WaterLevel waterLevel); //검색갯수
	List<WaterLevel> searchW(WaterLevel waterLevel); //수위 검색
	
	// 3. 관측소 - 시자료 - 강우량
	int rainFallTotal();
	List<RainFall> rainFallList(RainFall rainFall);
	RainFall rainFallStat(RainFall rainFall); //강우량-통계
	RainFall getRainFall(RainFall rainFall);
	int tEditR(RainFall rainFall);
	int searchTotalR(RainFall rainFall); //검색갯수
	List<RainFall> searchR(RainFall rainFall); //강우량 검색
	
	// 4. 관측소 - 시자료 - 우량
	int flowTotal();
	List<Flow> flowList(Flow flow);
	Flow getFlow(Flow flow);
	int tEditF(Flow flow);
	List<Flow> flowYearList();
	int searchTotalF(Flow flow);	// 검색 갯수
	List<Flow> searchF(Flow flow);  // 우량 검색
	
	
}
