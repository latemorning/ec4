package egovframework.ec4.call.cnslt.service;

import java.util.List;

import egovframework.ec4.cmm.service.EC4DefaultVO;

/**
 * 상담원에 대한 Vo 클래스를 정의한다.
 * @author 최재중
 * @since 2018.09.19
 * @version 1.0
 * @see
 *
 * <pre>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2018.09.19  최재중          최초 생성
 *
 * </pre>
 */

public class CnsltntMngVO extends EC4DefaultVO {

	private static final long serialVersionUID = 1L;

	List <CnsltntMngVO> cnsltntMngList;

	
	private String emplyrId;
	private String orgnztId;
	private String userNm;
	private String password;
	private String emplNo;
	private String ihidnum;
	private String sexdstnCode;
	private String brthdy;
	private String fxnum;
	private String houseAdres;
	private String passwordHint;
	private String passwordCnsr;
	private String houseEndTelno;
	private String areaNo;
	private String detailAdres;
	private String zip;
	private String offmTelno;
	private String mbtlnum;
	private String emailAdres;
	private String ofcpsNm;
	private String houseMiddleTelno;
	private String groupId;
	private String pstinstCode;
	private String emplyrSttusCode;
	private String esntlId;
	private String crtfcDnValue;
	private String sbscrbDe;


	private String cnsltUserId;                        /* 콜상담원코드 */
	private String cnsltUserNm;                        /* 콜상담원명 */
	private String hpno;                           /* 핸드폰번호 */
	private String telno;                          /* 전화번호 */
	private String emailDomain;                    /* 이메일도메인 */
	private String vhcleNo;                        /* 차량번호 */
	private String vin;                            /* 차대번호 */
	private String houseZip;                       /* 집우편번호 */
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
	private String cnsltntMemo;                      /* 상담원메모 */
	private String registDe;
	private String register;
	private String updtDe;
	private String updusr;
	
	private String popupNm;

	private String searchEmplyrId;
	private String searchOrgnztId;
	private String searchUserNm;	
	private String searchEmplNo;
	private String searchHouseEndTelno;
	private String searchDetailAdres;
	private String searchMbtlnum;
	private String searchOfcpsNm;
	private String searchHouseMiddleTelno;
	private String searchGroupId;
	private String searchPstinstCode;
	private String searchEmplyrSttusCode;
	private String searchSbscrbDe;
	
	private String searchCnsltUserId;                        /* 콜상담원코드 */
	private String searchCnsltUserNm;                        /* 콜상담원명 */
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
    
    

	public String getEmplyrId() {
		return emplyrId;
	}

	public void setEmplyrId(String emplyrId) {
		this.emplyrId = emplyrId;
	}

	public String getOrgnztId() {
		return orgnztId;
	}

	public void setOrgnztId(String orgnztId) {
		this.orgnztId = orgnztId;
	}

	public String getUserNm() {
		return userNm;
	}

	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmplNo() {
		return emplNo;
	}

	public void setEmplNo(String emplNo) {
		this.emplNo = emplNo;
	}

	public String getIhidnum() {
		return ihidnum;
	}

	public void setIhidnum(String ihidnum) {
		this.ihidnum = ihidnum;
	}

	public String getSexdstnCode() {
		return sexdstnCode;
	}

	public void setSexdstnCode(String sexdstnCode) {
		this.sexdstnCode = sexdstnCode;
	}

	public String getFxnum() {
		return fxnum;
	}

	public void setFxnum(String fxnum) {
		this.fxnum = fxnum;
	}

	public String getPasswordHint() {
		return passwordHint;
	}

	public void setPasswordHint(String passwordHint) {
		this.passwordHint = passwordHint;
	}

	public String getPasswordCnsr() {
		return passwordCnsr;
	}

	public void setPasswordCnsr(String passwordCnsr) {
		this.passwordCnsr = passwordCnsr;
	}

	public String getHouseEndTelno() {
		return houseEndTelno;
	}

	public void setHouseEndTelno(String houseEndTelno) {
		this.houseEndTelno = houseEndTelno;
	}

