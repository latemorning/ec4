package egovframework.ec4.call.outbd.cmpgn.service;

import egovframework.ec4.cmm.service.EC4DefaultVO;

/**
 * 캠페인 관리
 *
 * @author harry
 * @since 2018.06.25
 */
public class CmpgnDefaultVO extends EC4DefaultVO {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private String searchCmpgnNm = "";
    private String searchBeginDe = "";
    private String searchEndDe = "";
    private String searchSttusCode = "";


    public String getSearchCmpgnNm() {

        return searchCmpgnNm;
    }


    public void setSearchCmpgnNm(String searchCmpgnNm) {

        this.searchCmpgnNm = searchCmpgnNm;
    }


    public String getSearchBeginDe() {

        return searchBeginDe;
    }


    public void setSearchBeginDe(String searchBeginDe) {

        this.searchBeginDe = searchBeginDe;
    }


    public String getSearchEndDe() {

        return searchEndDe;
    }


    public void setSearchEndDe(String searchEndDe) {

        this.searchEndDe = searchEndDe;
    }


    public String getSearchSttusCode() {

        return searchSttusCode;
    }


    public void setSearchSttusCode(String searchSttusCode) {

        this.searchSttusCode = searchSttusCode;
    }

}
