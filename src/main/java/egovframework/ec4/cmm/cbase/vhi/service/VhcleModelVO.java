package egovframework.ec4.cmm.cbase.vhi.service;

/**
 * @Class Name : VhcleModelVO.java
 * @Description : VhcleModel VO class
 * @Modification Information
 *
 * @author harry
 * @since 2018.04.16
 * @version 1.0
 * @see
 *
 *      Copyright (C) All right reserved.
 */
public class VhcleModelVO extends VhcleModelDefaultVO {

    private static final long serialVersionUID = 1L;

    /** VHCLE_MODEL_ID */
    private String vhcleModelId;

    /** VHCLE_MODEL_NM 모델명 */
    private String vhcleModelNm;

    /** VHCLE_MAKR_CODE 제조사 코드 */
    private String vhcleMakrCode;

    /** VHCLE_MAKR_CODE 제조사 명 */
    private String vhcleMakrNm;

    /** VHCTY_CODE 차종 코드 */
    private String vhctyCode;

    /** VHCTY_CODE 차종 명 */
    private String vhctyNm;

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


    public String getVhcleModelId() {

        return this.vhcleModelId;
    }


    public void setVhcleModelId(String vhcleModelId) {

        this.vhcleModelId = vhcleModelId;
    }


    public String getVhcleModelNm() {

        return this.vhcleModelNm;
    }


    public void setVhcleModelNm(String vhcleModelNm) {

        this.vhcleModelNm = vhcleModelNm;
    }


    public String getVhcleMakrCode() {

        return this.vhcleMakrCode;
    }


    public void setVhcleMakrCode(String vhcleMakrCode) {

        this.vhcleMakrCode = vhcleMakrCode;
    }


    public String getVhcleMakrNm() {

        return vhcleMakrNm;
    }


    public void setVhcleMakrNm(String vhcleMakrNm) {

        this.vhcleMakrNm = vhcleMakrNm;
    }


    public String getVhctyCode() {

        return vhctyCode;
    }


    public void setVhctyCode(String vhctyCode) {

        this.vhctyCode = vhctyCode;
    }


    public String getVhctyNm() {

        return vhctyNm;
    }


    public void setVhctyNm(String vhctyNm) {

        this.vhctyNm = vhctyNm;
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
