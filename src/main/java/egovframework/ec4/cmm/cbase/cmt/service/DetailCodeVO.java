package egovframework.ec4.cmm.cbase.cmt.service;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public class DetailCodeVO extends DetailCodeDefaultVO {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private String clCode = "";

    private String codeId = "";
    private String codeIdNm = "";
    private String codeIdDc = "";

    private String upCode = "";
    private String code = "";
    private String codeNm = "";
    private String codeDc = "";

    private String useAt = "";

    private String frstRegistPnttm = "";
    private String frstRegisterId = "";
    private String lastUpdtPnttm = "";
    private String lastUpdusrId = "";
    
    
    


	public String getClCode() {

        return clCode;
    }


    public void setClCode(String clCode) {

        this.clCode = clCode;
    }


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


    public String getUpCode() {

        return upCode;
    }


    public void setUpCode(String upCode) {

        this.upCode = upCode;
    }


    public String getCode() {

        return code;
    }


    public void setCode(String code) {

        this.code = code;
    }


    public String getCodeNm() {

        return codeNm;
    }


    public void setCodeNm(String codeNm) {

        this.codeNm = codeNm;
    }


    public String getCodeDc() {

        return codeDc;
    }


    public void setCodeDc(String codeDc) {

        this.codeDc = codeDc;
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
        this.codeIdNm = (String)egovMap.get("codeIdNm");
        this.upCode = (String)egovMap.get("upCode");
        this.code = (String)egovMap.get("code");
        this.codeNm = (String)egovMap.get("codeNm");
        this.codeDc = (String)egovMap.get("codeDc");
        this.useAt = (String)egovMap.get("useAt");
    }

}
