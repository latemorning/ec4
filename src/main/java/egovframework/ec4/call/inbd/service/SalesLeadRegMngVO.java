package egovframework.ec4.call.inbd.service;

import java.util.List;

import egovframework.ec4.cmm.cbase.cmt.service.DetailCodeVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * SALES리드 판매정보 상담에 대한 Vo 클래스를 정의한다.
 * @author 최재중
 * @since 2018.04.23
 * @version 1.0
 * @see
 *
 * <pre>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2018.04.23  최재중          최초 생성
 *
 * </pre>
 */

public class SalesLeadRegMngVO extends DetailCodeVO{

	private static final long serialVersionUID = 1L;
	
	
	private String cstmrCd = "";                        /* 콜고객코드 */
	private String leadDt = "";                         /* 리드일자 */
	private String leadSeq = "";                        /* 리드순번 */
	private String leadType = "";                       /* 리드유형 */
	private String brandCd = "";                        /* 브랜드코드 */
	private String vhcty = "";                          /* 차종 */
	private String modelCd = "";                          /* 모델 */
	private String colCd = "";                          /* 색상 */
	private String hpno = "";                           /* 핸드폰번호 */
	private String telno = "";                          /* 전화번호 */
	private String zip = "";                            /* 우편번호 */
	private String adres = "";                          /* 주소 */
	private String adresDetail = "";                    /* 주소상세 */
	private String shopNm = "";                         /* 전시장 */
	private String delvDt = "";                         /* 희망출고일 */
	private String cstmrMemo = "";                      /* 고객메모 */
	private String cnsltCallNo = "";                    /* 콜번호 */
	private String cnsltUserId = "";                    /* 상담원아이디 */
	private String registDe = "";                       /* 등록일자 */
	private String register = "";                       /* 등록자 */
	private String updtDe = "";                         /* 수정일자 */
	private String updusr = "";                         /* 수정자 */

	private String cstmrNm = "";
	private String modelNm = "";

	private String searchCstmrCd = "";                        /* 콜고객코드 */
	private String searchCstmrNm = "";                        /* 콜고객명 */
	private String searchLeadDt = "";                         /* 리드일자 */
	private String searchLeadType = "";                       /* 리드유형 */
	private String searchBrandCd = "";                        /* 브랜드코드 */
	private String searchVhcty = "";                          /* 차종 */
	private String searchModel = "";                          /* 모델 */
	private String searchHpno = "";                           /* 핸드폰번호 */
	private String searchTelno = "";                          /* 전화번호 */
	private String searchShopNm = "";                         /* 전시장 */
	private String searchDelvDt = "";                         /* 희망출고일 */
    private String searchBeginDe = "";
    private String searchEndDe = "";
	
	

	public String getModelNm() {
		return modelNm;
	}

	public void setModelNm(String modelNm) {
		this.modelNm = modelNm;
	}

	public String getSearchCstmrNm() {
		return searchCstmrNm;
	}

	public void setSearchCstmrNm(String searchCstmrNm) {
		this.searchCstmrNm = searchCstmrNm;
	}

	public String getCstmrNm() {
		return cstmrNm;
	}

