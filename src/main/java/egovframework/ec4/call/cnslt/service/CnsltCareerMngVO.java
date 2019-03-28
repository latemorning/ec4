package egovframework.ec4.call.cnslt.service;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import egovframework.ec4.cmm.cbase.cmt.service.DetailCodeVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 상담원에 대한 Vo 클래스를 정의한다.
 * @author 최재중
 * @since 2018.04.26
 * @version 1.0
 * @see
 *
 * <pre>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2018.04.26  최재중          최초 생성
 *
 * </pre>
 */

public class CnsltCareerMngVO extends DetailCodeVO{

	private static final long serialVersionUID = 1L;

	
	private String makrCd = "";                       /* 메이커코드 */
	private String cnsltUserId = "";                    /* 상담원아이디 */

	private String workComp = "";                       /* 근무회사 */
	private String workBeginDt = "";                    /* 작업시작일시 */
	private String resignedDt = "";                     /* 퇴사일자 */
	private String workPart = "";                       /* 업무역할 */

	
	private String registDe = "";                       /* 등록일자 */
	private String register = "";                       /* 등록자 */
	private String updtDe = "";                         /* 수정일자 */
	private String updusr = "";                         /* 수정자 */

	private String cnsltNm = "";
	private String cnsltUserNm = "";

	private String searchCnsltUserId = "";                        /* 콜고객코드 */
	private String searchCnsltUserNm = "";                        /* 콜고객명 */
	private String searchUserId = "";                        /* 콜고객코드 */
	private String searchUserNm = "";                        /* 콜고객명 */

	private String searchBrandCd = "";                        /* 브랜드코드 */
	private String searchVhcty = "";                          /* 차종 */
	private String searchModel = "";                          /* 모델 */
	private String searchHpno = "";                           /* 핸드폰번호 */
	private String searchTelno = "";                          /* 전화번호 */
	private String searchShopNm = "";                         /* 전시장 */
	private String searchDelvDt = "";                         /* 희망출고일 */
    private String searchBeginDe = "";
    private String searchEndDe = "";

	private String searchWorkComp = "";
	private String searchWorkPart = "";
	private String searchOrgnztId = ""; //상담원부서
	
    
    
    


	public String getSearchOrgnztId() {
		return searchOrgnztId;
	}

	public void setSearchOrgnztId(String searchOrgnztId) {
		this.searchOrgnztId = searchOrgnztId;
	}

	public String getWorkComp() {
		return workComp;
	}

	public void setWorkComp(String workComp) {
		this.workComp = workComp;
	}

	public String getWorkBeginDt() {
		return workBeginDt;
	}

	public void setWorkBeginDt(String workBeginDt) {
		this.workBeginDt = workBeginDt;
	}

	public String getResignedDt() {
		return resignedDt;
	}

	public void setResignedDt(String resignedDt) {
		this.resignedDt = resignedDt;
	}

	public String getWorkPart() {
		return workPart;
	}

	public void setWorkPart(String workPart) {
		this.workPart = workPart;
	}

	public String getSearchWorkComp() {
		return searchWorkComp;
	}

	public void setSearchWorkComp(String searchWorkComp) {
		this.searchWorkComp = searchWorkComp;
	}

	public String getSearchWorkPart() {
		return searchWorkPart;
	}

	public void setSearchWorkPart(String searchWorkPart) {
		this.searchWorkPart = searchWorkPart;
	}

	public String getSearchUserId() {
		return searchUserId;
	}

	public void setSearchUserId(String searchUserId) {
		this.searchUserId = searchUserId;
	}

	public String getSearchUserNm() {
		return searchUserNm;
	}

	public void setSearchUserNm(String searchUserNm) {
		this.searchUserNm = searchUserNm;
	}

	public String getMakrCd() {
		return makrCd;
	}

	public void setMakrCd(String makrCd) {
		this.makrCd = makrCd;
	}

	public String getCnsltUserId() {
		return cnsltUserId;
	}

	public void setCnsltUserId(String cnsltUserId) {
		this.cnsltUserId = cnsltUserId;
	}

	public String getRegistDe() {
		return registDe;
	}

	public void setRegistDe(String registDe) {
		this.registDe = registDe;
	}

	public String getRegister() {
		return register;
	}

	public void setRegister(String register) {
		this.register = register;
	}

	public String getUpdtDe() {
		return updtDe;
	}

