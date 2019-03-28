package egovframework.ec4.cmm.cbase.cmt.service;

import egovframework.ec4.cmm.service.EC4DefaultVO;

/**
 * 공통코드 관리
 *
 * @author harry
 * @since 2018.05.15
 */
public class CmmCodeDefaultVO extends EC4DefaultVO {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private String searchCode = "";
    private String searchCodeId = "";
    private String searchCodeIdNm = "";
    private String searchUseAt = "";
    private String searchClCode = "";
    private String searchUpCode = "";

    

    public String getSearchCode() {
		return searchCode;
	}


	public void setSearchCode(String searchCode) {
		this.searchCode = searchCode;
	}


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


    public String getSearchUseAt() {

        return searchUseAt;
    }


    public void setSearchUseAt(String searchUseAt) {

        this.searchUseAt = searchUseAt;
    }


    public String getSearchClCode() {

        return searchClCode;
    }


    public void setSearchClCode(String searchClCode) {

        this.searchClCode = searchClCode;
    }


    public String getSearchUpCode() {

        return searchUpCode;
    }


    public void setSearchUpCode(String searchUpCode) {

        this.searchUpCode = searchUpCode;
    }

}
