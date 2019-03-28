package egovframework.ec4.cmm.cbase.ctm.service;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 상담유형 VO
 *
 * @author harry
 * @since 2018.05.18
 */
public class CnsltTypeVO extends CnsltTypeDefaultVO {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private String codeId = "";
    private String codeId1 = "";
    private String codeId2 = "";
    private String codeId3 = "";
    private String codeId4 = "";
    private String codeNm = "";
    private String codeNm1 = "";
    private String codeNm2 = "";
    private String codeNm3 = "";
    private String codeNm4 = "";
    private String parntsCodeId = "";
    private String cnsltSeCode = "";
    private String cnsltSeNm = "";
    private String sortOrdr = "";
    private String useAt = "";

    private String frstRegistPnttm = "";
    private String frstRegisterId = "";
    private String lastUpdtPnttm = "";
    private String lastUpdusrId = "";
    
    
    


    public String getCodeId1() {
		return codeId1;
	}


	public void setCodeId1(String codeId1) {
		this.codeId1 = codeId1;
	}


	public String getCodeId2() {
		return codeId2;
	}


	public void setCodeId2(String codeId2) {
		this.codeId2 = codeId2;
	}


	public String getCodeId3() {
		return codeId3;
	}


	public void setCodeId3(String codeId3) {
		this.codeId3 = codeId3;
	}


	public String getCodeId4() {
		return codeId4;
	}


	public void setCodeId4(String codeId4) {
		this.codeId4 = codeId4;
	}


	public String getCodeNm1() {
		return codeNm1;
	}


	public void setCodeNm1(String codeNm1) {
		this.codeNm1 = codeNm1;
	}


	public String getCodeNm2() {
		return codeNm2;
	}


	public void setCodeNm2(String codeNm2) {
		this.codeNm2 = codeNm2;
	}


	public String getCodeNm3() {
		return codeNm3;
	}


	public void setCodeNm3(String codeNm3) {
		this.codeNm3 = codeNm3;
	}


	public String getCodeNm4() {
		return codeNm4;
	}


	public void setCodeNm4(String codeNm4) {
		this.codeNm4 = codeNm4;
	}


	public String getCodeId() {

        return codeId;
    }


    public void setCodeId(String codeId) {

        this.codeId = codeId;
    }


    public String getCodeNm() {

        return codeNm;
    }


    public void setCodeNm(String codeNm) {

        this.codeNm = codeNm;
    }


    public String getParntsCodeId() {

        return parntsCodeId;
    }


    public void setParntsCodeId(String parntsCodeId) {

        this.parntsCodeId = parntsCodeId;
    }


    public String getCnsltSeCode() {

        return cnsltSeCode;
    }


    public void setCnsltSeCode(String cnsltSeCode) {

        this.cnsltSeCode = cnsltSeCode;
    }


    public String getCnsltSeNm() {

        return cnsltSeNm;
    }


    public void setCnsltSeNm(String cnsltSeNm) {

        this.cnsltSeNm = cnsltSeNm;
    }


    public String getSortOrdr() {

        return sortOrdr;
    }


    public void setSortOrdr(String sortOrdr) {

        this.sortOrdr = sortOrdr;
    }


    public String getUseAt() {

        return useAt;
    }


    public void setUseAt(String useAt) {

        this.useAt = useAt;
    }


    public String getFrstRegistPnttm() {

        return frstRegistPnttm;
    }


    public void setFrstRegistPnttm(String frstRegistPnttm) {

        this.frstRegistPnttm = frstRegistPnttm;
    }


    public String getFrstRegisterId() {

        return frstRegisterId;
    }


    public void setFrstRegisterId(String frstRegisterId) {

        this.frstRegisterId = frstRegisterId;
    }


    public String getLastUpdtPnttm() {

        return lastUpdtPnttm;
    }


    public void setLastUpdtPnttm(String lastUpdtPnttm) {

        this.lastUpdtPnttm = lastUpdtPnttm;
    }


    public String getLastUpdusrId() {

        return lastUpdusrId;
    }


    public void setLastUpdusrId(String lastUpdusrId) {

        this.lastUpdusrId = lastUpdusrId;
    }


    /**
     * EgovMap에서 VO셋팅
     *
     * @param egovMap
     */
    public void setValuesFromEgovMap(EgovMap egovMap) {

        this.codeId = (String)egovMap.get("codeId");
        this.codeNm = (String)egovMap.get("codeNm");
        this.parntsCodeId = (String)egovMap.get("parntsCodeId");
        this.cnsltSeCode = (String)egovMap.get("cnsltSeCode");
        this.cnsltSeNm = (String)egovMap.get("cnsltSeNm");
        this.sortOrdr = String.valueOf(egovMap.get("sortOrdr"));
        this.useAt = (String)egovMap.get("useAt");
    }

}
