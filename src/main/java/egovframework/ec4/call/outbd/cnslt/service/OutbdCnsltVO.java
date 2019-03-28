package egovframework.ec4.call.outbd.cnslt.service;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 아웃바운드 상담
 *
 * @author harry
 * @since 2018.07.23
 */
public class OutbdCnsltVO extends OutbdCnsltDefaultVO {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private String hpclId = "";
    private String cstmrEsntlId = "";
    private String rceptNo = "";
    private String rceptDt = "";
    private String intrfcSysCode = "";
    private String hpclTelno = "";
    private String memo = "";
    private String progrsSttusCode = "";
    private String progrsResultCode = "";

    // 상담 저장
    private String callOpetrEsntlId = "";
    private String callResultCode = "";
    private String recptnAgreSeCode = "";
    private String recptnAgreAt = "";
    private String blclstAt = "";
    private String mbtlnumChange = "";
    private String telnoChange = "";
    private String remark = "";
    private String refrnMatter = "";

    // 공통
    private String frstRegistPnttm = "";
    private String frstRegisterId = "";
    private String lastUpdtPnttm = "";
    private String lastUpdusrId = "";


    public String getHpclId() {

        return hpclId;
    }


    public void setHpclId(String hpclId) {

        this.hpclId = hpclId;
    }


    public String getCstmrEsntlId() {

        return cstmrEsntlId;
    }


    public void setCstmrEsntlId(String cstmrEsntlId) {

        this.cstmrEsntlId = cstmrEsntlId;
    }


    public String getRceptNo() {

        return rceptNo;
    }


    public void setRceptNo(String rceptNo) {

        this.rceptNo = rceptNo;
    }


    public String getRceptDt() {

        return rceptDt;
    }


    public void setRceptDt(String rceptDt) {

        this.rceptDt = rceptDt;
    }


    public String getIntrfcSysCode() {

        return intrfcSysCode;
    }


    public void setIntrfcSysCode(String intrfcSysCode) {

        this.intrfcSysCode = intrfcSysCode;
    }


    public String getHpclTelno() {

        return hpclTelno;
    }


    public void setHpclTelno(String hpclTelno) {

        this.hpclTelno = hpclTelno;
    }


    public String getMemo() {

        return memo;
    }


    public void setMemo(String memo) {

        this.memo = memo;
    }


    public String getProgrsSttusCode() {

        return progrsSttusCode;
    }


    public void setProgrsSttusCode(String progrsSttusCode) {

        this.progrsSttusCode = progrsSttusCode;
    }


    public String getProgrsResultCode() {

        return progrsResultCode;
    }


    public void setProgrsResultCode(String progrsResultCode) {

        this.progrsResultCode = progrsResultCode;
    }


    public String getRemark() {

        return remark;
    }


    public void setRemark(String remark) {

        this.remark = remark;
    }


    public String getRefrnMatter() {

        return refrnMatter;
    }


    public void setRefrnMatter(String refrnMatter) {

        this.refrnMatter = refrnMatter;
    }


    public String getCallOpetrEsntlId() {

        return callOpetrEsntlId;
    }


    public void setCallOpetrEsntlId(String callOpetrEsntlId) {

        this.callOpetrEsntlId = callOpetrEsntlId;
    }


    public String getCallResultCode() {

        return callResultCode;
    }


    public void setCallResultCode(String callResultCode) {

        this.callResultCode = callResultCode;
    }


    public String getRecptnAgreSeCode() {

        return recptnAgreSeCode;
    }


    public void setRecptnAgreSeCode(String recptnAgreSeCode) {

        this.recptnAgreSeCode = recptnAgreSeCode;
    }


    public String getRecptnAgreAt() {

        return recptnAgreAt;
    }


    public void setRecptnAgreAt(String recptnAgreAt) {

        this.recptnAgreAt = recptnAgreAt;
    }


    public String getBlclstAt() {

        return blclstAt;
    }


    public void setBlclstAt(String blclstAt) {

        this.blclstAt = blclstAt;
    }


    public String getMbtlnumChange() {

        return mbtlnumChange;
    }


    public void setMbtlnumChange(String mbtlnumChange) {

        this.mbtlnumChange = mbtlnumChange;
    }


    public String getTelnoChange() {

        return telnoChange;
    }


    public void setTelnoChange(String telnoChange) {

        this.telnoChange = telnoChange;
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

        this.hpclId = (String)egovMap.get("hpclId");
        this.cstmrEsntlId = (String)egovMap.get("cstmrEsntlId");
        this.rceptNo = (String)egovMap.get("rceptNo");
        this.rceptDt = (String)egovMap.get("rceptDt");
        this.intrfcSysCode = (String)egovMap.get("intrfcSysCode");
        this.hpclTelno = (String)egovMap.get("hpclTelno");
        this.memo = (String)egovMap.get("memo");
        this.progrsSttusCode = (String)egovMap.get("progrsSttusCode");
        this.frstRegistPnttm = (String)egovMap.get("frstRegistPnttm");
        this.frstRegisterId = (String)egovMap.get("frstRegisterId");
        this.lastUpdtPnttm = (String)egovMap.get("lastUpdtPnttm");
        this.lastUpdusrId = (String)egovMap.get("lastUpdusrId");
    }

}
