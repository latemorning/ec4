package egovframework.ec4.call.outbd.service;

import java.util.List;

import egovframework.ec4.cmm.cbase.cmt.service.DetailCodeVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 콜스크립트설정에 대한 Vo 클래스를 정의한다.
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

public class CallScriptMngVO extends DetailCodeVO {

	private static final long serialVersionUID = 1L;
	

	private String makrCd = "";                       /* 메이커코드 */
	private String scriptKnd = "";                      /* 스크립트구분 */
	private String scriptCd = "";                       /* 스크립트코드 */
	private String scriptTitle = "";                    /* 스크립트제목 */
	private String scriptBeginDt = "";                  /* 스크립트시작일자 */
	private String scriptEndDt = "";                    /* 스크립트종료일자 */
	private String useYn = "";                          /* 사용여부 */
	private String registDe = "";                       /* 등록일자 */
	private String register = "";                       /* 등록자 */
	private String updtDe = "";                         /* 수정일자 */
	private String updusr = "";                         /* 수정자 */

	private String questCd = "";                        /* 질문코드 */
	private String questSortSeq = "";                   /* 질문정렬순번 */
	private String questDscr = "";                      /* 질문내용 */
	private String questType = "";                      /* 질문유형 */

	
	private String ansrCd = "";                         /* 답변코드 */
	private String ansrSortSeq = "";                    /* 답변정렬순번 */
	private String ansrDscr = "";                       /* 답변내용 */
	private String scoreNm = "";                        /* 점수명 */
	private String scoreVal = "";                       /* 점수값 */
	
	private String scriptKndNm = "";
	private String questTypeNm = "";

	private String scriptKndNmView = "";
	private String questTypeNmView = "";
	private String scriptTitleView = "";                    /* 스크립트제목 */
	private String scriptBeginDtView = "";                  /* 스크립트시작일자 */
	private String scriptEndDtView = "";                    /* 스크립트종료일자 */
	private String useYnView = "";                          /* 사용여부 */
	private String questDscrView = "";                      /* 질문내용 */
	private String questTypeView = "";                      /* 질문유형 */
	
	
	private String searchScriptKnd = "";                      /* 스크립트구분 */
	private String searchScriptCd = "";                       /* 스크립트코드 */
	private String searchScriptTitle = "";                    /* 스크립트제목 */
	private String searchQuestCd = "";                        /* 질문코드 */
	private String searchQuestSortSeq = "";                   /* 질문정렬순번 */
	private String searchQuestType = "";                      /* 질문유형 */
	private String searchAnsrCd = "";                         /* 답변코드 */
	private String searchAnsrSortSeq = "";                    /* 답변정렬순번 */
	private String searchParntsCodeId = "";
	
	private String searchCnsltUserId = "";                        /* 상담원코드 */
	private String searchCnsltUserNm = "";                        /* 상담원명 */
    private String searchBeginDe = "";
    private String searchEndDe = "";

	
	
	
	

	public String getScriptKndNmView() {
		return scriptKndNmView;
	}

	public void setScriptKndNmView(String scriptKndNmView) {
		this.scriptKndNmView = scriptKndNmView;
	}

	public String getQuestTypeNmView() {
		return questTypeNmView;
	}

	public void setQuestTypeNmView(String questTypeNmView) {
		this.questTypeNmView = questTypeNmView;
	}

	public String getScriptTitleView() {
		return scriptTitleView;
	}

	public void setScriptTitleView(String scriptTitleView) {
		this.scriptTitleView = scriptTitleView;
	}

	public String getScriptBeginDtView() {
		return scriptBeginDtView;
	}

	public void setScriptBeginDtView(String scriptBeginDtView) {
		this.scriptBeginDtView = scriptBeginDtView;
	}

	public String getScriptEndDtView() {
		return scriptEndDtView;
	}

	public void setScriptEndDtView(String scriptEndDtView) {
		this.scriptEndDtView = scriptEndDtView;
	}

	public String getUseYnView() {
		return useYnView;
	}

	public void setUseYnView(String useYnView) {
		this.useYnView = useYnView;
	}

	public String getQuestDscrView() {
		return questDscrView;
	}

	public void setQuestDscrView(String questDscrView) {
		this.questDscrView = questDscrView;
	}

	public String getQuestTypeView() {
		return questTypeView;
	}

	public void setQuestTypeView(String questTypeView) {
		this.questTypeView = questTypeView;
	}

	public String getScriptKndNm() {
		return scriptKndNm;
	}

	public void setScriptKndNm(String scriptKndNm) {
		this.scriptKndNm = scriptKndNm;
	}

	public String getQuestTypeNm() {
		return questTypeNm;
	}

	public void setQuestTypeNm(String questTypeNm) {
		this.questTypeNm = questTypeNm;
	}

	public String getSearchParntsCodeId() {
		return searchParntsCodeId;
	}

