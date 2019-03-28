package egovframework.ec4.cmm.cinfo.service;

import java.util.List;

import egovframework.ec4.cmm.service.EC4DefaultVO;
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

public class CstmrIntgrMngVO extends EC4DefaultVO {

	private static final long serialVersionUID = 1L;

	List <CstmrIntgrMngVO> cstmrIntgrMngList;

	private String cstmrCd;                        /* 콜고객코드 */
	private String cstmrNm;                        /* 콜고객명 */
	private String hpno;                           /* 핸드폰번호 */
	private String telno;                          /* 전화번호 */
	private String brthdy;                         /* 생년월일 */
	private String emailAdres;                     /* 이메일주소 */
	private String emailDomain;                    /* 이메일도메인 */
	private String vhcleNo;                        /* 차량번호 */
	private String vin;                            /* 차대번호 */
	private String houseZip;                       /* 집우편번호 */
	private String houseAdres;                     /* 집주소 */
	private String houseAdresDetail;               /* 집주소상세 */
	private String officeZip;                      /* 직장우편번호 */
	private String officeAdres;                    /* 직장주소 */
	private String officeAdresDetail;              /* 직장주소상세 */
	private String telRecvYn;                      /* 전화수신여부 */
	private String smsRecvYn;                      /* SMS수신여부 */
	private String emailRecvYn;                    /* 이메일수신여부 */
	private String faxRecvYn;                      /* FAX수신여부 */
	private String dmRecvYn;                       /* DM수신여부 */
	private String mberGrad;                       /* 회원등급 */
	private String chevMembYn;                     /* 쉐보레멤버여부 */
	private String webMembYn;                      /* 웹멤버여부 */
	private String wutoMembYn;                     /* 오토멤버여부 */
	private String cstmrMemo;                      /* 고객메모 */
	private String registDe;
	private String register;
	private String updtDe;
	private String updusr;
	
	private String relSeq;
	private String relKnd;
	private String dealerCd;
	private String birthSex;
	private String handPhoneNo;
	private String custNm;
	private String eMail;
	private String vinComp;
	private String vinType;
	private String vinCheck;
	private String vinMdlYear;
	private String vinPlan;
	private String vinBodyNo;
	private String vinDup;
	private String vehiNo01;
	private String vehiNo02;

	
	private String popupNm;
	private String modelCd;
	private String modelNm;
	private String colorNm;
	
	private String cstmrEsntlId;
	private String cstmrVhcleSeq;
	private String vhcleEsntlId;
	private String acqdt;
	private String acqspc;
	private String acqstx;
	private String acqsTyCode;
	private String vmcd;
	private String vhctCd;
	private String vhclMdl;
	private String vhclDetlMdl;
	
	private String ifKnd;
	private String ifKndNm;
	private String lastRcptDate;
	private String lastCustNm;
	private String adviserNm;
	private String deliDate;
	private String mfgDate;
	private String lastReadKm;
	private String optionNm;
	private String envcertYn;
	private String envcertNo;
	private String emailAddress;
	private String homeAddress;
	private String sexKnd;
	private String selectEmailDomain;
	private String cstmrInfoUseDscr;
	

	private String searchCstmrCd;                        /* 콜고객코드 */
	private String searchCstmrNm;                        /* 콜고객명 */
	private String searchHpno;                           /* 핸드폰번호 */
	private String searchTelno;                          /* 전화번호 */
	private String searchBrthdy;                         /* 생년월일 */
	private String searchEmailAdres;                     /* 이메일주소 */
	private String searchVhcleNo;                        /* 차량번호 */
	private String searchVin;                            /* 차대번호 */
	private String searchHouseAdres;                     /* 집주소 */
	private String searchHouseAdresDetail;               /* 집주소상세 */
	private String searchOfficeAdres;                    /* 직장주소 */
	private String searchOfficeAdresDetail;              /* 직장주소상세 */
    
    

	public String getCstmrInfoUseDscr() {
		return cstmrInfoUseDscr;
	}

