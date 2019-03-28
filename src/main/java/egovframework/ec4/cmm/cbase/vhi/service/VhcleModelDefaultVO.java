package egovframework.ec4.cmm.cbase.vhi.service;

import egovframework.ec4.cmm.service.EC4DefaultVO;

/**
 * @Class Name : VhcleModelDefaultVO.java
 * @Description : VhcleModel Default VO class
 * @Modification Information
 *
 * @author harry
 * @since 2018.04.16
 * @version 1.0
 * @see
 *
 *      Copyright (C) All right reserved.
 */
public class VhcleModelDefaultVO extends EC4DefaultVO {

    private static final long serialVersionUID = 1L;

    private String searchVhcleMakrCode = "";    // 제조사
    private String searchVhctyCode = "";
    private String searchVhcleModelNm = "";
    private String searchVhcleModelId = "";   // 모델ID
    private String searchDetailModelNm = "";
    private String searchMdyrBegin = "";
    private String searchMdyrEnd = "";


    public String getSearchVhcleMakrCode() {

        return searchVhcleMakrCode;
    }


    public void setSearchVhcleMakrCode(String searchVhcleMakrCode) {

        this.searchVhcleMakrCode = searchVhcleMakrCode;
    }


    public String getSearchVhctyCode() {

        return searchVhctyCode;
    }


    public void setSearchVhctyCode(String searchVhctyCode) {

        this.searchVhctyCode = searchVhctyCode;
    }


    public String getSearchVhcleModelNm() {

        return searchVhcleModelNm;
    }


    public void setSearchVhcleModelNm(String searchVhcleModelNm) {

        this.searchVhcleModelNm = searchVhcleModelNm;
    }


    public String getSearchVhcleModelId() {

        return searchVhcleModelId;
    }


    public void setSearchVhcleModelId(String searchVhcleModelId) {

        this.searchVhcleModelId = searchVhcleModelId;
    }


    public String getSearchDetailModelNm() {

        return searchDetailModelNm;
    }


    public void setSearchDetailModelNm(String searchDetailModelNm) {

        this.searchDetailModelNm = searchDetailModelNm;
    }


    public String getSearchMdyrBegin() {

        return searchMdyrBegin;
    }


    public void setSearchMdyrBegin(String searchMdyrBegin) {

        this.searchMdyrBegin = searchMdyrBegin;
    }


    public String getSearchMdyrEnd() {

        return searchMdyrEnd;
    }


    public void setSearchMdyrEnd(String searchMdyrEnd) {

        this.searchMdyrEnd = searchMdyrEnd;
    }

}
