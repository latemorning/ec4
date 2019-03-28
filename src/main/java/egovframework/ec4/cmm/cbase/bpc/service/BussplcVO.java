package egovframework.ec4.cmm.cbase.bpc.service;

/**
 * @Class Name : BussplcVO.java
 * @Description : Bussplc VO class
 * @Modification Information
 *
 * @author harry
 * @since 2018.04.16
 * @version 1.0
 * @see
 *
 *      Copyright (C) All right reserved.
 */
public class BussplcVO extends BussplcDefaultVO {

    private static final long serialVersionUID = 1L;

    /** BUSSPLC_ID */
    private String bussplcId;

    /** BUSSPLC_NM 모델명 */
    private String bussplcNm;

    /** USE_AT */
    private String useAt;

    /** FRST_REGIST_PNTTM */
    private String frstRegistPnttm;

    /** FRST_REGISTER_ID */
    private String frstRegisterId;

    /** LAST_UPDT_PNTTM */
    private String lastUpdtPnttm;

    /** LAST_UPDUSR_ID */
    private String lastUpdusrId;


    public String getBussplcId() {

        return this.bussplcId;
    }


    public void setBussplcId(String bussplcId) {

        this.bussplcId = bussplcId;
    }


    public String getBussplcNm() {

        return this.bussplcNm;
    }


    public void setBussplcNm(String bussplcNm) {

        this.bussplcNm = bussplcNm;
    }


    public String getUseAt() {

        return this.useAt;
    }


    public void setUseAt(String useAt) {

        this.useAt = useAt;
    }


    public String getFrstRegistPnttm() {

        return this.frstRegistPnttm;
    }


    public void setFrstRegistPnttm(String frstRegistPnttm) {

        this.frstRegistPnttm = frstRegistPnttm;
    }


    public String getFrstRegisterId() {

        return this.frstRegisterId;
    }


    public void setFrstRegisterId(String frstRegisterId) {

        this.frstRegisterId = frstRegisterId;
    }


    public String getLastUpdtPnttm() {

        return this.lastUpdtPnttm;
    }


    public void setLastUpdtPnttm(String lastUpdtPnttm) {

        this.lastUpdtPnttm = lastUpdtPnttm;
    }


    public String getLastUpdusrId() {

        return this.lastUpdusrId;
    }


    public void setLastUpdusrId(String lastUpdusrId) {

        this.lastUpdusrId = lastUpdusrId;
    }

}
