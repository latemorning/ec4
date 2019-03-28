package egovframework.ec4.cmm.cbase.bpc.service;

import egovframework.ec4.cmm.service.EC4DefaultVO;

/**
 * @Class Name : BussplcDefaultVO.java
 * @Description : Bussplc Default VO class
 * @Modification Information
 *
 * @author harry
 * @since 2018.04.16
 * @version 1.0
 * @see
 *
 *      Copyright (C) All right reserved.
 */
public class BussplcDefaultVO extends EC4DefaultVO {

    private static final long serialVersionUID = 1L;

    private String searchBussplcNm = "";
    private String searchBussplcId = "";




    public String getSearchBussplcNm() {

        return searchBussplcNm;
    }


    public void setSearchBussplcNm(String searchBussplcNm) {

        this.searchBussplcNm = searchBussplcNm;
    }


    public String getSearchBussplcId() {

        return searchBussplcId;
    }


    public void setSearchBussplcId(String searchBussplcId) {

        this.searchBussplcId = searchBussplcId;
    }


}
