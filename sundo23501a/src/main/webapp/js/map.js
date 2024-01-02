function call_observation(type){


    // rainfall
    // waterlevel



    $.ajax({
        url         : `https://api.hrfco.go.kr/A83AF5E2-7930-4FF2-8C3A-3B27DF327F94/${type}/info.json`,
        dataType    : 'json',
        success      : function(data) {
            console.log("API 데이터 받기 성공")
            console.log(data);
            const filteredData = data.content
                .filter(item => {
                    const address = item.addr.trim();
                    return address.startsWith('서울') || address.startsWith('경기도');
                })
                .map(item => ({
                    WLOBSCD: item.wlobscd,
                    OBSNM: item.obsnm,
                    AGCNM: item.agcnm,
                    ADDR: item.addr,
                    ETCADDR: item.etcaddr,
                    LON: item.lon,
                    LAT: item.lat
                }));
            console.log(filteredData);
        }

    })
}