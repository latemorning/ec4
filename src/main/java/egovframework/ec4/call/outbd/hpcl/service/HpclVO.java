package egovframework.ec4.call.outbd.hpcl.service;

import java.util.ArrayList;

import com.google.gson.Gson;

/**
 * 해피콜 인터페이스
 *
 * @author harry
 *
 */
public class HpclVO extends HpclDefaultVO {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private String hpclId = "";
    private String hpclKey = "";

    private String replcSeCode = "";
    private String replcSeCodeNm = "";
    private String replcId = "";
    private String replcNm = "";
    private String replcInfo = "";
    private String hdqrtrsNm = "";
    private String opertorNm = "";
    private String workCn = "";
    private String repairDetail = "";
    private String etcMatter = "";
    private String repairReqest = "";
    private String chrgCnslrEsntlId = "";
    private String chrgCnslrEsntlNm = "";
    private String altrEsntlId = "";
    private String altrEsntlNm = "";
    private String asgnDt = "";
    private String remark = "";
    private String refrnMatter = "";

    private String frstCallOpetrId = "";
    private String frstCallOpetrNm = "";
    private String frstCallProcessDt = "";
    private String frstCallResultCode = "";
    private String frstCallResultCodeNm = "";
    private String absnceCallOpetrId = "";
    private String absnceCallOpetrNm = "";
    private String absnceCallProcessDt = "";
    private String absnceCallResultCode = "";
    private String absnceCallResultCodeNm = "";
    private String callCnt = "";

    private String cstmrEsntlId = "";
    private String hpclTelno = "";
    private String rceptNo = "";
    private String rceptDt = "";
    private String memo = "";
    private String progrsSttusCode = "";

    // 캠페인
    private String cmpgnId = "";
    private String cmpgnNm = "";
    private String oldCmpgnId = "";     // 할당되어 있던 캠페인 ID

    // 설문지
    private String qestnrId = "";       // 설문지 ID
    private String qustnrTmplatId = ""; // 설문 템플릿 ID

    // 상담원
    private String cnslrId = "";
    private String cnslrNm = "";

    // 공통
    private String frstRegistPnttm = "";
    private String frstRegisterId = "";
    private String lastUpdtPnttm = "";
    private String lastUpdusrId = "";

    private ArrayList<HpclVO> hpclList = null;
    private ArrayList<HpclVO> cnslrList = null;


    /**
     * List 객체 json 으로 반환
     *
     * @return
     */
    public String toListJson() {

        Gson gson = new Gson();
        //json string으로 parsing
        return gson.toJson(hpclList);
    }


    public String getHpclId() {

        return hpclId;
    }


    public void setHpclId(String hpclId) {

        this.hpclId = hpclId;
    }


    public String getHpclKey() {

        return hpclKey;
    }


    public void setHpclKey(String hpclKey) {

        this.hpclKey = hpclKey;
    }


    public String getReplcSeCode() {

        return replcSeCode;
    }


    public void setReplcSeCode(String replcSeCode) {

        this.replcSeCode = replcSeCode;
    }


    public String getReplcSeCodeNm() {

        return replcSeCodeNm;
    }


    public void setReplcSeCodeNm(String replcSeCodeNm) {

        this.replcSeCodeNm = replcSeCodeNm;
    }


    public String getReplcId() {

        return replcId;
    }


    public void setReplcId(String replcId) {

        this.replcId = replcId;
    }


    public String getReplcNm() {

        return replcNm;
    }


    public void setReplcNm(String replcNm) {

        this.replcNm = replcNm;
    }


    public String getReplcInfo() {

        return replcInfo;
    }


    public void setReplcInfo(String replcInfo) {

        this.replcInfo = replcInfo;
    }


    public String getHdqrtrsNm() {

        return hdqrtrsNm;
    }


    public void setHdqrtrsNm(String hdqrtrsNm) {

        this.hdqrtrsNm = hdqrtrsNm;
    }


    public String getOpertorNm() {

        return opertorNm;
    }


    public void setOpertorNm(String opertorNm) {

        this.opertorNm = opertorNm;
    }


