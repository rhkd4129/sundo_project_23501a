package com.postgres.sample.service.lkh;

import java.util.List;

import com.postgres.sample.dto.Code;
import com.postgres.sample.dto.Organization;
import com.postgres.sample.dto.WaterResources;

public interface WaterResourcesService {
	 List<WaterResources> SelectWaterResourceList();
	 List<Code> codeSelectList();
	 List<Organization> organizationSelectList();
}
