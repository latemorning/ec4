package egovframework.ec4.cmm.cbase.cmt.service;

import egovframework.ec4.cmm.service.EC4DefaultVO;

public class DetailCodeDefaultVO extends EC4DefaultVO {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private String searchCodeId = "";
    private String searchCodeIdNm = "";
    private String searchCode = "";
    private String searchCodeNm = "";
    private String searchUseAt = "";


    public String getSearchCodeId() {

        return searchCodeId;
    }


    public void setSearchCodeId(String searchCodeId) {

        this.searchCodeId = searchCodeId;
    }


    public String getSearchCodeIdNm() {

        return searchCodeIdNm;
    }


    public void setSearchCodeIdNm(String searchCodeIdNm) {

        this.searchCodeIdNm = searchCodeIdNm;
    }


    public String getSearchCode() {

        return searchCode;
    }


    public void setSearchCode(String searchCode) {

        this.searchCode = searchCode;
    }


    public String getSearchCodeNm() {

        return searchCodeNm;
    }


    public void setSearchCodeNm(String searchCodeNm) {

        this.searchCodeNm = searchCodeNm;
    }


    public String getSearchUseAt() {

        return searchUseAt;
    }


    public void setSearchUseAt(String searchUseAt) {

        this.searchUseAt = searchUseAt;
    }

}