	public void setCstmrNm(String cstmrNm) {
		this.cstmrNm = cstmrNm;
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

	public String getCstmrCd() {
		return cstmrCd;
	}

	public void setCstmrCd(String cstmrCd) {
		this.cstmrCd = cstmrCd;
	}

	public String getLeadDt() {
		return leadDt;
	}

	public void setLeadDt(String leadDt) {
		this.leadDt = leadDt;
	}

	public String getLeadSeq() {
		return leadSeq;
	}

	public void setLeadSeq(String leadSeq) {
		this.leadSeq = leadSeq;
	}

	public String getLeadType() {
		return leadType;
	}

	public void setLeadType(String leadType) {
		this.leadType = leadType;
	}

	public String getBrandCd() {
		return brandCd;
	}

	public void setBrandCd(String brandCd) {
		this.brandCd = brandCd;
	}

	public String getVhcty() {
		return vhcty;
	}

	public void setVhcty(String vhcty) {
		this.vhcty = vhcty;
	}

	public String getModelCd() {
		return modelCd;
	}

	public void setModelCd(String modelCd) {
		this.modelCd = modelCd;
	}

	public String getColCd() {
		return colCd;
	}

	public void setColCd(String colCd) {
		this.colCd = colCd;
	}

	public String getHpno() {
		return hpno;
	}

	public void setHpno(String hpno) {
		this.hpno = hpno;
	}

	public String getTelno() {
		return telno;
	}

	public void setTelno(String telno) {
		this.telno = telno;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getAdres() {
		return adres;
	}

	public void setAdres(String adres) {
		this.adres = adres;
	}

	public String getAdresDetail() {
		return adresDetail;
	}

	public void setAdresDetail(String adresDetail) {
		this.adresDetail = adresDetail;
	}

	public String getShopNm() {
		return shopNm;
	}

	public void setShopNm(String shopNm) {
		this.shopNm = shopNm;
	}

	public String getDelvDt() {
		return delvDt;
	}

	public void setDelvDt(String delvDt) {
		this.delvDt = delvDt;
	}

	public String getCstmrMemo() {
		return cstmrMemo;
	}

	public void setCstmrMemo(String cstmrMemo) {
		this.cstmrMemo = cstmrMemo;
	}

	public String getCnsltCallNo() {
		return cnsltCallNo;
	}

	public void setCnsltCallNo(String cnsltCallNo) {
		this.cnsltCallNo = cnsltCallNo;
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

	public String getSearchCstmrCd() {
		return searchCstmrCd;
	}

	public void setSearchCstmrCd(String searchCstmrCd) {
		this.searchCstmrCd = searchCstmrCd;
	}

	public String getSearchLeadDt() {
		return searchLeadDt;
	}

	public void setSearchLeadDt(String searchLeadDt) {
		this.searchLeadDt = searchLeadDt;
	}

	public String getSearchLeadType() {
		return searchLeadType;
	}

	public void setSearchLeadType(String searchLeadType) {
		this.searchLeadType = searchLeadType;
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

	List <SalesLeadRegMngVO> ec4SalesLeadRegMngList;


	/**
	 * ec4SalesLeadRegMngList attribute 를 리턴한다.
	 * @return List<EC4SalesLeadRegMngVO>
	 */
	public List<SalesLeadRegMngVO> getEC4SalesLeadRegMngList() {
		return ec4SalesLeadRegMngList;
	}

	/**
	 * ec4SalesLeadRegMngList attribute 값을 설정한다.
	 * @param ec4SalesLeadRegMngList List<EC4SalesLeadRegMngVO>
	 */
	public void setEC4SalesLeadRegMngList(List<SalesLeadRegMngVO> ec4SalesLeadRegMngList) {
		this.ec4SalesLeadRegMngList = ec4SalesLeadRegMngList;
	}





    /**
     * EgovMap에서 VO셋팅
     *
     * @param egovMap
     */
    public void setValuesFromEgovMap(EgovMap egovMap) {

		this.cstmrCd = (String)egovMap.get("cstmrCd");
		this.leadDt = (String)egovMap.get("leadDt");
		this.leadSeq = String.valueOf(egovMap.get("leadSeq"));
		this.leadType = (String)egovMap.get("leadType");
		this.brandCd = (String)egovMap.get("brandCd");
		this.vhcty = (String)egovMap.get("vhcty");
		this.modelCd = (String)egovMap.get("modelCd");
		this.colCd = (String)egovMap.get("colCd");
		this.hpno = (String)egovMap.get("hpno");
		this.telno = (String)egovMap.get("telno");
		this.zip = (String)egovMap.get("zip");
		this.adres = (String)egovMap.get("adres");
		this.adresDetail = (String)egovMap.get("adresDetail");
		this.shopNm = (String)egovMap.get("shopNm");
		this.delvDt = (String)egovMap.get("delvDt");
		this.cstmrMemo = (String)egovMap.get("cstmrMemo");
		this.cnsltCallNo = (String)egovMap.get("cnsltCallNo");
		this.cnsltUserId = (String)egovMap.get("cnsltUserId");
		this.registDe = String.valueOf(egovMap.get("registDe"));
		this.register = (String)egovMap.get("register");
		this.updtDe = String.valueOf(egovMap.get("updtDe"));
		this.updusr = (String)egovMap.get("updusr");


        this.cstmrNm = (String)egovMap.get("cstmrNm");
        this.modelNm = (String)egovMap.get("modelNm");
    }
}