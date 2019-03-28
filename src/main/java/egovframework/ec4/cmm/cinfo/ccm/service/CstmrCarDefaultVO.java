package egovframework.ec4.cmm.cinfo.ccm.service;

import egovframework.ec4.cmm.service.EC4DefaultVO;

/**
 * 고객차량정보
 *
 * @author harry
 * @since 2018.07.23
 */
public class CstmrCarDefaultVO extends EC4DefaultVO {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private String searchVin = "";
    private String searchCarnbr = "";


    public String getSearchVin() {

        return searchVin;
    }


    public void setSearchVin(String searchVin) {

        this.searchVin = searchVin;
    }


    public String getSearchCarnbr() {

        return searchCarnbr;
    }


    public void setSearchCarnbr(String searchCarnbr) {

        this.searchCarnbr = searchCarnbr;
    }

}
