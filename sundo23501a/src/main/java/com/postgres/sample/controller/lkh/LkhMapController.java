package com.postgres.sample.controller.lkh;


import com.postgres.sample.controller.kjo.KjoController;
import com.postgres.sample.dto.KjoResponse;
import com.postgres.sample.dto.Observation;
import com.postgres.sample.dto.Paging;
import com.postgres.sample.service.map.MapService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/realTimeSystem")
public class LkhMapController {
    private static final org.slf4j.Logger Logger = LoggerFactory.getLogger(KjoController.class);
    private final MapService mapService;

    @GetMapping("/layer")
    public String waterResourceStatistics(Model model){
        return "system2/lkh/waterResourceMapSystem/Layer";
    }
    @ResponseBody
    @GetMapping("/obsrvlist")
    public KjoResponse obsrvlist(Observation ov){
        Logger.info("obsrvlist START");

        ov.setTotal(mapService.CntObservationAll().getTotal());
        Paging page = new Paging(ov.getTotal(), ov.getCurrentPage(), 30);
        ov.setStart(page.getStart());
        ov.setEnd(page.getEnd());

        List<Observation> OVList = mapService.findObservationAll(ov);

        KjoResponse response = new KjoResponse();
        response.setObj(page);
        response.setObjList(OVList);

        Logger.info("obsrvlist END");
        return response;
    }

}