    public String getWorkCn() {

        return workCn;
    }


    public void setWorkCn(String workCn) {

        this.workCn = workCn;
    }


    public String getRepairDetail() {

        return repairDetail;
    }


    public void setRepairDetail(String repairDetail) {

        this.repairDetail = repairDetail;
    }


    public String getEtcMatter() {

        return etcMatter;
    }


    public void setEtcMatter(String etcMatter) {

        this.etcMatter = etcMatter;
    }


    public String getRepairReqest() {

        return repairReqest;
    }


    public void setRepairReqest(String repairReqest) {

        this.repairReqest = repairReqest;
    }


    public String getChrgCnslrEsntlId() {

        return chrgCnslrEsntlId;
    }


    public void setChrgCnslrEsntlId(String chrgCnslrEsntlId) {

        this.chrgCnslrEsntlId = chrgCnslrEsntlId;
    }


    public String getChrgCnslrEsntlNm() {

        return chrgCnslrEsntlNm;
    }


    public void setChrgCnslrEsntlNm(String chrgCnslrEsntlNm) {

        this.chrgCnslrEsntlNm = chrgCnslrEsntlNm;
    }


    public String getAltrEsntlId() {

        return altrEsntlId;
    }


    public void setAltrEsntlId(String altrEsntlId) {

        this.altrEsntlId = altrEsntlId;
    }


    public String getAltrEsntlNm() {

        return altrEsntlNm;
    }


    public void setAltrEsntlNm(String altrEsntlNm) {

        this.altrEsntlNm = altrEsntlNm;
    }


    public String getAsgnDt() {

        return asgnDt;
    }


