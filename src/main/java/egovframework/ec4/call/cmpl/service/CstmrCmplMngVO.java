package egovframework.ec4.call.cmpl.service;

import java.util.List;
import egovframework.ec4.cmm.service.EC4DefaultVO;

/**
 * 불만접수에 대한 Vo 클래스를 정의한다.
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

public class CstmrCmplMngVO extends EC4DefaultVO{

	private static final long serialVersionUID = 1L;

	List <CstmrCmplMngVO> cstmrCmplMngList;
	
	private String searchParntsCodeId = "";
	private String searchCnsltSeCode = "";
	private String searchCodeId = "";
	private String codeLv = "";
	private String codeNm = "";
	private String codeId = "";
	private String codeId1 = "";
	private String codeId2 = "";
	private String codeId3 = "";
	private String codeId4 = "";
	private String codeNm1 = "";
	private String codeNm2 = "";
	private String codeNm3 = "";
	private String codeNm4 = "";

	private String makrCd = "";
	private String cmplMngNo = "";
	private String cstmrCd = "";
	private String cmplRecptDt = "";
	private String cmplRecptSeq = "";
	private String networkId = "";
	private String cnsltIncallNo = "";
	private String cnsltUserId = "";
	private String callBoundKnd = "";
	private String vocKnd = "";
	private String recptKnd = "";
	private String cnsltCategory = "";
	private String recptRoot = "";
	private String cstmrProtectKnd = "";
	private String bussplcCd1 = "";
	private String bussplcCd2 = "";
	private String bussplcCd3 = "";
	private String bussplcCd4 = "";
	private String cstmrDemand = "";
	private String cmplCdNm = "";
	private String cmplCdLvl = "";
	private String cmplCd1No = "";
	private String cmplCd2No = "";
	private String cmplCd3No = "";
	private String cmplCd4No = "";
	private String cmplDscr = "";
	private String oneselfAppntKnd = "";
	private String accidentYnCd = "";
	private String processSttus = "";
	private String cnsltTitle = "";
	private String recptDscr = "";
	private String recpterOpinion = "";
	private String registDe = "";
	private String register = "";
	private String updtDe = "";
	private String updusr = "";
	private String cmplSittnCd = "";
	private String procMgrUserId = "";
	private String actDscr = "";

	

	public String getActDscr() {
		return actDscr;
	}

	public void setActDscr(String actDscr) {
		this.actDscr = actDscr;
	}

	public String getProcMgrUserId() {
		return procMgrUserId;
	}

	public void setProcMgrUserId(String procMgrUserId) {
		this.procMgrUserId = procMgrUserId;
	}

	public String getCmplSittnCd() {
		return cmplSittnCd;
	}

	public void setCmplSittnCd(String cmplSittnCd) {
		this.cmplSittnCd = cmplSittnCd;
	}

	public String getMakrCd() {
		return makrCd;
	}

	public void setMakrCd(String makrCd) {
		this.makrCd = makrCd;
	}

	public String getCmplMngNo() {
		return cmplMngNo;
	}

	public void setCmplMngNo(String cmplMngNo) {
		this.cmplMngNo = cmplMngNo;
	}

	public String getCstmrCd() {
		return cstmrCd;
	}

	public void setCstmrCd(String cstmrCd) {
		this.cstmrCd = cstmrCd;
	}

	public String getCmplRecptDt() {
		return cmplRecptDt;
	}

	public void setCmplRecptDt(String cmplRecptDt) {
		this.cmplRecptDt = cmplRecptDt;
	}

	public String getCmplRecptSeq() {
		return cmplRecptSeq;
	}

	public void setCmplRecptSeq(String cmplRecptSeq) {
		this.cmplRecptSeq = cmplRecptSeq;
	}

	public String getNetworkId() {
		return networkId;
	}

	public void setNetworkId(String networkId) {
		this.networkId = networkId;
	}

	public String getCnsltIncallNo() {
		return cnsltIncallNo;
	}

	public void setCnsltIncallNo(String cnsltIncallNo) {
		this.cnsltIncallNo = cnsltIncallNo;
	}

	public String getCnsltUserId() {
		return cnsltUserId;
	}

	public void setCnsltUserId(String cnsltUserId) {
		this.cnsltUserId = cnsltUserId;
	}

	public String getCallBoundKnd() {
		return callBoundKnd;
	}

	public void setCallBoundKnd(String callBoundKnd) {
		this.callBoundKnd = callBoundKnd;
	}

	public String getVocKnd() {
		return vocKnd;
	}

	public void setVocKnd(String vocKnd) {
		this.vocKnd = vocKnd;
	}

	public String getRecptKnd() {
		return recptKnd;
	}

	public void setRecptKnd(String recptKnd) {
		this.recptKnd = recptKnd;
	}

	public String getCnsltCategory() {
		return cnsltCategory;
	}

	public void setCnsltCategory(String cnsltCategory) {
		this.cnsltCategory = cnsltCategory;
	}

	public String getRecptRoot() {
		return recptRoot;
	}

	public void setRecptRoot(String recptRoot) {
		this.recptRoot = recptRoot;
	}

	public String getCstmrProtectKnd() {
		return cstmrProtectKnd;
	}

	public void setCstmrProtectKnd(String cstmrProtectKnd) {
		this.cstmrProtectKnd = cstmrProtectKnd;
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

	public String getCstmrDemand() {
		return cstmrDemand;
	}

	public void setCstmrDemand(String cstmrDemand) {
		this.cstmrDemand = cstmrDemand;
	}

	public String getCmplCdNm() {
		return cmplCdNm;
	}

	public void setCmplCdNm(String cmplCdNm) {
		this.cmplCdNm = cmplCdNm;
	}

	public String getCmplCdLvl() {
		return cmplCdLvl;
	}

	public void setCmplCdLvl(String cmplCdLvl) {
		this.cmplCdLvl = cmplCdLvl;
	}

	public String getCmplCd1No() {
		return cmplCd1No;
	}

	public void setCmplCd1No(String cmplCd1No) {
		this.cmplCd1No = cmplCd1No;
	}

	public String getCmplCd2No() {
		return cmplCd2No;
	}

	public void setCmplCd2No(String cmplCd2No) {
		this.cmplCd2No = cmplCd2No;
	}

	public String getCmplCd3No() {
		return cmplCd3No;
	}

	public void setCmplCd3No(String cmplCd3No) {
		this.cmplCd3No = cmplCd3No;
	}

	public String getCmplCd4No() {
		return cmplCd4No;
	}

	public void setCmplCd4No(String cmplCd4No) {
		this.cmplCd4No = cmplCd4No;
	}

	public String getCmplDscr() {
		return cmplDscr;
	}

	public void setCmplDscr(String cmplDscr) {
		this.cmplDscr = cmplDscr;
	}

	public String getOneselfAppntKnd() {
		return oneselfAppntKnd;
	}

	public void setOneselfAppntKnd(String oneselfAppntKnd) {
		this.oneselfAppntKnd = oneselfAppntKnd;
	}

	public String getAccidentYnCd() {
		return accidentYnCd;
	}

	public void setAccidentYnCd(String accidentYnCd) {
		this.accidentYnCd = accidentYnCd;
	}

	public String getProcessSttus() {
		return processSttus;
	}

	public void setProcessSttus(String processSttus) {
		this.processSttus = processSttus;
	}

	public String getCnsltTitle() {
		return cnsltTitle;
	}

	public void setCnsltTitle(String cnsltTitle) {
		this.cnsltTitle = cnsltTitle;
	}

	public String getRecptDscr() {
		return recptDscr;
	}

	public void setRecptDscr(String recptDscr) {
		this.recptDscr = recptDscr;
	}

	public String getRecpterOpinion() {
		return recpterOpinion;
	}

	public void setRecpterOpinion(String recpterOpinion) {
		this.recpterOpinion = recpterOpinion;
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

	public String getSearchCodeId() {
		return searchCodeId;
	}

	public void setSearchCodeId(String searchCodeId) {
		this.searchCodeId = searchCodeId;
	}

	public String getCodeId1() {
		return codeId1;
	}

	public void setCodeId1(String codeId1) {
		this.codeId1 = codeId1;
	}

	public String getCodeId2() {
		return codeId2;
	}

	public void setCodeId2(String codeId2) {
		this.codeId2 = codeId2;
	}

	public String getCodeId3() {
		return codeId3;
	}

	public void setCodeId3(String codeId3) {
		this.codeId3 = codeId3;
	}

	public String getCodeId4() {
		return codeId4;
	}

	public void setCodeId4(String codeId4) {
		this.codeId4 = codeId4;
	}

	public String getCodeNm1() {
		return codeNm1;
	}

	public void setCodeNm1(String codeNm1) {
		this.codeNm1 = codeNm1;
	}

	public String getCodeNm2() {
		return codeNm2;
	}

	public void setCodeNm2(String codeNm2) {
		this.codeNm2 = codeNm2;
	}

	public String getCodeNm3() {
		return codeNm3;
	}

	public void setCodeNm3(String codeNm3) {
		this.codeNm3 = codeNm3;
	}

	public String getCodeNm4() {
		return codeNm4;
	}

	public void setCodeNm4(String codeNm4) {
		this.codeNm4 = codeNm4;
	}

	public String getSearchParntsCodeId() {
		return searchParntsCodeId;
	}

	public void setSearchParntsCodeId(String searchParntsCodeId) {
		this.searchParntsCodeId = searchParntsCodeId;
	}

	public String getCodeNm() {
		return codeNm;
	}

	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
	}

	public String getCodeId() {
		return codeId;
	}

	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}

	public String getCodeLv() {
		return codeLv;
	}

	public void setCodeLv(String codeLv) {
		this.codeLv = codeLv;
	}

	public String getSearchCnsltSeCode() {
		return searchCnsltSeCode;
	}

	public void setSearchCnsltSeCode(String searchCnsltSeCode) {
		this.searchCnsltSeCode = searchCnsltSeCode;
	}

	/**
	 * cstmrCmplMngList attribute 를 리턴한다.
	 * @return List<CstmrCmplMngVO>
	 */
	public List<CstmrCmplMngVO> getCstmrCmplMngList() {
		return cstmrCmplMngList;
	}

	/**
	 * ec4SalesLeadRegMngList attribute 값을 설정한다.
	 * @param cstmrCmplMngList List<CstmrCmplMngVO>
	 */
	public void setCstmrCmplMngList(List<CstmrCmplMngVO> cstmrCmplMngList) {
		this.cstmrCmplMngList = cstmrCmplMngList;
	}



}