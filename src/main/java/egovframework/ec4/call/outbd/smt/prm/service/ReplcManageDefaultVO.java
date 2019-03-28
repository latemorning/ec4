package egovframework.ec4.call.outbd.smt.prm.service;

import egovframework.ec4.cmm.service.EC4DefaultVO;

public class ReplcManageDefaultVO extends EC4DefaultVO {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private String searchReplcCode = "";
    private String searchReplcTy = "";
    private String searchReplcNm = "";
    private String searchHdqrtrsCode = "";


    public ReplcManageDefaultVO() {
    }


    public String getSearchReplcCode() {

        return searchReplcCode;
    }


    public void setSearchReplcCode(String searchReplcCode) {

        this.searchReplcCode = searchReplcCode;
    }


    public String getSearchReplcTy() {

        return searchReplcTy;
    }


    public void setSearchReplcTy(String searchReplcTy) {

        this.searchReplcTy = searchReplcTy;
    }


    public String getSearchReplcNm() {

        return searchReplcNm;
    }


    public void setSearchReplcNm(String searchReplcNm) {

        this.searchReplcNm = searchReplcNm;
    }


    public String getSearchHdqrtrsCode() {

        return searchHdqrtrsCode;
    }


    public void setSearchHdqrtrsCode(String searchHdqrtrsCode) {

        this.searchHdqrtrsCode = searchHdqrtrsCode;
    }
}
