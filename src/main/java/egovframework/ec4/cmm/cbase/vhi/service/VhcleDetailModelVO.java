package egovframework.ec4.cmm.cbase.vhi.service;

import java.util.ArrayList;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @Class Name : VhcleDetailModelVO.java
 * @Description : VhcleDetailModelVO VO class
 * @Modification Information
 * @author harry
 * @since 2018.04.25
 * @version 1.0
 *
 */
public class VhcleDetailModelVO extends VhcleModelDefaultVO {

    private static final long serialVersionUID = 1L;

    /** VHCLE_MODEL */
    private String vhcleModelId;
    private String vhcleModelNm;

    /** 세부 모델 정보 */
    private String detailModelId;   // 세부 모델 ID
    private String detailModelNm;   // 세부 모델 명
    private String mdyrBegin;       // 연식 시작
    private String mdyrEnd;         // 연식 종료

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
    
    private String linkVhcleModel;
    private String ifMdlCode;
    
    
    private ArrayList<VhcleDetailModelVO> detailLinkVhcleModelTable = null;
    
    
    
    
    


    
    public String getIfMdlCode() {
		return ifMdlCode;
	}


	public void setIfMdlCode(String ifMdlCode) {
		this.ifMdlCode = ifMdlCode;
	}


	public ArrayList<VhcleDetailModelVO> getDetailLinkVhcleModelTable() {
		return detailLinkVhcleModelTable;
	}


	public void setDetailLinkVhcleModelTable(ArrayList<VhcleDetailModelVO> detailLinkVhcleModelTable) {
		this.detailLinkVhcleModelTable = detailLinkVhcleModelTable;
	}


	public String getLinkVhcleModel() {
		return linkVhcleModel;
	}


	public void setLinkVhcleModel(String linkVhcleModel) {
		this.linkVhcleModel = linkVhcleModel;
	}


	public String getVhcleModelId() {

        return vhcleModelId;
    }


    public void setVhcleModelId(String vhcleModelId) {

        this.vhcleModelId = vhcleModelId;
    }


    public String getVhcleModelNm() {

        return vhcleModelNm;
    }


    public void setVhcleModelNm(String vhcleModelNm) {

        this.vhcleModelNm = vhcleModelNm;
    }


    public String getDetailModelId() {

        return detailModelId;
    }


    public void setDetailModelId(String detailModelId) {

        this.detailModelId = detailModelId;
    }


    public String getDetailModelNm() {

        return detailModelNm;
    }


    public void setDetailModelNm(String detailModelNm) {

    	this.detailModelNm = detailModelNm;
    }


    public String getMdyrBegin() {

        return mdyrBegin;
    }


    public void setMdyrBegin(String mdyrBegin) {

    	this.mdyrBegin = mdyrBegin;
    }


    public String getMdyrEnd() {

        return mdyrEnd;
    }


    public void setMdyrEnd(String mdyrEnd) {

    	this.mdyrEnd = mdyrEnd;
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

    
    /**
     * EgovMap에서 VO셋팅
     *
     * @param egovMap
     */
    public void setValuesFromEgovMap(EgovMap egovMap) {
    	
        /** VHCLE_MODEL */
        this.vhcleModelId = (String)egovMap.get("vhcleModelId");
        this.vhcleModelNm = (String)egovMap.get("vhcleModelNm");

        /** 세부 모델 정보 */
        this.detailModelId = (String)egovMap.get("detailModelId");   // 세부 모델 ID
        this.detailModelNm = (String)egovMap.get("detailModelNm");   // 세부 모델 명
        this.mdyrBegin = (String)egovMap.get("mdyrBegin");       // 연식 시작
        this.mdyrEnd = (String)egovMap.get("mdyrEnd");         // 연식 종료

        /** USE_AT */
        this.useAt = (String)egovMap.get("useAt");

        /** FRST_REGIST_PNTTM */
        this.frstRegistPnttm = (String)egovMap.get("frstRegistPnttm");

        /** FRST_REGISTER_ID */
        this.frstRegisterId = (String)egovMap.get("frstRegisterId");

        /** LAST_UPDT_PNTTM */
        this.lastUpdtPnttm = (String)egovMap.get("lastUpdtPnttm");

        /** LAST_UPDUSR_ID */
        this.lastUpdusrId = (String)egovMap.get("lastUpdusrId");    	
    }
    
    
}
