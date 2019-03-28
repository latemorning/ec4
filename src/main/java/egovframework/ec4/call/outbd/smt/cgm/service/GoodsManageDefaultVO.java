package egovframework.ec4.call.outbd.smt.cgm.service;

import egovframework.ec4.cmm.service.EC4DefaultVO;

public class GoodsManageDefaultVO extends EC4DefaultVO {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private String searchGoodsCode = "";
    private String searchGoodsNm = "";


    public String getSearchGoodsCode() {

        return searchGoodsCode;
    }


    public void setSearchGoodsCode(String searchGoodsCode) {

        this.searchGoodsCode = searchGoodsCode;
    }


    public String getSearchGoodsNm() {

        return searchGoodsNm;
    }


    public void setSearchGoodsNm(String searchGoodsNm) {

        this.searchGoodsNm = searchGoodsNm;
    }

}
