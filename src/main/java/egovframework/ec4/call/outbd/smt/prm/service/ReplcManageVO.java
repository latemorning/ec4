package egovframework.ec4.call.outbd.smt.prm.service;

import com.google.gson.Gson;

public class ReplcManageVO extends ReplcManageDefaultVO {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private String replcCode = "";
    private String replcTy = "";
    private String replcTyNm = "";
    private String replcNm = "";
    private String smsDsptchNo = "";
    private String replcEmail = "";
    private String useAt = "";
    private String scdCallUseAt = "";
    private String hdqrtrsCode = "";
    private String replcGdcc = "";
    private String replcExcpGdcc = "";
    private String remark = "";

    private String frstRegistPnttm = "";
    private String frstRegisterId = "";
    private String lastUpdtPnttm = "";
    private String lastUpdusrId = "";


    public ReplcManageVO() {
    }


    public String getReplcCode() {

        return replcCode;
    }


    public void setReplcCode(String replcCode) {

        this.replcCode = replcCode;
    }


    public String getReplcTy() {

        return replcTy;
    }


    public void setReplcTy(String replcTy) {

        this.replcTy = replcTy;
    }


    public String getReplcTyNm() {

        return replcTyNm;
    }


    public void setReplcTyNm(String replcTyNm) {

        this.replcTyNm = replcTyNm;
    }


    public String getReplcNm() {

        return replcNm;
    }


    public void setReplcNm(String replcNm) {

        this.replcNm = replcNm;
    }


    public String getSmsDsptchNo() {

        return smsDsptchNo;
    }


    public void setSmsDsptchNo(String smsDsptchNo) {

        this.smsDsptchNo = smsDsptchNo;
    }


    public String getReplcEmail() {

        return replcEmail;
    }


    public void setReplcEmail(String replcEmail) {

        this.replcEmail = replcEmail;
    }


    public String getUseAt() {

        return useAt;
    }


    public void setUseAt(String useAt) {

        this.useAt = useAt;
    }


    public String getScdCallUseAt() {

        return scdCallUseAt;
    }


    public void setScdCallUseAt(String scdCallUseAt) {

        this.scdCallUseAt = scdCallUseAt;
    }


    public String getHdqrtrsCode() {

        return hdqrtrsCode;
    }


    public void setHdqrtrsCode(String hdqrtrsCode) {

        this.hdqrtrsCode = hdqrtrsCode;
    }


    public String getReplcGdcc() {

        return replcGdcc;
    }


    public void setReplcGdcc(String replcGdcc) {

        this.replcGdcc = replcGdcc;
    }


    public String getReplcExcpGdcc() {

        return replcExcpGdcc;
    }


    public void setReplcExcpGdcc(String replcExcpGdcc) {

        this.replcExcpGdcc = replcExcpGdcc;
    }


    public String getRemark() {

        return remark;
    }


    public void setRemark(String remark) {

        this.remark = remark;
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


    public String toJson() {

        Gson gson = new Gson();
        //json string으로 parsing
        return gson.toJson(this);
    }

}
