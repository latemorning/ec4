package egovframework.ec4.call.carsos.service;

import java.util.ArrayList;
import java.util.List;

import egovframework.ec4.cmm.cbase.cmt.service.DetailCodeVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 긴급출동에 대한 Vo 클래스를 정의한다.
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

public class CarSosReceiptMngVO extends DetailCodeVO{

	private static final long serialVersionUID = 1L;

	private String emergencyRcptNo = "";                /* 접수번호 */
	private String rcptDt = "";							/* 접수일자 */
	private String rcptUserId = "";						/* 접수자아이디 */
	private String networkId = "";                      /* 네트워크아이디 */
	private String networkType = "";                    /* 네트워크유형 */
	private String cstmrCarStatusId = "";               /* 고객차량상태 */
	private String cstmrCarSttusNm = "";                /* 고객차량상태명 */
	private String cstmrCd = "";                        /* 고객코드 */
	private String cstmrNm = "";                        /* 고객명 */
	private String cstmrKnd = "";                       /* 고객구분 */
	private String hpno = "";                           /* 휴대전화 */
	private String vecleNo1 = "";                       /* 전화번호 */
	private String vecleNo2 = "";                       /* 차량번호2 */
	private String vin1 = "";                           /* 차대번호1 */
	private String vin2 = "";                           /* 차대번호2 */
	private String vhctyCode = "";                      /* 차종코드 */
	private String cstmrPlc = "";                       /* 고객위치 */
	private String postId = "";                         /* 포스트 */
	private String odometer = "";                       /* 주행거리 */
	private String emergencyDt = "";                    /* 출동일자 */
	private String emergencyTime = "";                  /* 출동시간 */
	private String arrivalDt = "";                      /* 도착일자 */
	private String arrivalTime = "";                    /* 도착시간 */
	private String endDt = "";                          /* 끝일시 */
	private String endTime = "";                        /* 완료시간 */
	private String serviceId = "";                      /* 조치코드 */
	private String resultType = "";                     /* 상담처리상태 */
	private String etcMemo = "";                        /* 기타메모 */
	private String selfFlag = "";                       /* 자체처리정보 */
	private String emergencyVhctyCode = "";             /* 출동차종 */
	private String emergencyPostId = "";                /* 출동포스트 */
	private String emergencyVin1 = "";                  /* 출동차대번호1 */
	private String emergencyVin2 = "";                  /* 출동차대번호2 */
	private String emergencyVinChkYn = "";              /* 출동차대번호체크여부 */
	private String zip = "";                            /* 우편번호 */
	private String adres = "";                          /* 주소 */
	private String adresDetail = "";                    /* 주소상세 */
	private String adresDetl = "";                    /* 주소상세 */
	private String callCd = "";                         /* 콜코드 */
	private String callColectGbCd = "";                 /* 콜수집구분코드 */
	private String cnsltUserId = "";                    /* 상담원아이디 */
	private String reqCstmrNm = "";						/* 의뢰인명 */
	private String reqCstmrHpno = "";					/* 의뢰인핸드폰 */
	private String registDe = "";                       /* 등록일자 */
	private String register = "";                       /* 등록자 */
	private String updtDe = "";                         /* 수정일자 */
	private String updusr = "";                         /* 수정자 */
	
	private String bussplcCd1 = "";
	private String bussplcCd2 = "";
	private String bussplcCd3 = "";
	private String bussplcCd4 = "";
	
	private String vmcd = "";
	private String vhctCd = "";
	private String vhclMdl = "";
	private String vhclDetlMdl = "";
	private String vocKnd = "";
	private String cmplSittnCd = "";
	