    public void setAsgnDt(String asgnDt) {

        this.asgnDt = asgnDt;
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


    public String getFrstCallOpetrId() {

        return frstCallOpetrId;
    }


    public void setFrstCallOpetrId(String frstCallOpetrId) {

        this.frstCallOpetrId = frstCallOpetrId;
    }


    public String getFrstCallOpetrNm() {

        return frstCallOpetrNm;
    }


    public void setFrstCallOpetrNm(String frstCallOpetrNm) {

        this.frstCallOpetrNm = frstCallOpetrNm;
    }


    public String getFrstCallProcessDt() {

        return frstCallProcessDt;
    }


    public void setFrstCallProcessDt(String frstCallProcessDt) {

        this.frstCallProcessDt = frstCallProcessDt;
    }


    public String getFrstCallResultCode() {

        return frstCallResultCode;
    }


    public void setFrstCallResultCode(String frstCallResultCode) {

        this.frstCallResultCode = frstCallResultCode;
    }


    public String getFrstCallResultCodeNm() {

        return frstCallResultCodeNm;
    }


    public void setFrstCallResultCodeNm(String frstCallResultCodeNm) {

        this.frstCallResultCodeNm = frstCallResultCodeNm;
    }


    public String getAbsnceCallOpetrId() {

        return absnceCallOpetrId;
    }


    public void setAbsnceCallOpetrId(String absnceCallOpetrId) {

        this.absnceCallOpetrId = absnceCallOpetrId;
    }


    public String getAbsnceCallOpetrNm() {

        return absnceCallOpetrNm;
    }


    public void setAbsnceCallOpetrNm(String absnceCallOpetrNm) {

        this.absnceCallOpetrNm = absnceCallOpetrNm;
    }


    public String getAbsnceCallProcessDt() {

        return absnceCallProcessDt;
    }


    public void setAbsnceCallProcessDt(String absnceCallProcessDt) {

        this.absnceCallProcessDt = absnceCallProcessDt;
    }


    public String getAbsnceCallResultCode() {

        return absnceCallResultCode;
    }


    public void setAbsnceCallResultCode(String absnceCallResultCode) {

        this.absnceCallResultCode = absnceCallResultCode;
    }


    public String getAbsnceCallResultCodeNm() {

        return absnceCallResultCodeNm;
    }


    public void setAbsnceCallResultCodeNm(String absnceCallResultCodeNm) {

        this.absnceCallResultCodeNm = absnceCallResultCodeNm;
    }


    public String getCallCnt() {

        return callCnt;
    }


    public void setCallCnt(String callCnt) {

        this.callCnt = callCnt;
    }


    public String getCstmrEsntlId() {

        return cstmrEsntlId;
    }


    public void setCstmrEsntlId(String cstmrEsntlId) {

        this.cstmrEsntlId = cstmrEsntlId;
    }


    public String getHpclTelno() {

        return hpclTelno;
    }


    public void setHpclTelno(String hpclTelno) {

        this.hpclTelno = hpclTelno;
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


    public String getCmpgnId() {

        return cmpgnId;
    }


    public void setCmpgnId(String cmpgnId) {

        this.cmpgnId = cmpgnId;
    }


    public String getCmpgnNm() {

        return cmpgnNm;
    }


    public void setCmpgnNm(String cmpgnNm) {

        this.cmpgnNm = cmpgnNm;
    }


    public String getOldCmpgnId() {

        return oldCmpgnId;
    }


    public void setOldCmpgnId(String oldCmpgnId) {

        this.oldCmpgnId = oldCmpgnId;
    }


    public String getQestnrId() {

        return qestnrId;
    }


    public void setQestnrId(String qestnrId) {

        this.qestnrId = qestnrId;
    }


    public String getQustnrTmplatId() {

        return qustnrTmplatId;
    }


    public void setQustnrTmplatId(String qustnrTmplatId) {

        this.qustnrTmplatId = qustnrTmplatId;
    }


    public String getCnslrId() {

        return cnslrId;
    }


    public void setCnslrId(String cnslrId) {

        this.cnslrId = cnslrId;
    }


    public String getCnslrNm() {

        return cnslrNm;
    }


    public void setCnslrNm(String cnslrNm) {

        this.cnslrNm = cnslrNm;
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


    public ArrayList<HpclVO> getHpclList() {

        return hpclList;
    }


    public void setHpclList(ArrayList<HpclVO> hpclList) {

        this.hpclList = hpclList;
    }


    public ArrayList<HpclVO> getCnslrList() {

        return cnslrList;
    }


    public void setCnslrList(ArrayList<HpclVO> cnslrList) {

        this.cnslrList = cnslrList;
    }

    /**
     * EgovMap에서 VO셋팅
     *
     * @param egovMap
     */
    //    public void setValuesFromEgovMap(EgovMap egovMap) {

    //        this.hpclId = (String)egovMap.get("hpclId");
    //        this.cstmrEsntlId = (String)egovMap.get("cstmrEsntlId");
    //        this.hpclTelno = (String)egovMap.get("hpclTelno");
    //        this.rceptNo = (String)egovMap.get("rceptNo");
    //        this.rceptDt = (String)egovMap.get("rceptDt");
    //        this.memo = (String)egovMap.get("memo");
    //        this.progrsSttusCode = (String)egovMap.get("progrsSttusCode");
    //
    //        // 캠페인
    //        this.cmpgnId = (String)egovMap.get("cmpgnId");
    //        this.cmpgnNm = (String)egovMap.get("cmpgnNm");
    //        this.oldCmpgnId = (String)egovMap.get("oldCmpgnId");     // 할당되어 있던 캠페인 ID
    //
    //        // 설문지
    //        this.qestnrId = (String)egovMap.get("qestnrId");                // 설문지ID
    //        this.qustnrTmplatId = (String)egovMap.get("qustnrTmplatId");    // 설문 템플릿 ID
    //
    //        // 상담원
    //        this.cnslrId = (String)egovMap.get("cnslrId");
    //        this.cnslrNm = (String)egovMap.get("cnslrNm");
    //
    //        this.frstRegistPnttm = (String)egovMap.get("frstRegistPnttm");
    //        this.frstRegisterId = (String)egovMap.get("frstRegisterId");
    //        this.lastUpdtPnttm = (String)egovMap.get("lastUpdtPnttm");
    //        this.lastUpdusrId = (String)egovMap.get("lastUpdusrId");
    //    }

}
