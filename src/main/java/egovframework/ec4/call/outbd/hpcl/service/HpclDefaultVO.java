package egovframework.ec4.call.outbd.hpcl.service;

import egovframework.ec4.cmm.service.EC4DefaultVO;

/**
 * 해피콜, 콜상담
 *
 * @author harry
 *
 */
public class HpclDefaultVO extends EC4DefaultVO {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private String searchHpclId = "";
    private String searchCmpgnNm = "";
    private String searchCstmrNm = "";
    private String searchHpclTelno = "";
    private String searchMemo = "";
    private String searchProgrsSttusCode = "";  // 진행상태
    private String searchProgrsResultCode = ""; // 진행결과
    private String searchReplcNm = "";          // 정비소(사업소)명
    private String searchHdqrtrsNm = "";        // 본부명

    private String isCallClos = ""; // 콜마감 여부 Y/N
    private String isCallTrget = ""; // 콜대상 여부 Y/N
    private String isDrscSmsTrget = ""; // 부재중 sms대상 여부 Y/N
    private String isDrscTrget = ""; // 1차 부재중 대상 여부 Y/N


    public String getSearchHpclId() {

        return searchHpclId;
    }


    public void setSearchHpclId(String searchHpclId) {

        this.searchHpclId = searchHpclId;
    }


    public String getSearchCmpgnNm() {

        return searchCmpgnNm;
    }


    public void setSearchCmpgnNm(String searchCmpgnNm) {

        this.searchCmpgnNm = searchCmpgnNm;
    }


    public String getSearchCstmrNm() {

        return searchCstmrNm;
    }


    public void setSearchCstmrNm(String searchCstmrNm) {

        this.searchCstmrNm = searchCstmrNm;
    }


    public String getSearchHpclTelno() {

        return searchHpclTelno;
    }


    public void setSearchHpclTelno(String searchHpclTelno) {

        this.searchHpclTelno = searchHpclTelno;
    }


    public String getSearchMemo() {

        return searchMemo;
    }


    public void setSearchMemo(String searchMemo) {

        this.searchMemo = searchMemo;
    }


    public String getSearchProgrsSttusCode() {

        return searchProgrsSttusCode;
    }


    public void setSearchProgrsSttusCode(String searchProgrsSttusCode) {

        this.searchProgrsSttusCode = searchProgrsSttusCode;
    }


    public String getSearchProgrsResultCode() {

        return searchProgrsResultCode;
    }


    public void setSearchProgrsResultCode(String searchProgrsResultCode) {

        this.searchProgrsResultCode = searchProgrsResultCode;
    }


    public String getSearchReplcNm() {

        return searchReplcNm;
    }


    public void setSearchReplcNm(String searchReplcNm) {

        this.searchReplcNm = searchReplcNm;
    }


    public String getSearchHdqrtrsNm() {

        return searchHdqrtrsNm;
    }


    public void setSearchHdqrtrsNm(String searchHdqrtrsNm) {

        this.searchHdqrtrsNm = searchHdqrtrsNm;
    }


    public String getIsCallClos() {

        return isCallClos;
    }


    public void setIsCallClos(String isCallClos) {

        this.isCallClos = isCallClos;
    }


    public String getIsCallTrget() {

        return isCallTrget;
    }


    public void setIsCallTrget(String isCallTrget) {

        this.isCallTrget = isCallTrget;
    }


    public String getIsDrscSmsTrget() {

        return isDrscSmsTrget;
    }


    public void setIsDrscSmsTrget(String isDrscSmsTrget) {

        this.isDrscSmsTrget = isDrscSmsTrget;
    }


    public String getIsDrscTrget() {

        return isDrscTrget;
    }


    public void setIsDrscTrget(String isDrscTrget) {

        this.isDrscTrget = isDrscTrget;
    }

}
