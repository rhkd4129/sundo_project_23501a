package com.postgres.sample.service.impl.kjo;

import java.util.List;

import org.springframework.stereotype.Service;

import com.postgres.sample.dto.OrgArea;
import com.postgres.sample.service.impl.dao.kjo.Kjo_OrgAreaDAO;
import com.postgres.sample.service.impl.dao.kjo.Kjo_UserInfoDAO;
import com.postgres.sample.service.kjo.OrgAreaService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrgAreaServiceImpl implements OrgAreaService{
	private final Kjo_OrgAreaDAO orgAreaDAO;
	
	@Override
	public List<OrgArea> findAllOrgArea() {
		// TODO Auto-generated method stub
		return orgAreaDAO.findAllOrgArea();
	}

}