	public String getAreaNo() {
		return areaNo;
	}

	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}

	public String getDetailAdres() {
		return detailAdres;
	}

	public void setDetailAdres(String detailAdres) {
		this.detailAdres = detailAdres;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getOffmTelno() {
		return offmTelno;
	}

	public void setOffmTelno(String offmTelno) {
		this.offmTelno = offmTelno;
	}

	public String getMbtlnum() {
		return mbtlnum;
	}

	public void setMbtlnum(String mbtlnum) {
		this.mbtlnum = mbtlnum;
	}

	public String getOfcpsNm() {
		return ofcpsNm;
	}

	public void setOfcpsNm(String ofcpsNm) {
		this.ofcpsNm = ofcpsNm;
	}

	public String getHouseMiddleTelno() {
		return houseMiddleTelno;
	}

	public void setHouseMiddleTelno(String houseMiddleTelno) {
		this.houseMiddleTelno = houseMiddleTelno;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getPstinstCode() {
		return pstinstCode;
	}

	public void setPstinstCode(String pstinstCode) {
		this.pstinstCode = pstinstCode;
	}

	public String getEmplyrSttusCode() {
		return emplyrSttusCode;
	}

	public void setEmplyrSttusCode(String emplyrSttusCode) {
		this.emplyrSttusCode = emplyrSttusCode;
	}

	public String getEsntlId() {
		return esntlId;
	}

	public void setEsntlId(String esntlId) {
		this.esntlId = esntlId;
	}

	public String getCrtfcDnValue() {
		return crtfcDnValue;
	}

	public void setCrtfcDnValue(String crtfcDnValue) {
		this.crtfcDnValue = crtfcDnValue;
	}

	public String getSbscrbDe() {
		return sbscrbDe;
	}

	public void setSbscrbDe(String sbscrbDe) {
		this.sbscrbDe = sbscrbDe;
	}

	public String getSearchEmplyrId() {
		return searchEmplyrId;
	}

	public void setSearchEmplyrId(String searchEmplyrId) {
		this.searchEmplyrId = searchEmplyrId;
	}

	public String getSearchOrgnztId() {
		return searchOrgnztId;
	}

	public void setSearchOrgnztId(String searchOrgnztId) {
		this.searchOrgnztId = searchOrgnztId;
	}

	public String getSearchUserNm() {
		return searchUserNm;
	}

	public void setSearchUserNm(String searchUserNm) {
		this.searchUserNm = searchUserNm;
	}

	public String getSearchEmplNo() {
		return searchEmplNo;
	}

	public void setSearchEmplNo(String searchEmplNo) {
		this.searchEmplNo = searchEmplNo;
	}

	public String getSearchHouseEndTelno() {
		return searchHouseEndTelno;
	}

	public void setSearchHouseEndTelno(String searchHouseEndTelno) {
		this.searchHouseEndTelno = searchHouseEndTelno;
	}

	public String getSearchDetailAdres() {
		return searchDetailAdres;
	}

	public void setSearchDetailAdres(String searchDetailAdres) {
		this.searchDetailAdres = searchDetailAdres;
	}

	public String getSearchMbtlnum() {
		return searchMbtlnum;
	}

	public void setSearchMbtlnum(String searchMbtlnum) {
		this.searchMbtlnum = searchMbtlnum;
	}

	public String getSearchOfcpsNm() {
		return searchOfcpsNm;
	}

	public void setSearchOfcpsNm(String searchOfcpsNm) {
		this.searchOfcpsNm = searchOfcpsNm;
	}

	public String getSearchHouseMiddleTelno() {
		return searchHouseMiddleTelno;
	}

	public void setSearchHouseMiddleTelno(String searchHouseMiddleTelno) {
		this.searchHouseMiddleTelno = searchHouseMiddleTelno;
	}

	public String getSearchGroupId() {
		return searchGroupId;
	}

	public void setSearchGroupId(String searchGroupId) {
		this.searchGroupId = searchGroupId;
	}

	public String getSearchPstinstCode() {
		return searchPstinstCode;
	}

	public void setSearchPstinstCode(String searchPstinstCode) {
		this.searchPstinstCode = searchPstinstCode;
	}

	public String getSearchEmplyrSttusCode() {
		return searchEmplyrSttusCode;
	}

	public void setSearchEmplyrSttusCode(String searchEmplyrSttusCode) {
		this.searchEmplyrSttusCode = searchEmplyrSttusCode;
	}

	public String getSearchSbscrbDe() {
		return searchSbscrbDe;
	}

	public void setSearchSbscrbDe(String searchSbscrbDe) {
		this.searchSbscrbDe = searchSbscrbDe;
	}

	public String getPopupNm() {
		return popupNm;
	}

	public void setPopupNm(String popupNm) {
		this.popupNm = popupNm;
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

	public String getCnsltUserId() {
		return cnsltUserId;
	}

	public void setCnsltUserId(String cnsltUserId) {
		this.cnsltUserId = cnsltUserId;
	}

	public String getCnsltUserNm() {
		return cnsltUserNm;
	}

	public void setCnsltUserNm(String cnsltUserNm) {
		this.cnsltUserNm = cnsltUserNm;
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

	public String getCnsltntMemo() {
		return cnsltntMemo;
	}

	public void setCnsltntMemo(String cnsltntMemo) {
		this.cnsltntMemo = cnsltntMemo;
	}

	/**
	 * cnsltntMngList attribute 를 리턴한다.
	 * @return List<CnsltntMngVO>
	 */
	public List<CnsltntMngVO> getCnsltntMngList() {
		return cnsltntMngList;
	}

	/**
	 * ec4SalesLeadRegMngList attribute 값을 설정한다.
	 * @param cnsltntMngList List<CnsltntMngVO>
	 */
	public void setCnsltntMngList(List<CnsltntMngVO> cnsltntMngList) {
		this.cnsltntMngList = cnsltntMngList;
	}



}