package egovframework.ec4.call.outbd.smt.ctm.service;

import egovframework.ec4.cmm.service.EC4DefaultVO;

public class CallTypeManageDefaultVO extends EC4DefaultVO {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private String searchCallTyCode = "";
    private String searchCallTyNm = "";


    public String getSearchCallTyCode() {

        return searchCallTyCode;
    }


    public void setSearchCallTyCode(String searchCallTyCode) {

        this.searchCallTyCode = searchCallTyCode;
    }


    public String getSearchCallTyNm() {

        return searchCallTyNm;
    }


    public void setSearchCallTyNm(String searchCallTyNm) {

        this.searchCallTyNm = searchCallTyNm;
    }

}
