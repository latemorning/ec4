package egovframework.ec4.cmm.cbase.ctm.service;

import egovframework.ec4.cmm.service.EC4DefaultVO;

/**
 * 상담유형 관리
 *
 * @author harry
 * @since 2018.05.18
 */
public class CnsltTypeDefaultVO extends EC4DefaultVO {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private String searchParntsCodeId = "";
    private String searchCnsltSeCode = "";


    public String getSearchParntsCodeId() {

        return searchParntsCodeId;
    }


    public void setSearchParntsCodeId(String searchParntsCodeId) {

        this.searchParntsCodeId = searchParntsCodeId;
    }


    public String getSearchCnsltSeCode() {

        return searchCnsltSeCode;
    }


    public void setSearchCnsltSeCode(String searchCnsltSeCode) {

        this.searchCnsltSeCode = searchCnsltSeCode;
    }

}
