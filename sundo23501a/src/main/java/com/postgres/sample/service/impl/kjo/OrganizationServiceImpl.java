package com.postgres.sample.service.impl.kjo;

import com.postgres.sample.dto.Organization;
import com.postgres.sample.service.impl.dao.kjo.Kjo_OrganizationDAO;
import com.postgres.sample.service.kjo.OrganizationService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrganizationServiceImpl implements OrganizationService {

    private final Kjo_OrganizationDAO kjo_OrganizationDAO;

    @Override
    public List<Organization> findAllOrgList() {
        return kjo_OrganizationDAO.findAllOrgList();
    }
}