	public void setUpdtDe(String updtDe) {
		this.updtDe = updtDe;
	}

	public String getUpdusr() {
		return updusr;
	}

	public void setUpdusr(String updusr) {
		this.updusr = updusr;
	}

	public String getCnsltNm() {
		return cnsltNm;
	}

	public void setCnsltNm(String cnsltNm) {
		this.cnsltNm = cnsltNm;
	}

	public String getCnsltUserNm() {
		return cnsltUserNm;
	}

	public void setCnsltUserNm(String cnsltUserNm) {
		this.cnsltUserNm = cnsltUserNm;
	}

	public String getSearchCnsltUserId() {
		return searchCnsltUserId;
	}

	public void setSearchCnsltUserId(String searchCnsltUserId) {
		this.searchCnsltUserId = searchCnsltUserId;
	}

	public String getSearchCnsltUserNm() {
		return searchCnsltUserNm;
	}

	public void setSearchCnsltUserNm(String searchCnsltUserNm) {
		this.searchCnsltUserNm = searchCnsltUserNm;
	}

	public String getSearchBrandCd() {
		return searchBrandCd;
	}

	public void setSearchBrandCd(String searchBrandCd) {
		this.searchBrandCd = searchBrandCd;
	}

	public String getSearchVhcty() {
		return searchVhcty;
	}

	public void setSearchVhcty(String searchVhcty) {
		this.searchVhcty = searchVhcty;
	}

	public String getSearchModel() {
		return searchModel;
	}

	public void setSearchModel(String searchModel) {
		this.searchModel = searchModel;
	}

	public String getSearchHpno() {
		return searchHpno;
	}

	public void setSearchHpno(String searchHpno) {
		this.searchHpno = searchHpno;
	}

	public String getSearchTelno() {
		return searchTelno;
	}

	public void setSearchTelno(String searchTelno) {
		this.searchTelno = searchTelno;
	}

	public String getSearchShopNm() {
		return searchShopNm;
	}

	public void setSearchShopNm(String searchShopNm) {
		this.searchShopNm = searchShopNm;
	}

	public String getSearchDelvDt() {
		return searchDelvDt;
	}

	public void setSearchDelvDt(String searchDelvDt) {
		this.searchDelvDt = searchDelvDt;
	}

	public String getSearchBeginDe() {
		return searchBeginDe;
	}

	public void setSearchBeginDe(String searchBeginDe) {
		this.searchBeginDe = searchBeginDe;
	}

	public String getSearchEndDe() {
		return searchEndDe;
	}

	public void setSearchEndDe(String searchEndDe) {
		this.searchEndDe = searchEndDe;
	}

	List <CnsltLicenseMngVO> cnsltLicenseMngList;
	

	/**
	 * cnsltLicenseMngList attribute 를 리턴한다.
	 * @return List<CnsltLicenseMngVO>
	 */
	public List<CnsltLicenseMngVO> getCnsltLicenseMngList() {
		return cnsltLicenseMngList;
	}

	/**
	 * ec4CnsltLicenseRegMngList attribute 값을 설정한다.
	 * @param cnsltLicenseMngList List<CnsltLicenseMngVO>
	 */
	public void setCnsltLicenseMngList(List<CnsltLicenseMngVO> cnsltLicenseMngList) {
		this.cnsltLicenseMngList = cnsltLicenseMngList;
	}





    /**
     * EgovMap에서 VO셋팅
     *
     * @param egovMap
     */
    public void setValuesFromEgovMap(EgovMap egovMap) {

		this.makrCd = (String)egovMap.get("makrCd");                       /* 메이커코드 */
		this.cnsltUserId = (String)egovMap.get("cnsltUserId");		       /* 상담원아이디 */

		this.workComp = (String)egovMap.get("workComp");                       /* 근무회사 */
		this.workBeginDt = (String)egovMap.get("workBeginDt");                    /* 작업시작일시 */
		this.resignedDt = (String)egovMap.get("resignedDt");                     /* 퇴사일자 */
		this.workPart = (String)egovMap.get("workPart");                       /* 업무역할 */


		this.registDe = String.valueOf(egovMap.get("registDe"));
		this.register = (String)egovMap.get("register");
		this.updtDe = String.valueOf(egovMap.get("updtDe"));
		this.updusr = (String)egovMap.get("updusr");

        this.cnsltUserNm = (String)egovMap.get("cnsltUserNm");
    }



}