	private String cnsltIncallNo = "";
    private String vmcdNm = "";
    private String vhctCdNm = "";
    private String vhclMdlNm = "";
    private String vhclDetlMdlNm = "";
    private String emailAdres = "";
    private String emailDomain = "";
	private String lastRcptDate = "";
	private String lastReadKm = "";
	private String lastVhclMdl = "";
	private String typeYear = "";
	private String lastCustCode = "";
	private String lastcustNm = "";
	private String vhcleNo = "";
	private String vin = "";
	private String emailAddress = "";
	private String lastInShop = "";
	private String lastInDate = "";
	private String cnsltTyCn = "";
	private String cnsltTyCnCode = "";
	
	
	private String searchCnsltIncallNo = "";                  /* 인바운드콜번호 */
	private String searchCnsltUserId = "";                    /* 상담원아이디 */
	private String searchCstmrCd = "";                        /* 콜고객코드 */
	private String searchCnsltSeCode = "";
	private String searchParntsCodeId = "";
	private String searchCnsltUserNm= "";                    /* 상담원명 */
	private String searchCstmrNm = "";
	private String searchHpno = "";
	private String searchEmailAdres = "";
	private String searchCnsltTyCn = "";
	private String searchCnsltTyCnCode = "";
	private String searchCnsltBeginDe = "";
	private String searchCnsltEndDe = "";
	private String searchBeginDe = "";
	private String searchEndDe = "";
	private String searchCarNo = "";
	private String searchCnsltKnd = "";
	
	private String searchRcptDt = "";
	private String searchRcptUserId = "";
	private String searchRcptUserNm = "";
	private String searchCustNm = "";
	private String searchVhcleNo = "";
	private String searchVin = "";


	private ArrayList<CarSosReceiptMngVO> listCarSosReceiptTable = null;
	
	List <CarSosReceiptMngVO> carSosReceiptMngList;
	
	
	
	
	
	
	

	

	public String getCnsltTyCn() {
		return cnsltTyCn;
	}

	public void setCnsltTyCn(String cnsltTyCn) {
		this.cnsltTyCn = cnsltTyCn;
	}

	public String getCnsltTyCnCode() {
		return cnsltTyCnCode;
	}

	public void setCnsltTyCnCode(String cnsltTyCnCode) {
		this.cnsltTyCnCode = cnsltTyCnCode;
	}

	public String getSearchCnsltTyCnCode() {
		return searchCnsltTyCnCode;
	}

