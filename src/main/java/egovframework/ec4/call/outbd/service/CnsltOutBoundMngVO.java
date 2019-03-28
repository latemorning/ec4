package egovframework.ec4.call.outbd.service;

import java.util.ArrayList;
import java.util.List;

import egovframework.ec4.cmm.cbase.cmt.service.DetailCodeVO;

/**
 * 아웃바운드콜상담현황에 대한 Vo 클래스를 정의한다.
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

public class CnsltOutBoundMngVO extends DetailCodeVO{

	private static final long serialVersionUID = 1L;

	

	private String chk = "";
	private String makrCd = "";
	private String cstmrCd = "";
	private String cstmrNm = "";
	private String hpno = "";
	private String emailAdres = "";
	private String adres = "";
	private String adresDetl = "";
	private String bussplcCode = "";
	private String bussplcNm = "";
	private String bussplcKnd = "";
	private String appCnsltUserId = "";
	private String appCnsltUserNm = "";
	private String appBussplcCode = "";
	private String appBussplcNm = "";
	private String brthdy = "";
	
	private String registDe = "";                       /* 등록일자 */
	private String register = "";                       /* 등록자 */
	private String updtDe = "";                         /* 수정일자 */
	private String updusr = "";                         /* 수정자 */
	
	private String searchCnsltSeCode = "";
	private String searchCnsltTyCn = "";
	private String searchCnsltTyCnCode = "";
	private String searchBeginDe = "";
	private String searchEndDe = "";
	private String searchScriptKnd = "";
	private String searchScriptCd = "";
	private String searchCallGbCd = "";
	private String cnsltTyCn = "";
	private String cnsltTyCnCode = "";
	
	
	
	private String callCd = "";
	private String callColectGbCd = "";
	private String callCstmrCdSeq = "";
	private String scriptKnd = "";
	private String scriptCd = "";
	private String callColectDt = "";
	private String callGbCd = "";
	private String callColectPathCd = "";
	private String callFilterYn = "";
	private String callAskStateCd = "";
	private String callAskStateResnDscr = "";
	private String spltCd = "";
	private String asignCnsltUserId = "";
	private String asignDt = "";
	private String callState = "";
	private String callAsign = "";
	private String searchHpno = "";
	private String searchCarNo = "";
	private String scriptKndNm = "";
	private String scriptCdNm = "";
	private String recvNo = "";
	private String recvDt = "";
	private String accptDt = "";
	private String callStateNm = "";
	private String searchCnsltUserId = "";
	private String searchCstmrCd = "";
	private String searchCnsltUserNm = "";
	private String searchCstmrNm = "";
	private String instAsignKnd = "";

	private String callCstmrExecSeq = "";               /* 콜고객수행순번 */
	private String callDt = "";                         /* 콜일자 */
	private String callTime = "";                       /* 콜시간 */
	private String recordCd = "";                       /* 녹취코드 */
	private String crmCallPathCd = "";                  /* CRM콜경로코드 */
	private String callPrgssStateCd = "";               /* 콜진행상태코드 */
	private String cnsltUserId = "";                    /* 수행상담원아이디 */
	private String execDeptCd = "";                     /* 수행부서코드 */
	private String scExrciseYn = "";                    /* SC칭찬여부 */
	private String asExrciseYn = "";                    /* AS칭찬여부 */
	private String exrciseDscr = "";                    /* 칭찬내용 */
	private String kindDscnttYn = "";                   /* 친절불만여부 */
	private String resrvDscnttYn = "";                  /* 예약불만여부 */
	private String rprTimDscnttYn = "";                 /* 수리시간불만여부 */
	private String rprCostDscnttYn = "";                /* 수리비용불만여부 */
	private String oganzQlityDscnttYn = "";             /* 정비품질불만여부 */
	private String cmpntDscnttYn = "";                  /* 부품불만여부 */
	private String vhcleSelfDscnttYn = "";              /* 차량자체불만여부 */
	private String cntrOperDscnttYn = "";               /* 센터운영불만여부 */
	private String etcDscnttYn = "";                    /* 기타불만여부 */
	private String dscnttRcptYn = "";                   /* 불만접수여부 */
	private String currRsltCd = "";                     /* 통화결과코드 */
	private String currRsltDscr = "";                   /* 통화결과내용 */
	private String infoModDscr = "";                    /* 정보수정내용 */
	private String cmpgnDscr = "";                      /* 캠페인내용 */
	private String todayReCurrDscr = "";                /* 당일재통화내용 */
	private String smsRcvNo = "";                       /* SMS수신번호 */
	private String addrCnfrmYn = "";                    /* 주소확인여부 */
	private String empAtitdYn = "";                     /* 직원태도여부 */
	private String vhcleDscnttYn = "";                  /* 차량불만여부 */
	private String rlsAftMngYn = "";                    /* 출고후관리여부 */
	private String vhcleRlsTimYn = "";                  /* 차량출고시기여부 */
	private String empKnwldgYn = "";                    /* 직원지식여부 */
	private String naviYn = "";                         /* 네비게이션여부 */
	private String prcPayYn = "";                       /* 대금결제여부 */
	private String asGuidYn = "";                       /* AS안내여부 */
	
	
	
	

	List <CnsltOutBoundMngVO> cnsltOutBoundMngList;
	
	private ArrayList<CnsltOutBoundMngVO> listCnsltOutBoundMngList = null;

	
	
	
	
	
	
	
	
	

	public String getSearchCnsltTyCnCode() {
		return searchCnsltTyCnCode;
	}

	public void setSearchCnsltTyCnCode(String searchCnsltTyCnCode) {
		this.searchCnsltTyCnCode = searchCnsltTyCnCode;
	}

	public String getCnsltTyCnCode() {
		return cnsltTyCnCode;
	}

	public void setCnsltTyCnCode(String cnsltTyCnCode) {
		this.cnsltTyCnCode = cnsltTyCnCode;
	}

	public String getChk() {
		return chk;
	}

	public void setChk(String chk) {
		this.chk = chk;
	}

	public String getMakrCd() {
		return makrCd;
	}

	public void setMakrCd(String makrCd) {
		this.makrCd = makrCd;
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

	public String getEmailAdres() {
		return emailAdres;
	}

	public void setEmailAdres(String emailAdres) {
		this.emailAdres = emailAdres;
	}

	public String getAdres() {
		return adres;
	}

	public void setAdres(String adres) {
		this.adres = adres;
	}

	public String getAdresDetl() {
		return adresDetl;
	}

	public void setAdresDetl(String adresDetl) {
		this.adresDetl = adresDetl;
	}

	public String getBussplcCode() {
		return bussplcCode;
	}

	public void setBussplcCode(String bussplcCode) {
		this.bussplcCode = bussplcCode;
	}

	public String getBussplcNm() {
		return bussplcNm;
	}

	public void setBussplcNm(String bussplcNm) {
		this.bussplcNm = bussplcNm;
	}

	public String getBussplcKnd() {
		return bussplcKnd;
	}

	public void setBussplcKnd(String bussplcKnd) {
		this.bussplcKnd = bussplcKnd;
	}

	public String getAppCnsltUserId() {
		return appCnsltUserId;
	}

	public void setAppCnsltUserId(String appCnsltUserId) {
		this.appCnsltUserId = appCnsltUserId;
	}

	public String getAppCnsltUserNm() {
		return appCnsltUserNm;
	}

	public void setAppCnsltUserNm(String appCnsltUserNm) {
		this.appCnsltUserNm = appCnsltUserNm;
	}

	public String getAppBussplcCode() {
		return appBussplcCode;
	}

	public void setAppBussplcCode(String appBussplcCode) {
		this.appBussplcCode = appBussplcCode;
	}

	public String getAppBussplcNm() {
		return appBussplcNm;
	}

	public void setAppBussplcNm(String appBussplcNm) {
		this.appBussplcNm = appBussplcNm;
	}

	public String getBrthdy() {
		return brthdy;
	}

	public void setBrthdy(String brthdy) {
		this.brthdy = brthdy;
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

	public String getSearchCnsltSeCode() {
		return searchCnsltSeCode;
	}

	public void setSearchCnsltSeCode(String searchCnsltSeCode) {
		this.searchCnsltSeCode = searchCnsltSeCode;
	}

	public String getSearchCnsltTyCn() {
		return searchCnsltTyCn;
	}

	public void setSearchCnsltTyCn(String searchCnsltTyCn) {
		this.searchCnsltTyCn = searchCnsltTyCn;
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

	public String getSearchScriptKnd() {
		return searchScriptKnd;
	}

	public void setSearchScriptKnd(String searchScriptKnd) {
		this.searchScriptKnd = searchScriptKnd;
	}

	public String getSearchScriptCd() {
		return searchScriptCd;
	}

	public void setSearchScriptCd(String searchScriptCd) {
		this.searchScriptCd = searchScriptCd;
	}

	public String getSearchCallGbCd() {
		return searchCallGbCd;
	}

	public void setSearchCallGbCd(String searchCallGbCd) {
		this.searchCallGbCd = searchCallGbCd;
	}

	public String getCnsltTyCn() {
		return cnsltTyCn;
	}

	public void setCnsltTyCn(String cnsltTyCn) {
		this.cnsltTyCn = cnsltTyCn;
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

	public String getCallCstmrCdSeq() {
		return callCstmrCdSeq;
	}

	public void setCallCstmrCdSeq(String callCstmrCdSeq) {
		this.callCstmrCdSeq = callCstmrCdSeq;
	}

	public String getScriptKnd() {
		return scriptKnd;
	}

	public void setScriptKnd(String scriptKnd) {
		this.scriptKnd = scriptKnd;
	}

	public String getScriptCd() {
		return scriptCd;
	}

	public void setScriptCd(String scriptCd) {
		this.scriptCd = scriptCd;
	}

	public String getCallColectDt() {
		return callColectDt;
	}

	public void setCallColectDt(String callColectDt) {
		this.callColectDt = callColectDt;
	}

	public String getCallGbCd() {
		return callGbCd;
	}

	public void setCallGbCd(String callGbCd) {
		this.callGbCd = callGbCd;
	}

	public String getCallColectPathCd() {
		return callColectPathCd;
	}

	public void setCallColectPathCd(String callColectPathCd) {
		this.callColectPathCd = callColectPathCd;
	}

	public String getCallFilterYn() {
		return callFilterYn;
	}

	public void setCallFilterYn(String callFilterYn) {
		this.callFilterYn = callFilterYn;
	}

	public String getCallAskStateCd() {
		return callAskStateCd;
	}

	public void setCallAskStateCd(String callAskStateCd) {
		this.callAskStateCd = callAskStateCd;
	}

	public String getCallAskStateResnDscr() {
		return callAskStateResnDscr;
	}

	public void setCallAskStateResnDscr(String callAskStateResnDscr) {
		this.callAskStateResnDscr = callAskStateResnDscr;
	}

	public String getSpltCd() {
		return spltCd;
	}

	public void setSpltCd(String spltCd) {
		this.spltCd = spltCd;
	}

	public String getAsignCnsltUserId() {
		return asignCnsltUserId;
	}

	public void setAsignCnsltUserId(String asignCnsltUserId) {
		this.asignCnsltUserId = asignCnsltUserId;
	}

	public String getAsignDt() {
		return asignDt;
	}

	public void setAsignDt(String asignDt) {
		this.asignDt = asignDt;
	}

	public String getCallState() {
		return callState;
	}

	public void setCallState(String callState) {
		this.callState = callState;
	}

	public String getCallAsign() {
		return callAsign;
	}

	public void setCallAsign(String callAsign) {
		this.callAsign = callAsign;
	}

	public String getSearchHpno() {
		return searchHpno;
	}

	public void setSearchHpno(String searchHpno) {
		this.searchHpno = searchHpno;
	}

	public String getSearchCarNo() {
		return searchCarNo;
	}

	public void setSearchCarNo(String searchCarNo) {
		this.searchCarNo = searchCarNo;
	}

	public String getScriptKndNm() {
		return scriptKndNm;
	}

	public void setScriptKndNm(String scriptKndNm) {
		this.scriptKndNm = scriptKndNm;
	}

	public String getScriptCdNm() {
		return scriptCdNm;
	}

	public void setScriptCdNm(String scriptCdNm) {
		this.scriptCdNm = scriptCdNm;
	}

	public String getRecvNo() {
		return recvNo;
	}

	public void setRecvNo(String recvNo) {
		this.recvNo = recvNo;
	}

	public String getRecvDt() {
		return recvDt;
	}

	public void setRecvDt(String recvDt) {
		this.recvDt = recvDt;
	}

	public String getAccptDt() {
		return accptDt;
	}

	public void setAccptDt(String accptDt) {
		this.accptDt = accptDt;
	}

	public String getCallStateNm() {
		return callStateNm;
	}

	public void setCallStateNm(String callStateNm) {
		this.callStateNm = callStateNm;
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

	public String getInstAsignKnd() {
		return instAsignKnd;
	}

	public void setInstAsignKnd(String instAsignKnd) {
		this.instAsignKnd = instAsignKnd;
	}

	public String getCallCstmrExecSeq() {
		return callCstmrExecSeq;
	}

	public void setCallCstmrExecSeq(String callCstmrExecSeq) {
		this.callCstmrExecSeq = callCstmrExecSeq;
	}

	public String getCallDt() {
		return callDt;
	}

	public void setCallDt(String callDt) {
		this.callDt = callDt;
	}

	public String getCallTime() {
		return callTime;
	}

	public void setCallTime(String callTime) {
		this.callTime = callTime;
	}

	public String getRecordCd() {
		return recordCd;
	}

	public void setRecordCd(String recordCd) {
		this.recordCd = recordCd;
	}

	public String getCrmCallPathCd() {
		return crmCallPathCd;
	}

	public void setCrmCallPathCd(String crmCallPathCd) {
		this.crmCallPathCd = crmCallPathCd;
	}

	public String getCallPrgssStateCd() {
		return callPrgssStateCd;
	}

	public void setCallPrgssStateCd(String callPrgssStateCd) {
		this.callPrgssStateCd = callPrgssStateCd;
	}

	public String getCnsltUserId() {
		return cnsltUserId;
	}

	public void setCnsltUserId(String cnsltUserId) {
		this.cnsltUserId = cnsltUserId;
	}

	public String getExecDeptCd() {
		return execDeptCd;
	}

	public void setExecDeptCd(String execDeptCd) {
		this.execDeptCd = execDeptCd;
	}

	public String getScExrciseYn() {
		return scExrciseYn;
	}

	public void setScExrciseYn(String scExrciseYn) {
		this.scExrciseYn = scExrciseYn;
	}

	public String getAsExrciseYn() {
		return asExrciseYn;
	}

	public void setAsExrciseYn(String asExrciseYn) {
		this.asExrciseYn = asExrciseYn;
	}

	public String getExrciseDscr() {
		return exrciseDscr;
	}

	public void setExrciseDscr(String exrciseDscr) {
		this.exrciseDscr = exrciseDscr;
	}

	public String getKindDscnttYn() {
		return kindDscnttYn;
	}

	public void setKindDscnttYn(String kindDscnttYn) {
		this.kindDscnttYn = kindDscnttYn;
	}

	public String getResrvDscnttYn() {
		return resrvDscnttYn;
	}

	public void setResrvDscnttYn(String resrvDscnttYn) {
		this.resrvDscnttYn = resrvDscnttYn;
	}

	public String getRprTimDscnttYn() {
		return rprTimDscnttYn;
	}

	public void setRprTimDscnttYn(String rprTimDscnttYn) {
		this.rprTimDscnttYn = rprTimDscnttYn;
	}

	public String getRprCostDscnttYn() {
		return rprCostDscnttYn;
	}

	public void setRprCostDscnttYn(String rprCostDscnttYn) {
		this.rprCostDscnttYn = rprCostDscnttYn;
	}

	public String getOganzQlityDscnttYn() {
		return oganzQlityDscnttYn;
	}

	public void setOganzQlityDscnttYn(String oganzQlityDscnttYn) {
		this.oganzQlityDscnttYn = oganzQlityDscnttYn;
	}

	public String getCmpntDscnttYn() {
		return cmpntDscnttYn;
	}

	public void setCmpntDscnttYn(String cmpntDscnttYn) {
		this.cmpntDscnttYn = cmpntDscnttYn;
	}

	public String getVhcleSelfDscnttYn() {
		return vhcleSelfDscnttYn;
	}

	public void setVhcleSelfDscnttYn(String vhcleSelfDscnttYn) {
		this.vhcleSelfDscnttYn = vhcleSelfDscnttYn;
	}

	public String getCntrOperDscnttYn() {
		return cntrOperDscnttYn;
	}

	public void setCntrOperDscnttYn(String cntrOperDscnttYn) {
		this.cntrOperDscnttYn = cntrOperDscnttYn;
	}

	public String getEtcDscnttYn() {
		return etcDscnttYn;
	}

	public void setEtcDscnttYn(String etcDscnttYn) {
		this.etcDscnttYn = etcDscnttYn;
	}

	public String getDscnttRcptYn() {
		return dscnttRcptYn;
	}

	public void setDscnttRcptYn(String dscnttRcptYn) {
		this.dscnttRcptYn = dscnttRcptYn;
	}

	public String getCurrRsltCd() {
		return currRsltCd;
	}

	public void setCurrRsltCd(String currRsltCd) {
		this.currRsltCd = currRsltCd;
	}

	public String getCurrRsltDscr() {
		return currRsltDscr;
	}

	public void setCurrRsltDscr(String currRsltDscr) {
		this.currRsltDscr = currRsltDscr;
	}

	public String getInfoModDscr() {
		return infoModDscr;
	}

	public void setInfoModDscr(String infoModDscr) {
		this.infoModDscr = infoModDscr;
	}

	public String getCmpgnDscr() {
		return cmpgnDscr;
	}

	public void setCmpgnDscr(String cmpgnDscr) {
		this.cmpgnDscr = cmpgnDscr;
	}

	public String getTodayReCurrDscr() {
		return todayReCurrDscr;
	}

	public void setTodayReCurrDscr(String todayReCurrDscr) {
		this.todayReCurrDscr = todayReCurrDscr;
	}

	public String getSmsRcvNo() {
		return smsRcvNo;
	}

	public void setSmsRcvNo(String smsRcvNo) {
		this.smsRcvNo = smsRcvNo;
	}

	public String getAddrCnfrmYn() {
		return addrCnfrmYn;
	}

	public void setAddrCnfrmYn(String addrCnfrmYn) {
		this.addrCnfrmYn = addrCnfrmYn;
	}

	public String getEmpAtitdYn() {
		return empAtitdYn;
	}

	public void setEmpAtitdYn(String empAtitdYn) {
		this.empAtitdYn = empAtitdYn;
	}

	public String getVhcleDscnttYn() {
		return vhcleDscnttYn;
	}

	public void setVhcleDscnttYn(String vhcleDscnttYn) {
		this.vhcleDscnttYn = vhcleDscnttYn;
	}

	public String getRlsAftMngYn() {
		return rlsAftMngYn;
	}

	public void setRlsAftMngYn(String rlsAftMngYn) {
		this.rlsAftMngYn = rlsAftMngYn;
	}

	public String getVhcleRlsTimYn() {
		return vhcleRlsTimYn;
	}

	public void setVhcleRlsTimYn(String vhcleRlsTimYn) {
		this.vhcleRlsTimYn = vhcleRlsTimYn;
	}

	public String getEmpKnwldgYn() {
		return empKnwldgYn;
	}

	public void setEmpKnwldgYn(String empKnwldgYn) {
		this.empKnwldgYn = empKnwldgYn;
	}

	public String getNaviYn() {
		return naviYn;
	}

	public void setNaviYn(String naviYn) {
		this.naviYn = naviYn;
	}

	public String getPrcPayYn() {
		return prcPayYn;
	}

	public void setPrcPayYn(String prcPayYn) {
		this.prcPayYn = prcPayYn;
	}

	public String getAsGuidYn() {
		return asGuidYn;
	}

	public void setAsGuidYn(String asGuidYn) {
		this.asGuidYn = asGuidYn;
	}

	public ArrayList<CnsltOutBoundMngVO> getListCnsltOutBoundMngList() {
		return listCnsltOutBoundMngList;
	}

	public void setListCnsltOutBoundMngList(ArrayList<CnsltOutBoundMngVO> listCnsltOutBoundMngList) {
		this.listCnsltOutBoundMngList = listCnsltOutBoundMngList;
	}

	/**
	 * cnsltOutBoundMngList attribute 를 리턴한다.
	 * @return List<CnsltOutBoundMngVO>
	 */
	public List<CnsltOutBoundMngVO> getCnsltOutBoundMngList() {
		return cnsltOutBoundMngList;
	}

	/**
	 * ec4SalesLeadRegMngList attribute 값을 설정한다.
	 * @param cnsltOutBoundMngList List<CnsltOutBoundMngVO>
	 */
	public void setCnsltOutBoundMngList(List<CnsltOutBoundMngVO> cnsltOutBoundMngList) {
		this.cnsltOutBoundMngList = cnsltOutBoundMngList;
	}



}