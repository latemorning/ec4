package egovframework.ec4.call.cnslt.service;

import java.util.List;

import egovframework.ec4.cmm.service.EC4DefaultVO;

/**
 * 상담원스케줄에 대한 Vo 클래스를 정의한다.
 * @author 최재중
 * @since 2019.01.03
 * @version 1.0
 * @see
 *
 * <pre>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2019.01.03  최재중          최초 생성
 *
 * </pre>
 */

public class CnsltScheduleMngVO extends EC4DefaultVO {

	private static final long serialVersionUID = 1L;

	List <CnsltScheduleMngVO> cnsltScheduleMngList;

	


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
	
	
	private String schdlStartDt;
	private String schdlEndDt;
	private String fromTime;
	private String bFromTime;
	private String cFromTime;
	private String toTime;
	private String bToTime;
	private String cToTime;
	private String allDay;
	private String schdlType;
	private String schdlKnd;
	private String schdlMemo;
	private String fromTimeHour;
	private String fromTimeMinute;
	private String toTimeHour;
	private String toTimeMinute;
	
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
	
	private String searchEndDe;
	private String searchBeginDe;
    
    

	public String getFromTimeHour() {
		return fromTimeHour;
	}

	public void setFromTimeHour(String fromTimeHour) {
		this.fromTimeHour = fromTimeHour;
	}

	public String getFromTimeMinute() {
		return fromTimeMinute;
	}

	public void setFromTimeMinute(String fromTimeMinute) {
		this.fromTimeMinute = fromTimeMinute;
	}

	public String getToTimeHour() {
		return toTimeHour;
	}

	public void setToTimeHour(String toTimeHour) {
		this.toTimeHour = toTimeHour;
	}

	public String getToTimeMinute() {
		return toTimeMinute;
	}

	public void setToTimeMinute(String toTimeMinute) {
		this.toTimeMinute = toTimeMinute;
	}

	public String getSchdlStartDt() {
		return schdlStartDt;
	}

	public void setSchdlStartDt(String schdlStartDt) {
		this.schdlStartDt = schdlStartDt;
	}

	public String getSchdlEndDt() {
		return schdlEndDt;
	}

	public void setSchdlEndDt(String schdlEndDt) {
		this.schdlEndDt = schdlEndDt;
	}

	public String getFromTime() {
		return fromTime;
	}

	public void setFromTime(String fromTime) {
		this.fromTime = fromTime;
	}

	public String getbFromTime() {
		return bFromTime;
	}

	public void setbFromTime(String bFromTime) {
		this.bFromTime = bFromTime;
	}

	public String getcFromTime() {
		return cFromTime;
	}

	public void setcFromTime(String cFromTime) {
		this.cFromTime = cFromTime;
	}

	public String getToTime() {
		return toTime;
	}

	public void setToTime(String toTime) {
		this.toTime = toTime;
	}

	public String getbToTime() {
		return bToTime;
	}

	public void setbToTime(String bToTime) {
		this.bToTime = bToTime;
	}

	public String getcToTime() {
		return cToTime;
	}

	public void setcToTime(String cToTime) {
		this.cToTime = cToTime;
	}

	public String getAllDay() {
		return allDay;
	}

	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}

	public String getSchdlType() {
		return schdlType;
	}

	public void setSchdlType(String schdlType) {
		this.schdlType = schdlType;
	}

	public String getSchdlKnd() {
		return schdlKnd;
	}

	public void setSchdlKnd(String schdlKnd) {
		this.schdlKnd = schdlKnd;
	}

	public String getSchdlMemo() {
		return schdlMemo;
	}

	public void setSchdlMemo(String schdlMemo) {
		this.schdlMemo = schdlMemo;
	}

	public String getSearchEndDe() {
		return searchEndDe;
	}

	public void setSearchEndDe(String searchEndDe) {
		this.searchEndDe = searchEndDe;
	}

	public String getSearchBeginDe() {
		return searchBeginDe;
	}

	public void setSearchBeginDe(String searchBeginDe) {
		this.searchBeginDe = searchBeginDe;
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
	 * cnsltScheduleMngList attribute 를 리턴한다.
	 * @return List<CnsltScheduleMngVO>
	 */
	public List<CnsltScheduleMngVO> getCnsltScheduleMngList() {
		return cnsltScheduleMngList;
	}

	/**
	 * ec4SalesLeadRegMngList attribute 값을 설정한다.
	 * @param cnsltScheduleMngList List<CnsltScheduleMngVO>
	 */
	public void setCnsltScheduleMngList(List<CnsltScheduleMngVO> cnsltScheduleMngList) {
		this.cnsltScheduleMngList = cnsltScheduleMngList;
	}



}