	public void setSearchCnsltTyCnCode(String searchCnsltTyCnCode) {
		this.searchCnsltTyCnCode = searchCnsltTyCnCode;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getLastInShop() {
		return lastInShop;
	}

	public void setLastInShop(String lastInShop) {
		this.lastInShop = lastInShop;
	}

	public String getLastInDate() {
		return lastInDate;
	}

	public void setLastInDate(String lastInDate) {
		this.lastInDate = lastInDate;
	}

	public String getRcptDt() {
		return rcptDt;
	}

	public void setRcptDt(String rcptDt) {
		this.rcptDt = rcptDt;
	}

	public String getRcptUserId() {
		return rcptUserId;
	}

	public void setRcptUserId(String rcptUserId) {
		this.rcptUserId = rcptUserId;
	}

	public String getSearchRcptUserId() {
		return searchRcptUserId;
	}

	public void setSearchRcptUserId(String searchRcptUserId) {
		this.searchRcptUserId = searchRcptUserId;
	}

	public String getSearchRcptUserNm() {
		return searchRcptUserNm;
	}

	public void setSearchRcptUserNm(String searchRcptUserNm) {
		this.searchRcptUserNm = searchRcptUserNm;
	}

	public String getSearchRcptDt() {
		return searchRcptDt;
	}

	public void setSearchRcptDt(String searchRcptDt) {
		this.searchRcptDt = searchRcptDt;
	}

	public String getSearchCustNm() {
		return searchCustNm;
	}

	public void setSearchCustNm(String searchCustNm) {
		this.searchCustNm = searchCustNm;
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

	public String getReqCstmrNm() {
		return reqCstmrNm;
	}

	public void setReqCstmrNm(String reqCstmrNm) {
		this.reqCstmrNm = reqCstmrNm;
	}

	public String getReqCstmrHpno() {
		return reqCstmrHpno;
	}

	public void setReqCstmrHpno(String reqCstmrHpno) {
		this.reqCstmrHpno = reqCstmrHpno;
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

	public String getAdresDetl() {
		return adresDetl;
	}

	public void setAdresDetl(String adresDetl) {
		this.adresDetl = adresDetl;
	}

	public String getCnsltIncallNo() {
		return cnsltIncallNo;
	}

	public void setCnsltIncallNo(String cnsltIncallNo) {
		this.cnsltIncallNo = cnsltIncallNo;
	}

	public String getVmcdNm() {
		return vmcdNm;
	}

	public void setVmcdNm(String vmcdNm) {
		this.vmcdNm = vmcdNm;
	}

	public String getVhctCdNm() {
		return vhctCdNm;
	}

	public void setVhctCdNm(String vhctCdNm) {
		this.vhctCdNm = vhctCdNm;
	}

	public String getVhclMdlNm() {
		return vhclMdlNm;
	}

	public void setVhclMdlNm(String vhclMdlNm) {
		this.vhclMdlNm = vhclMdlNm;
	}

	public String getVhclDetlMdlNm() {
		return vhclDetlMdlNm;
	}

	public void setVhclDetlMdlNm(String vhclDetlMdlNm) {
		this.vhclDetlMdlNm = vhclDetlMdlNm;
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

	public String getLastRcptDate() {
		return lastRcptDate;
	}

	public void setLastRcptDate(String lastRcptDate) {
		this.lastRcptDate = lastRcptDate;
	}

	public String getLastReadKm() {
		return lastReadKm;
	}

	public void setLastReadKm(String lastReadKm) {
		this.lastReadKm = lastReadKm;
	}

	public String getLastVhclMdl() {
		return lastVhclMdl;
	}

	public void setLastVhclMdl(String lastVhclMdl) {
		this.lastVhclMdl = lastVhclMdl;
	}

	public String getTypeYear() {
		return typeYear;
	}

	public void setTypeYear(String typeYear) {
		this.typeYear = typeYear;
	}

	public String getLastCustCode() {
		return lastCustCode;
	}

	public void setLastCustCode(String lastCustCode) {
		this.lastCustCode = lastCustCode;
	}

	public String getLastcustNm() {
		return lastcustNm;
	}

	public void setLastcustNm(String lastcustNm) {
		this.lastcustNm = lastcustNm;
	}

	public String getCmplSittnCd() {
		return cmplSittnCd;
	}

	public void setCmplSittnCd(String cmplSittnCd) {
		this.cmplSittnCd = cmplSittnCd;
	}

	public String getVocKnd() {
		return vocKnd;
	}

	public void setVocKnd(String vocKnd) {
		this.vocKnd = vocKnd;
	}

	public String getEmergencyRcptNo() {
		return emergencyRcptNo;
	}

	public void setEmergencyRcptNo(String emergencyRcptNo) {
		this.emergencyRcptNo = emergencyRcptNo;
	}

	public String getNetworkId() {
		return networkId;
	}

	public void setNetworkId(String networkId) {
		this.networkId = networkId;
	}

	public String getNetworkType() {
		return networkType;
	}

	public void setNetworkType(String networkType) {
		this.networkType = networkType;
	}

	public String getCstmrCarStatusId() {
		return cstmrCarStatusId;
	}

	public void setCstmrCarStatusId(String cstmrCarStatusId) {
		this.cstmrCarStatusId = cstmrCarStatusId;
	}

	public String getCstmrCarSttusNm() {
		return cstmrCarSttusNm;
	}

	public void setCstmrCarSttusNm(String cstmrCarSttusNm) {
		this.cstmrCarSttusNm = cstmrCarSttusNm;
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

	public String getCstmrKnd() {
		return cstmrKnd;
	}

	public void setCstmrKnd(String cstmrKnd) {
		this.cstmrKnd = cstmrKnd;
	}

	public String getHpno() {
		return hpno;
	}

	public void setHpno(String hpno) {
		this.hpno = hpno;
	}

	public String getVecleNo1() {
		return vecleNo1;
	}

	public void setVecleNo1(String vecleNo1) {
		this.vecleNo1 = vecleNo1;
	}

	public String getVecleNo2() {
		return vecleNo2;
	}

	public void setVecleNo2(String vecleNo2) {
		this.vecleNo2 = vecleNo2;
	}

	public String getVin1() {
		return vin1;
	}

	public void setVin1(String vin1) {
		this.vin1 = vin1;
	}

	public String getVin2() {
		return vin2;
	}

	public void setVin2(String vin2) {
		this.vin2 = vin2;
	}

	public String getVhctyCode() {
		return vhctyCode;
	}

	public void setVhctyCode(String vhctyCode) {
		this.vhctyCode = vhctyCode;
	}

	public String getCstmrPlc() {
		return cstmrPlc;
	}

	public void setCstmrPlc(String cstmrPlc) {
		this.cstmrPlc = cstmrPlc;
	}

	public String getPostId() {
		return postId;
	}

	public void setPostId(String postId) {
		this.postId = postId;
	}

	public String getOdometer() {
		return odometer;
	}

	public void setOdometer(String odometer) {
		this.odometer = odometer;
	}

	public String getEmergencyDt() {
		return emergencyDt;
	}

	public void setEmergencyDt(String emergencyDt) {
		this.emergencyDt = emergencyDt;
	}

	public String getEmergencyTime() {
		return emergencyTime;
	}

	public void setEmergencyTime(String emergencyTime) {
		this.emergencyTime = emergencyTime;
	}

	public String getArrivalDt() {
		return arrivalDt;
	}

	public void setArrivalDt(String arrivalDt) {
		this.arrivalDt = arrivalDt;
	}

	public String getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	public String getEndDt() {
		return endDt;
	}

	public void setEndDt(String endDt) {
		this.endDt = endDt;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getServiceId() {
		return serviceId;
	}

	public void setServiceId(String serviceId) {
		this.serviceId = serviceId;
	}

	public String getResultType() {
		return resultType;
	}

	public void setResultType(String resultType) {
		this.resultType = resultType;
	}

	public String getEtcMemo() {
		return etcMemo;
	}

	public void setEtcMemo(String etcMemo) {
		this.etcMemo = etcMemo;
	}

	public String getSelfFlag() {
		return selfFlag;
	}

	public void setSelfFlag(String selfFlag) {
		this.selfFlag = selfFlag;
	}

	public String getEmergencyVhctyCode() {
		return emergencyVhctyCode;
	}

	public void setEmergencyVhctyCode(String emergencyVhctyCode) {
		this.emergencyVhctyCode = emergencyVhctyCode;
	}

	public String getEmergencyPostId() {
		return emergencyPostId;
	}

	public void setEmergencyPostId(String emergencyPostId) {
		this.emergencyPostId = emergencyPostId;
	}

	public String getEmergencyVin1() {
		return emergencyVin1;
	}

	public void setEmergencyVin1(String emergencyVin1) {
		this.emergencyVin1 = emergencyVin1;
	}

	public String getEmergencyVin2() {
		return emergencyVin2;
	}

	public void setEmergencyVin2(String emergencyVin2) {
		this.emergencyVin2 = emergencyVin2;
	}

	public String getEmergencyVinChkYn() {
		return emergencyVinChkYn;
	}

	public void setEmergencyVinChkYn(String emergencyVinChkYn) {
		this.emergencyVinChkYn = emergencyVinChkYn;
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

	public String getCallCd() {
		return callCd;
	}

	public void setCallCd(String callCd) {
		this.callCd = callCd;
	}

	public String getCallColectGbCd() {
		return callColectGbCd;
	}

	public void setCallColectGbCd(String callColectGbCd) {
		this.callColectGbCd = callColectGbCd;
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

	public String getBussplcCd1() {
		return bussplcCd1;
	}

	public void setBussplcCd1(String bussplcCd1) {
		this.bussplcCd1 = bussplcCd1;
	}

	public String getBussplcCd2() {
		return bussplcCd2;
	}

	public void setBussplcCd2(String bussplcCd2) {
		this.bussplcCd2 = bussplcCd2;
	}

	public String getBussplcCd3() {
		return bussplcCd3;
	}

	public void setBussplcCd3(String bussplcCd3) {
		this.bussplcCd3 = bussplcCd3;
	}

	public String getBussplcCd4() {
		return bussplcCd4;
	}

	public void setBussplcCd4(String bussplcCd4) {
		this.bussplcCd4 = bussplcCd4;
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

	public String getSearchCnsltIncallNo() {
		return searchCnsltIncallNo;
	}

	public void setSearchCnsltIncallNo(String searchCnsltIncallNo) {
		this.searchCnsltIncallNo = searchCnsltIncallNo;
	}

	public String getSearchCnsltUserId() {
		return searchCnsltUserId;
	}

	public void setSearchCnsltUserId(String searchCnsltUserId) {
		this.searchCnsltUserId = searchCnsltUserId;
	}

	public String getSearchCstmrCd() {
		return searchCstmrCd;
	}

	public void setSearchCstmrCd(String searchCstmrCd) {
		this.searchCstmrCd = searchCstmrCd;
	}

	public String getSearchCnsltSeCode() {
		return searchCnsltSeCode;
	}

	public void setSearchCnsltSeCode(String searchCnsltSeCode) {
		this.searchCnsltSeCode = searchCnsltSeCode;
	}

	public String getSearchParntsCodeId() {
		return searchParntsCodeId;
	}

	public void setSearchParntsCodeId(String searchParntsCodeId) {
		this.searchParntsCodeId = searchParntsCodeId;
	}

	public String getSearchCnsltUserNm() {
		return searchCnsltUserNm;
	}

	public void setSearchCnsltUserNm(String searchCnsltUserNm) {
		this.searchCnsltUserNm = searchCnsltUserNm;
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

	public String getSearchEmailAdres() {
		return searchEmailAdres;
	}

	public void setSearchEmailAdres(String searchEmailAdres) {
		this.searchEmailAdres = searchEmailAdres;
	}

	public String getSearchCnsltTyCn() {
		return searchCnsltTyCn;
	}

	public void setSearchCnsltTyCn(String searchCnsltTyCn) {
		this.searchCnsltTyCn = searchCnsltTyCn;
	}

	public String getSearchCnsltBeginDe() {
		return searchCnsltBeginDe;
	}

	public void setSearchCnsltBeginDe(String searchCnsltBeginDe) {
		this.searchCnsltBeginDe = searchCnsltBeginDe;
	}

	public String getSearchCnsltEndDe() {
		return searchCnsltEndDe;
	}

	public void setSearchCnsltEndDe(String searchCnsltEndDe) {
		this.searchCnsltEndDe = searchCnsltEndDe;
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

	public String getSearchCarNo() {
		return searchCarNo;
	}

	public void setSearchCarNo(String searchCarNo) {
		this.searchCarNo = searchCarNo;
	}

	public String getSearchCnsltKnd() {
		return searchCnsltKnd;
	}

	public void setSearchCnsltKnd(String searchCnsltKnd) {
		this.searchCnsltKnd = searchCnsltKnd;
	}

	public ArrayList<CarSosReceiptMngVO> getListCarSosReceiptTable() {
		return listCarSosReceiptTable;
	}

	public void setListCarSosReceiptTable(ArrayList<CarSosReceiptMngVO> listCarSosReceiptTable) {
		this.listCarSosReceiptTable = listCarSosReceiptTable;
	}

	/**
	 * carSosReceiptMngList attribute 를 리턴한다.
	 * @return List<CarSosReceiptMngVO>
	 */
	public List<CarSosReceiptMngVO> getCarSosReceiptMngList() {
		return carSosReceiptMngList;
	}

	/**
	 * ec4SalesLeadRegMngList attribute 값을 설정한다.
	 * @param carSosReceiptMngList List<CarSosReceiptMngVO>
	 */
	public void setCarSosReceiptMngList(List<CarSosReceiptMngVO> carSosReceiptMngList) {
		this.carSosReceiptMngList = carSosReceiptMngList;
	}





    /**
     * EgovMap에서 VO셋팅
     *
     * @param egovMap
     */
    public void setValuesFromEgovMap(EgovMap egovMap) {

    	this.emergencyRcptNo = (String)egovMap.get("emergencyRcptNo");                /* 접수번호 */
    	this.networkId = (String)egovMap.get("networkId");                      /* 네트워크아이디 */
    	this.networkType = (String)egovMap.get("networkType");                    /* 네트워크유형 */
    	this.cstmrCarStatusId = (String)egovMap.get("cstmrCarStatusId");               /* 고객차량상태 */
    	this.cstmrCarSttusNm = (String)egovMap.get("cstmrCarSttusNm");                /* 고객차량상태명 */
    	this.cstmrCd = (String)egovMap.get("cstmrCd");                        /* 콜고객코드 */
    	this.cstmrNm = (String)egovMap.get("cstmrNm");                        /* 고객명 */
    	this.cstmrKnd = (String)egovMap.get("cstmrKnd");                       /* 고객구분 */
    	this.hpno = (String)egovMap.get("hpno");                           /* 휴대전화 */
    	this.vhcleNo = (String)egovMap.get("vhcleNo");                       /* 차량번호 */
    	this.vecleNo1 = (String)egovMap.get("vecleNo1");                       /* 차량번호1 */
    	this.vecleNo2 = (String)egovMap.get("vecleNo2");                       /* 차량번호2 */
    	this.vin = (String)egovMap.get("vin");                           /* 차대번호 */
    	this.vin1 = (String)egovMap.get("vin1");                           /* 차대번호1 */
    	this.vin2 = (String)egovMap.get("vocKnd");                           /* 차대번호2 */
    	this.vhctyCode = (String)egovMap.get("vhctyCode");                      /* 차종코드 */
    	this.cstmrPlc = (String)egovMap.get("cstmrPlc");                       /* 고객위치 */
    	this.postId = (String)egovMap.get("postId");                         /* 포스트 */
    	this.odometer = (String)egovMap.get("odometer");                       /* 주행거리 */
    	this.emergencyDt = (String)egovMap.get("emergencyDt");                    /* 출동일자 */
    	this.emergencyTime = (String)egovMap.get("emergencyTime");                  /* 출동시간 */
    	this.arrivalDt = (String)egovMap.get("arrivalDt");                      /* 도착일자 */
    	this.arrivalTime = (String)egovMap.get("arrivalTime");                    /* 도착시간 */
    	this.endDt = (String)egovMap.get("endDt");                          /* 끝일시 */
    	this.endTime = (String)egovMap.get("endTime");                        /* 완료시간 */
    	this.serviceId = (String)egovMap.get("serviceId");                      /* 조치코드 */
    	this.resultType = (String)egovMap.get("resultType");                     /* 상담처리상태 */
    	this.etcMemo = (String)egovMap.get("etcMemo");                        /* 기타메모 */
    	this.selfFlag = (String)egovMap.get("selfFlag");                       /* 자체처리정보 */
    	this.emergencyVhctyCode = (String)egovMap.get("emergencyVhctyCode");             /* 출동차종 */
    	this.emergencyPostId = (String)egovMap.get("emergencyPostId");                /* 출동포스트 */
    	this.emergencyVin1 = (String)egovMap.get("emergencyVin1");                  /* 출동차대번호1 */
    	this.emergencyVin2 = (String)egovMap.get("emergencyVin2");                  /* 출동차대번호2 */
    	this.emergencyVinChkYn = (String)egovMap.get("emergencyVinChkYn");              /* 출동차대번호체크여부 */
    	this.zip = (String)egovMap.get("zip");                            /* 우편번호 */
    	this.adres = (String)egovMap.get("adres");                          /* 주소 */
    	this.adresDetail = (String)egovMap.get("adresDetail");                    /* 주소상세 */
    	this.adresDetl = (String)egovMap.get("adresDetl");                    /* 주소상세 */
	    this.emailAdres = (String)egovMap.get("emailAdres");
	    this.emailDomain = (String)egovMap.get("emailDomain");
    	this.callCd = (String)egovMap.get("callCd");                         /* 콜코드 */
    	this.callColectGbCd = (String)egovMap.get("callColectGbCd");                 /* 콜수집구분코드 */
    	this.cnsltUserId = (String)egovMap.get("cnsltUserId");                    /* 상담원아이디 */
	    this.cnsltIncallNo = (String)egovMap.get("cnsltIncallNo");                  /* 인바운드콜번호 */
	    this.vocKnd = (String)egovMap.get("vocKnd");
	    this.cmplSittnCd = (String)egovMap.get("cmplSittnCd");
	    this.reqCstmrNm = (String)egovMap.get("reqCstmrNm");
	    this.reqCstmrHpno = (String)egovMap.get("reqCstmrHpno");
	    
	    

	    this.registDe = (String)egovMap.get("registDe");                       /* 등록일자 */
	    this.register = (String)egovMap.get("register");                       /* 등록자 */
	    this.updtDe = (String)egovMap.get("updtDe");                         /* 수정일자 */
	    this.updusr = (String)egovMap.get("updusr");                         /* 수정자 */
        
	    this.bussplcCd1 = (String)egovMap.get("bussplcCd1");
	    this.bussplcCd2 = (String)egovMap.get("bussplcCd2");
	    this.bussplcCd3 = (String)egovMap.get("bussplcCd3");
	    this.bussplcCd4 = (String)egovMap.get("bussplcCd4");
	    
	    this.vmcd = (String)egovMap.get("vmcd");
	    this.vhctCd = (String)egovMap.get("vhctCd");
	    this.vhclMdl = (String)egovMap.get("vhclMdl");
	    this.vhclDetlMdl = (String)egovMap.get("vhclDetlMdl");
	    
	    this.vmcdNm = (String)egovMap.get("vmcdNm");
	    this.vhctCdNm = (String)egovMap.get("vhctCdNm");
	    this.vhclMdlNm = (String)egovMap.get("vhclMdlNm");
	    this.vhclDetlMdlNm = (String)egovMap.get("vhclDetlMdlNm");
	    
	    
	    
	    
		//this.cmplRecptSeq = "null".equals(String.valueOf(egovMap.get("cmplRecptSeq")))?"":String.valueOf(egovMap.get("cmplRecptSeq"));

		this.lastRcptDate = (String)egovMap.get("lastRcptDate");
		this.lastReadKm = (String)egovMap.get("lastReadKm");
		this.lastVhclMdl = (String)egovMap.get("lastVhclMdl");
		this.typeYear = (String)egovMap.get("typeYear");
		this.lastCustCode = (String)egovMap.get("lastCustCode");
		this.lastcustNm = (String)egovMap.get("lastcustNm");
		this.emailAddress = (String)egovMap.get("emailAddress");
		this.lastInShop = (String)egovMap.get("lastInShop");
		this.lastInDate = (String)egovMap.get("lastInDate");

    }



}