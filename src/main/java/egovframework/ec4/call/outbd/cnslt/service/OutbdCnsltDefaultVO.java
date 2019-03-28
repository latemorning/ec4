package egovframework.ec4.call.outbd.cnslt.service;

import egovframework.ec4.cmm.service.EC4DefaultVO;

/**
 * 아웃바운드 상담
 *
 * @author harry
 * @since 2018.07.23
 */
public class OutbdCnsltDefaultVO extends EC4DefaultVO {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private String searchHpclId = "";
    private String searchCmpgnId = "";
    private String searchCstmrEsntlId = "";
    private String searchVhcleEsntlId = "";
    private String searchRceptNo = "";
    private String searchIntrfcSysCode = "";
    private String searchHpclTelno = "";


    public String getSearchHpclId() {

        return searchHpclId;
    }


    public void setSearchHpclId(String searchHpclId) {

        this.searchHpclId = searchHpclId;
    }


    public String getSearchCmpgnId() {

        return searchCmpgnId;
    }


    public void setSearchCmpgnId(String searchCmpgnId) {

        this.searchCmpgnId = searchCmpgnId;
    }


    public String getSearchCstmrEsntlId() {

        return searchCstmrEsntlId;
    }


    public void setSearchCstmrEsntlId(String searchCstmrEsntlId) {

        this.searchCstmrEsntlId = searchCstmrEsntlId;
    }


    public String getSearchVhcleEsntlId() {

        return searchVhcleEsntlId;
    }


    public void setSearchVhcleEsntlId(String searchVhcleEsntlId) {

        this.searchVhcleEsntlId = searchVhcleEsntlId;
    }


    public String getSearchRceptNo() {

        return searchRceptNo;
    }


    public void setSearchRceptNo(String searchRceptNo) {

        this.searchRceptNo = searchRceptNo;
    }


    public String getSearchIntrfcSysCode() {

        return searchIntrfcSysCode;
    }


    public void setSearchIntrfcSysCode(String searchIntrfcSysCode) {

        this.searchIntrfcSysCode = searchIntrfcSysCode;
    }


    public String getSearchHpclTelno() {

        return searchHpclTelno;
    }


    public void setSearchHpclTelno(String searchHpclTelno) {

        this.searchHpclTelno = searchHpclTelno;
    }

}