	public void setCstmrInfoUseDscr(String cstmrInfoUseDscr) {
		this.cstmrInfoUseDscr = cstmrInfoUseDscr;
	}

	public String getSexKnd() {
		return sexKnd;
	}

	public void setSexKnd(String sexKnd) {
		this.sexKnd = sexKnd;
	}

	public String getSelectEmailDomain() {
		return selectEmailDomain;
	}

	public void setSelectEmailDomain(String selectEmailDomain) {
		this.selectEmailDomain = selectEmailDomain;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getHomeAddress() {
		return homeAddress;
	}

	public void setHomeAddress(String homeAddress) {
		this.homeAddress = homeAddress;
	}

	public String getDeliDate() {
		return deliDate;
	}

	public void setDeliDate(String deliDate) {
		this.deliDate = deliDate;
	}

	public String getMfgDate() {
		return mfgDate;
	}

	public void setMfgDate(String mfgDate) {
		this.mfgDate = mfgDate;
	}

	public String getLastReadKm() {
		return lastReadKm;
	}

	public void setLastReadKm(String lastReadKm) {
		this.lastReadKm = lastReadKm;
	}

	public String getOptionNm() {
		return optionNm;
	}

	public void setOptionNm(String optionNm) {
		this.optionNm = optionNm;
	}

	public String getEnvcertYn() {
		return envcertYn;
	}

	public void setEnvcertYn(String envcertYn) {
		this.envcertYn = envcertYn;
	}

	public String getEnvcertNo() {
		return envcertNo;
	}

	public void setEnvcertNo(String envcertNo) {
		this.envcertNo = envcertNo;
	}

	public String getLastRcptDate() {
		return lastRcptDate;
	}

	public void setLastRcptDate(String lastRcptDate) {
		this.lastRcptDate = lastRcptDate;
	}

	public String getLastCustNm() {
		return lastCustNm;
	}

	public void setLastCustNm(String lastCustNm) {
		this.lastCustNm = lastCustNm;
	}

	public String getAdviserNm() {
		return adviserNm;
	}

	public void setAdviserNm(String adviserNm) {
		this.adviserNm = adviserNm;
	}

	public String getIfKnd() {
		return ifKnd;
	}

	public void setIfKnd(String ifKnd) {
		this.ifKnd = ifKnd;
	}

	public String getIfKndNm() {
		return ifKndNm;
	}

	public void setIfKndNm(String ifKndNm) {
		this.ifKndNm = ifKndNm;
	}

	public String getCstmrEsntlId() {
		return cstmrEsntlId;
	}

	public void setCstmrEsntlId(String cstmrEsntlId) {
		this.cstmrEsntlId = cstmrEsntlId;
	}

	public String getCstmrVhcleSeq() {
		return cstmrVhcleSeq;
	}

	public void setCstmrVhcleSeq(String cstmrVhcleSeq) {
		this.cstmrVhcleSeq = cstmrVhcleSeq;
	}

	public String getVhcleEsntlId() {
		return vhcleEsntlId;
	}

	public void setVhcleEsntlId(String vhcleEsntlId) {
		this.vhcleEsntlId = vhcleEsntlId;
	}

	public String getAcqdt() {
		return acqdt;
	}

	public void setAcqdt(String acqdt) {
		this.acqdt = acqdt;
	}

	public String getAcqspc() {
		return acqspc;
	}

	public void setAcqspc(String acqspc) {
		this.acqspc = acqspc;
	}

	public String getAcqstx() {
		return acqstx;
	}

	public void setAcqstx(String acqstx) {
		this.acqstx = acqstx;
	}

	public String getAcqsTyCode() {
		return acqsTyCode;
	}

	public void setAcqsTyCode(String acqsTyCode) {
		this.acqsTyCode = acqsTyCode;
	}

	public String getVmcd() {
		return vmcd;
	}

	public void setVmcd(String vmcd) {
		this.vmcd = vmcd;
	}

	public String getVhctCd() {
		return vhctCd;
	}

	public void setVhctCd(String vhctCd) {
		this.vhctCd = vhctCd;
	}

	public String getVhclMdl() {
		return vhclMdl;
	}

	public void setVhclMdl(String vhclMdl) {
		this.vhclMdl = vhclMdl;
	}

	public String getVhclDetlMdl() {
		return vhclDetlMdl;
	}

	public void setVhclDetlMdl(String vhclDetlMdl) {
		this.vhclDetlMdl = vhclDetlMdl;
	}

	public String getRelSeq() {
		return relSeq;
	}

	public void setRelSeq(String relSeq) {
		this.relSeq = relSeq;
	}

	public String getRelKnd() {
		return relKnd;
	}

	public void setRelKnd(String relKnd) {
		this.relKnd = relKnd;
	}

	public String getDealerCd() {
		return dealerCd;
	}

	public void setDealerCd(String dealerCd) {
		this.dealerCd = dealerCd;
	}

	public String getBirthSex() {
		return birthSex;
	}

	public void setBirthSex(String birthSex) {
		this.birthSex = birthSex;
	}

	public String getHandPhoneNo() {
		return handPhoneNo;
	}

	public void setHandPhoneNo(String handPhoneNo) {
		this.handPhoneNo = handPhoneNo;
	}

	public String getCustNm() {
		return custNm;
	}

	public void setCustNm(String custNm) {
		this.custNm = custNm;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	public String getVinComp() {
		return vinComp;
	}

	public void setVinComp(String vinComp) {
		this.vinComp = vinComp;
	}

	public String getVinType() {
		return vinType;
	}

	public void setVinType(String vinType) {
		this.vinType = vinType;
	}

	public String getVinCheck() {
		return vinCheck;
	}

	public void setVinCheck(String vinCheck) {
		this.vinCheck = vinCheck;
	}

	public String getVinMdlYear() {
		return vinMdlYear;
	}

	public void setVinMdlYear(String vinMdlYear) {
		this.vinMdlYear = vinMdlYear;
	}

	public String getVinPlan() {
		return vinPlan;
	}

	public void setVinPlan(String vinPlan) {
		this.vinPlan = vinPlan;
	}

	public String getVinBodyNo() {
		return vinBodyNo;
	}

	public void setVinBodyNo(String vinBodyNo) {
		this.vinBodyNo = vinBodyNo;
	}

	public String getVinDup() {
		return vinDup;
	}

	public void setVinDup(String vinDup) {
		this.vinDup = vinDup;
	}

	public String getVehiNo01() {
		return vehiNo01;
	}

	public void setVehiNo01(String vehiNo01) {
		this.vehiNo01 = vehiNo01;
	}

	public String getVehiNo02() {
		return vehiNo02;
	}

	public void setVehiNo02(String vehiNo02) {
		this.vehiNo02 = vehiNo02;
	}

	public String getModelCd() {
		return modelCd;
	}

	public void setModelCd(String modelCd) {
		this.modelCd = modelCd;
	}

	public String getModelNm() {
		return modelNm;
	}

	public void setModelNm(String modelNm) {
		this.modelNm = modelNm;
	}

	public String getColorNm() {
		return colorNm;
	}

	public void setColorNm(String colorNm) {
		this.colorNm = colorNm;
	}

	public String getPopupNm() {
		return popupNm;
	}

	public void setPopupNm(String popupNm) {
		this.popupNm = popupNm;
	}

	public String getSearchCstmrCd() {
		return searchCstmrCd;
	}

	public void setSearchCstmrCd(String searchCstmrCd) {
		this.searchCstmrCd = searchCstmrCd;
	}

	public String getSearchCstmrNm() {
		return searchCstmrNm;
	}

	public void setSearchCstmrNm(String searchCstmrNm) {
		this.searchCstmrNm = searchCstmrNm;
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

	public String getSearchBrthdy() {
		return searchBrthdy;
	}

	public void setSearchBrthdy(String searchBrthdy) {
		this.searchBrthdy = searchBrthdy;
	}

	public String getSearchEmailAdres() {
		return searchEmailAdres;
	}

	public void setSearchEmailAdres(String searchEmailAdres) {
		this.searchEmailAdres = searchEmailAdres;
	}

	public String getSearchVhcleNo() {
		return searchVhcleNo;
	}

	public void setSearchVhcleNo(String searchVhcleNo) {
		this.searchVhcleNo = searchVhcleNo;
	}

	public String getSearchVin() {
		return searchVin;
	}

	public void setSearchVin(String searchVin) {
		this.searchVin = searchVin;
	}

	public String getSearchHouseAdres() {
		return searchHouseAdres;
	}

	public void setSearchHouseAdres(String searchHouseAdres) {
		this.searchHouseAdres = searchHouseAdres;
	}

	public String getSearchHouseAdresDetail() {
		return searchHouseAdresDetail;
	}

	public void setSearchHouseAdresDetail(String searchHouseAdresDetail) {
		this.searchHouseAdresDetail = searchHouseAdresDetail;
	}

	public String getSearchOfficeAdres() {
		return searchOfficeAdres;
	}

	public void setSearchOfficeAdres(String searchOfficeAdres) {
		this.searchOfficeAdres = searchOfficeAdres;
	}

	public String getSearchOfficeAdresDetail() {
		return searchOfficeAdresDetail;
	}

	public void setSearchOfficeAdresDetail(String searchOfficeAdresDetail) {
		this.searchOfficeAdresDetail = searchOfficeAdresDetail;
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

	public String getCstmrCd() {
		return cstmrCd;
	}

	public void setCstmrCd(String cstmrCd) {
		this.cstmrCd = cstmrCd;
	}

	public String getCstmrNm() {
		return cstmrNm;
	}

	public void setCstmrNm(String cstmrNm) {
		this.cstmrNm = cstmrNm;
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

	public String getBrthdy() {
		return brthdy;
	}

	public void setBrthdy(String brthdy) {
		this.brthdy = brthdy;
	}

	public String getEmailAdres() {
		return emailAdres;
	}

	public void setEmailAdres(String emailAdres) {
		this.emailAdres = emailAdres;
	}

	public String getEmailDomain() {
		return emailDomain;
	}

	public void setEmailDomain(String emailDomain) {
		this.emailDomain = emailDomain;
	}

	public String getVhcleNo() {
		return vhcleNo;
	}

	public void setVhcleNo(String vhcleNo) {
		this.vhcleNo = vhcleNo;
	}

	public String getVin() {
		return vin;
	}

	public void setVin(String vin) {
		this.vin = vin;
	}

	public String getHouseZip() {
		return houseZip;
	}

	public void setHouseZip(String houseZip) {
		this.houseZip = houseZip;
	}

	public String getHouseAdres() {
		return houseAdres;
	}

	public void setHouseAdres(String houseAdres) {
		this.houseAdres = houseAdres;
	}

	public String getHouseAdresDetail() {
		return houseAdresDetail;
	}

	public void setHouseAdresDetail(String houseAdresDetail) {
		this.houseAdresDetail = houseAdresDetail;
	}

	public String getOfficeZip() {
		return officeZip;
	}

	public void setOfficeZip(String officeZip) {
		this.officeZip = officeZip;
	}

	public String getOfficeAdres() {
		return officeAdres;
	}

	public void setOfficeAdres(String officeAdres) {
		this.officeAdres = officeAdres;
	}

	public String getOfficeAdresDetail() {
		return officeAdresDetail;
	}

	public void setOfficeAdresDetail(String officeAdresDetail) {
		this.officeAdresDetail = officeAdresDetail;
	}

	public String getTelRecvYn() {
		return telRecvYn;
	}

	public void setTelRecvYn(String telRecvYn) {
		this.telRecvYn = telRecvYn;
	}

	public String getSmsRecvYn() {
		return smsRecvYn;
	}

	public void setSmsRecvYn(String smsRecvYn) {
		this.smsRecvYn = smsRecvYn;
	}

	public String getEmailRecvYn() {
		return emailRecvYn;
	}

	public void setEmailRecvYn(String emailRecvYn) {
		this.emailRecvYn = emailRecvYn;
	}

	public String getFaxRecvYn() {
		return faxRecvYn;
	}

	public void setFaxRecvYn(String faxRecvYn) {
		this.faxRecvYn = faxRecvYn;
	}

	public String getDmRecvYn() {
		return dmRecvYn;
	}

	public void setDmRecvYn(String dmRecvYn) {
		this.dmRecvYn = dmRecvYn;
	}

	public String getMberGrad() {
		return mberGrad;
	}

	public void setMberGrad(String mberGrad) {
		this.mberGrad = mberGrad;
	}

	public String getChevMembYn() {
		return chevMembYn;
	}

	public void setChevMembYn(String chevMembYn) {
		this.chevMembYn = chevMembYn;
	}

	public String getWebMembYn() {
		return webMembYn;
	}

	public void setWebMembYn(String webMembYn) {
		this.webMembYn = webMembYn;
	}

	public String getWutoMembYn() {
		return wutoMembYn;
	}

	public void setWutoMembYn(String wutoMembYn) {
		this.wutoMembYn = wutoMembYn;
	}

	public String getCstmrMemo() {
		return cstmrMemo;
	}

	public void setCstmrMemo(String cstmrMemo) {
		this.cstmrMemo = cstmrMemo;
	}

	/**
	 * cstmrIntgrMngList attribute 를 리턴한다.
	 * @return List<CstmrIntgrMngVO>
	 */
	public List<CstmrIntgrMngVO> getCstmrIntgrMngList() {
		return cstmrIntgrMngList;
	}

	/**
	 * ec4SalesLeadRegMngList attribute 값을 설정한다.
	 * @param cstmrIntgrMngList List<CstmrIntgrMngVO>
	 */
	public void setCstmrIntgrMngList(List<CstmrIntgrMngVO> cstmrIntgrMngList) {
		this.cstmrIntgrMngList = cstmrIntgrMngList;
	}





    /**
     * EgovMap에서 VO셋팅
     *
     * @param egovMap
     */
    public void setValuesFromEgovMap(EgovMap egovMap) {
    	
    	this.cstmrCd = (String)egovMap.get("cstmrCd");                        /* 콜고객코드 */
    	this.cstmrNm = (String)egovMap.get("cstmrNm");                        /* 콜고객명 */
    	this.hpno = (String)egovMap.get("hpno");                           /* 핸드폰번호 */
    	this.telno = (String)egovMap.get("telno");                          /* 전화번호 */
    	this.brthdy = (String)egovMap.get("brthdy");                         /* 생년월일 */
    	this.emailAdres = (String)egovMap.get("emailAdres");                     /* 이메일주소 */
    	this.emailDomain = (String)egovMap.get("emailDomain");                    /* 이메일도메인 */
    	this.vhcleNo = (String)egovMap.get("vhcleNo");                        /* 차량번호 */
    	this.vin = (String)egovMap.get("vin");                            /* 차대번호 */
    	this.houseZip = (String)egovMap.get("houseZip");                       /* 집우편번호 */
    	this.houseAdres = (String)egovMap.get("houseAdres");                     /* 집주소 */
    	this.houseAdresDetail = (String)egovMap.get("houseAdresDetail");               /* 집주소상세 */
    	this.officeZip = (String)egovMap.get("officeZip");                      /* 직장우편번호 */
    	this.officeAdres = (String)egovMap.get("officeAdres");                    /* 직장주소 */
    	this.officeAdresDetail = (String)egovMap.get("officeAdresDetail");              /* 직장주소상세 */
    	this.telRecvYn = (String)egovMap.get("telRecvYn");                      /* 전화수신여부 */
    	this.smsRecvYn = (String)egovMap.get("smsRecvYn");                      /* SMS수신여부 */
    	this.emailRecvYn = (String)egovMap.get("emailRecvYn");                    /* 이메일수신여부 */
    	this.faxRecvYn = (String)egovMap.get("faxRecvYn");                      /* FAX수신여부 */
    	this.dmRecvYn = (String)egovMap.get("dmRecvYn");                       /* DM수신여부 */
    	this.mberGrad = (String)egovMap.get("mberGrad");                       /* 회원등급 */
    	this.chevMembYn = (String)egovMap.get("chevMembYn");                     /* 쉐보레멤버여부 */
    	this.webMembYn = (String)egovMap.get("webMembYn");                      /* 웹멤버여부 */
    	this.wutoMembYn = (String)egovMap.get("wutoMembYn");                     /* 오토멤버여부 */
    	this.cstmrMemo = (String)egovMap.get("cstmrMemo");                      /* 고객메모 */
    	
    	this.relSeq = "null".equals(String.valueOf(egovMap.get("relSeq")))?"":String.valueOf(egovMap.get("relSeq"));
    	this.relKnd = (String)egovMap.get("relKnd");
    	this.dealerCd = (String)egovMap.get("dealerCd");
    	this.birthSex = (String)egovMap.get("birthSex");
    	this.handPhoneNo = (String)egovMap.get("handPhoneNo");
    	this.custNm = (String)egovMap.get("custNm");
    	this.eMail = (String)egovMap.get("eMail");
    	this.vinComp = (String)egovMap.get("vinComp");
    	this.vinType = (String)egovMap.get("vinType");
    	this.vinCheck = (String)egovMap.get("vinCheck");
    	this.vinMdlYear = (String)egovMap.get("vinMdlYear");
    	this.vinPlan = (String)egovMap.get("vinPlan");
    	this.vinBodyNo = (String)egovMap.get("vinBodyNo");
    	this.vinDup = (String)egovMap.get("vinDup");
    	this.vehiNo01 = (String)egovMap.get("vehiNo01");
    	this.vehiNo02 = (String)egovMap.get("vehiNo02");
    	
    	this.modelCd = (String)egovMap.get("modelCd");
    	this.modelNm = (String)egovMap.get("modelNm");
    	this.colorNm = (String)egovMap.get("colorNm");
    	
    	this.cstmrEsntlId = (String)egovMap.get("cstmrEsntlId");
    	this.cstmrVhcleSeq = (String)egovMap.get("cstmrVhcleSeq");
    	this.vhcleEsntlId = (String)egovMap.get("vhcleEsntlId");
    	this.acqdt = (String)egovMap.get("acqdt");
    	this.acqspc = (String)egovMap.get("acqspc");
    	this.acqstx = (String)egovMap.get("acqstx");
    	this.acqsTyCode = (String)egovMap.get("acqsTyCode");
    	this.vmcd = (String)egovMap.get("vmcd");
    	this.vhctCd = (String)egovMap.get("vhctCd");
    	this.vhclMdl = (String)egovMap.get("vhclMdl");
    	this.vhclDetlMdl = (String)egovMap.get("vhclDetlMdl");
    	
    	this.ifKnd = (String)egovMap.get("ifKnd");
    	this.ifKndNm = (String)egovMap.get("ifKndNm");
    	this.lastRcptDate = (String)egovMap.get("lastRcptDate");
    	this.lastCustNm = (String)egovMap.get("lastCustNm");
    	this.adviserNm = (String)egovMap.get("adviserNm");
    	this.deliDate = (String)egovMap.get("deliDate");
    	this.mfgDate = (String)egovMap.get("mfgDate");
    	this.lastReadKm = (String)egovMap.get("lastReadKm");
    	this.optionNm = (String)egovMap.get("optionNm");
    	this.envcertYn = (String)egovMap.get("envcertYn");
    	this.envcertNo = (String)egovMap.get("envcertNo");
    	this.emailAddress = (String)egovMap.get("emailAddress");
    	this.homeAddress = (String)egovMap.get("homeAddress");
    	this.sexKnd = (String)egovMap.get("sexKnd");
    	this.selectEmailDomain = (String)egovMap.get("selectEmailDomain");    	
    }



}