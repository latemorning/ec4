package egovframework.ec4.cmm.cinfo.ctm.service;

import egovframework.ec4.cmm.service.EC4DefaultVO;

/**
 * 고객 VO
 *
 * @author harry
 * @since 2018.07.25
 */
public class CstmrDefaultVO extends EC4DefaultVO {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private String searchCstmrNm = "";


    public String getSearchCstmrNm() {

        return searchCstmrNm;
    }


    public void setSearchCstmrNm(String searchCstmrNm) {

        this.searchCstmrNm = searchCstmrNm;
    }

}
