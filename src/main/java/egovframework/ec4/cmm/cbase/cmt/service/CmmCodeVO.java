package egovframework.ec4.cmm.cbase.cmt.service;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 공통코드 VO
 *
 * @author harry
 * @since 2018.05.15
 */
public class CmmCodeVO extends CmmCodeDefaultVO {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private String codeId = "";
    private String codeIdNm = "";
    private String codeIdDc = "";
    private String useAt = "";
    private String clCode = "";
    private String clCodeNm = "";

    private String frstRegistPnttm = "";
    private String frstRegisterId = "";
    private String lastUpdtPnttm = "";
    private String lastUpdusrId = "";


    public String getCodeId() {

        return codeId;
    }


    public void setCodeId(String codeId) {

        this.codeId = codeId;
    }


    public String getCodeIdNm() {

        return codeIdNm;
    }


    public void setCodeIdNm(String codeIdNm) {

        this.codeIdNm = codeIdNm;
    }


    public String getCodeIdDc() {

        return codeIdDc;
    }


    public void setCodeIdDc(String codeIdDc) {

        this.codeIdDc = codeIdDc;
    }


    public String getUseAt() {

        return useAt;
    }


    public void setUseAt(String useAt) {

        this.useAt = useAt;
    }


    public String getClCode() {

        return clCode;
    }


    public void setClCode(String clCode) {

        this.clCode = clCode;
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


    public String getClCodeNm() {

        return clCodeNm;
    }


    public void setClCodeNm(String clCodeNm) {

        this.clCodeNm = clCodeNm;
    }


    /**
     * EgovMap에서 VO셋팅
     *
     * @param egovMap
     */
    public void setValuesFromEgovMap(EgovMap egovMap) {

        this.codeId = (String)egovMap.get("codeId");
        this.codeIdNm = (String)egovMap.get("codeIdNm");
        this.codeIdDc = (String)egovMap.get("codeIdDc");
        this.useAt = (String)egovMap.get("useAt");
        this.clCode = (String)egovMap.get("clCode");
        this.clCodeNm = (String)egovMap.get("clCodeNm");
    }

}
