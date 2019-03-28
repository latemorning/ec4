package egovframework.ec4.call.outbd.hpcl.service;

import egovframework.ec4.cmm.service.EC4DefaultVO;

/**
 * 상담원 Default VO
 *
 * @author harry
 *
 */
public class CnslrDefaultVO extends EC4DefaultVO {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private String searchCnslrId = "";
    private String searchCnslrNm = "";

    private String searchUserNm = "";
    private String searchEmplyrId = "";


    public String getSearchCnslrId() {

        return searchCnslrId;
    }


    public void setSearchCnslrId(String searchCnslrId) {

        this.searchCnslrId = searchCnslrId;
    }


    public String getSearchCnslrNm() {

        return searchCnslrNm;
    }


    public void setSearchCnslrNm(String searchCnslrNm) {

        this.searchCnslrNm = searchCnslrNm;
    }


    public String getSearchUserNm() {

        return searchUserNm;
    }


    public void setSearchUserNm(String searchUserNm) {

        this.searchUserNm = searchUserNm;
    }


    public String getSearchEmplyrId() {

        return searchEmplyrId;
    }


    public void setSearchEmplyrId(String searchEmplyrId) {

        this.searchEmplyrId = searchEmplyrId;
    }

}
