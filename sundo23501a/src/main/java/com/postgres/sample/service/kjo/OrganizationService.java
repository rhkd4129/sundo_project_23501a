package com.postgres.sample.service.kjo;

import com.postgres.sample.dto.Organization;

import java.util.List;

public interface OrganizationService {
    List<Organization> findAllOrgList();
}
