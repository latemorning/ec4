package egovframework.ec4.call.outbd.service;

import java.util.ArrayList;
import java.util.List;

import egovframework.ec4.cmm.cbase.cmt.service.DetailCodeVO;

/**
 * 아웃바운드콜상담 대상고객정보 상담에 대한 Vo 클래스를 정의한다.
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

public class CnsltDistribMngVO extends DetailCodeVO{

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

	List <CnsltDistribMngVO> cnsltDistribMngList;
	
	private ArrayList<CnsltDistribMngVO> listCnsltDistribTable = null;

	
	
	
	
	

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

	public String getInstAsignKnd() {
		return instAsignKnd;
	}

	public void setInstAsignKnd(String instAsignKnd) {
		this.instAsignKnd = instAsignKnd;
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

	public ArrayList<CnsltDistribMngVO> getListCnsltDistribTable() {
		return listCnsltDistribTable;
	}

	public void setListCnsltDistribTable(ArrayList<CnsltDistribMngVO> listCnsltDistribTable) {
		this.listCnsltDistribTable = listCnsltDistribTable;
	}

	/**
	 * cnsltDistribMngList attribute 를 리턴한다.
	 * @return List<CnsltDistribMngVO>
	 */
	public List<CnsltDistribMngVO> getCnsltDistribMngList() {
		return cnsltDistribMngList;
	}

	/**
	 * ec4SalesLeadRegMngList attribute 값을 설정한다.
	 * @param cnsltDistribMngList List<CnsltDistribMngVO>
	 */
	public void setCnsltDistribMngList(List<CnsltDistribMngVO> cnsltDistribMngList) {
		this.cnsltDistribMngList = cnsltDistribMngList;
	}



}