	public void setSearchParntsCodeId(String searchParntsCodeId) {
		this.searchParntsCodeId = searchParntsCodeId;
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

	public String getSearchScriptTitle() {
		return searchScriptTitle;
	}

	public void setSearchScriptTitle(String searchScriptTitle) {
		this.searchScriptTitle = searchScriptTitle;
	}

	public String getSearchQuestCd() {
		return searchQuestCd;
	}

	public void setSearchQuestCd(String searchQuestCd) {
		this.searchQuestCd = searchQuestCd;
	}

	public String getSearchQuestSortSeq() {
		return searchQuestSortSeq;
	}

	public void setSearchQuestSortSeq(String searchQuestSortSeq) {
		this.searchQuestSortSeq = searchQuestSortSeq;
	}

	public String getSearchQuestType() {
		return searchQuestType;
	}

	public void setSearchQuestType(String searchQuestType) {
		this.searchQuestType = searchQuestType;
	}

	public String getSearchAnsrCd() {
		return searchAnsrCd;
	}

	public void setSearchAnsrCd(String searchAnsrCd) {
		this.searchAnsrCd = searchAnsrCd;
	}

	public String getSearchAnsrSortSeq() {
		return searchAnsrSortSeq;
	}

	public void setSearchAnsrSortSeq(String searchAnsrSortSeq) {
		this.searchAnsrSortSeq = searchAnsrSortSeq;
	}

	public String getAnsrCd() {
		return ansrCd;
	}

	public void setAnsrCd(String ansrCd) {
		this.ansrCd = ansrCd;
	}

	public String getAnsrSortSeq() {
		return ansrSortSeq;
	}

	public void setAnsrSortSeq(String ansrSortSeq) {
		this.ansrSortSeq = ansrSortSeq;
	}

	public String getAnsrDscr() {
		return ansrDscr;
	}

	public void setAnsrDscr(String ansrDscr) {
		this.ansrDscr = ansrDscr;
	}

	public String getScoreNm() {
		return scoreNm;
	}

	public void setScoreNm(String scoreNm) {
		this.scoreNm = scoreNm;
	}

	public String getScoreVal() {
		return scoreVal;
	}

	public void setScoreVal(String scoreVal) {
		this.scoreVal = scoreVal;
	}

	public String getQuestCd() {
		return questCd;
	}

	public void setQuestCd(String questCd) {
		this.questCd = questCd;
	}

	public String getQuestSortSeq() {
		return questSortSeq;
	}

	public void setQuestSortSeq(String questSortSeq) {
		this.questSortSeq = questSortSeq;
	}

	public String getQuestDscr() {
		return questDscr;
	}

	public void setQuestDscr(String questDscr) {
		this.questDscr = questDscr;
	}

	public String getQuestType() {
		return questType;
	}

	public void setQuestType(String questType) {
		this.questType = questType;
	}

	public String getMakrCd() {
		return makrCd;
	}

	public void setMakrCd(String makrCd) {
		this.makrCd = makrCd;
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

	public String getScriptTitle() {
		return scriptTitle;
	}

	public void setScriptTitle(String scriptTitle) {
		this.scriptTitle = scriptTitle;
	}

	public String getScriptBeginDt() {
		return scriptBeginDt;
	}

	public void setScriptBeginDt(String scriptBeginDt) {
		this.scriptBeginDt = scriptBeginDt;
	}

	public String getScriptEndDt() {
		return scriptEndDt;
	}

	public void setScriptEndDt(String scriptEndDt) {
		this.scriptEndDt = scriptEndDt;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
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

	List <CallScriptMngVO> callScriptMngList;


	/**
	 * callScriptMngList attribute 를 리턴한다.
	 * @return List<CallScriptMngVO>
	 */
	public List<CallScriptMngVO> getCallScriptMngList() {
		return callScriptMngList;
	}

	/**
	 * ec4SalesLeadRegMngList attribute 값을 설정한다.
	 * @param callScriptMngList List<CallScriptMngVO>
	 */
	public void setCallScriptMngList(List<CallScriptMngVO> callScriptMngList) {
		this.callScriptMngList = callScriptMngList;
	}





    /**
     * EgovMap에서 VO셋팅
     *
     * @param egovMap
     */
    public void setValuesFromEgovMap(EgovMap egovMap) {

		this.makrCd = (String)egovMap.get("makrCd");                       /* 메이커코드 */
		this.scriptKnd = (String)egovMap.get("scriptKnd");		       /* 상담원아이디 */
		this.scriptCd = (String)egovMap.get("scriptCd");		       /* 상담원아이디 */
		this.questCd = (String)egovMap.get("questCd");		       /* 상담원아이디 */
		this.ansrCd = (String)egovMap.get("ansrCd");		       /* 상담원아이디 */

		this.scriptTitle = (String)egovMap.get("scriptTitle");                    /* 스크립트제목 */
		this.scriptBeginDt = (String)egovMap.get("scriptBeginDt");                  /* 스크립트시작일자 */
		this.scriptEndDt = (String)egovMap.get("scriptEndDt");                    /* 스크립트종료일자 */
		this.useYn = (String)egovMap.get("useYn");                          /* 사용여부 */

		this.questSortSeq = "null".equals(String.valueOf(egovMap.get("questSortSeq")))?"":String.valueOf(egovMap.get("questSortSeq"));                   /* 질문정렬순번 */
		this.questDscr = (String)egovMap.get("questDscr");                      /* 질문내용 */
		this.questType = (String)egovMap.get("questType");                      /* 질문유형 */

		this.ansrSortSeq = "null".equals(String.valueOf(egovMap.get("ansrSortSeq")))?"":String.valueOf(egovMap.get("ansrSortSeq"));                    /* 답변정렬순번 */
		this.ansrDscr = (String)egovMap.get("ansrDscr");                       /* 답변내용 */
		this.scoreNm = (String)egovMap.get("scoreNm");                        /* 점수명 */
		this.scoreVal = "null".equals(String.valueOf(egovMap.get("scoreVal")))?"":String.valueOf(egovMap.get("scoreVal"));                       /* 점수값 */
		
		this.scriptKndNm = (String)egovMap.get("scriptKndNm");
		this.questTypeNm = (String)egovMap.get("questTypeNm");
		
		this.registDe = String.valueOf(egovMap.get("registDe"));
		this.register = (String)egovMap.get("register");
		this.updtDe = String.valueOf(egovMap.get("updtDe"));
		this.updusr = (String)egovMap.get("updusr");

    }



}