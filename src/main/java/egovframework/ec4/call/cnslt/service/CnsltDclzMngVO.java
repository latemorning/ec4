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

public class CnsltDclzMngVO extends DetailCodeVO{

	private static final long serialVersionUID = 1L;

	
	private String makrCd = "";                       /* 메이커코드 */
	private String cnsltUserId = "";                    /* 상담원아이디 */
	private String attendDt = "";                       /* 근태일자 */
	private String workInDt = "";                       /* 출근일자 */
	private String workInTime = "";                     /* 출근시간 */
	private String workOutDt = "";                      /* 퇴근일자 */
	private String workOutTime = "";                    /* 퇴근시간 */
	private String workGroup = "";                      /* 작업그룹 */
	private String eduTime = "";                        /* 교육시간 */
	private String extndTime = "";                      /* 연장근무시간 */
	private String holiWorkYn = "";                     /* 휴일특근여부 */
	private String vacatnYn = "";                       /* 휴가여부 */
	private String alterVacatnYn = "";                  /* 대체휴가여부 */
	private String satOffYn = "";                       /* 토요휴무여부 */
	private String realWorkTime = "";                   /* 실근무시간 */
	private String lateYn = "";                         /* 지각여부 */
	private String earlyLeavYn = "";                    /* 조퇴여부 */
	private String outWorkTime = "";                    /* 외근시간 */
	private String workBreakTime = "";                  /* 근무이탈시간 */
	private String offWorkYn = "";                      /* 결근여부 */
	private String registDe = "";                       /* 등록일자 */
	private String register = "";                       /* 등록자 */
	private String updtDe = "";                         /* 수정일자 */
	private String updusr = "";                         /* 수정자 */

	private String cnsltNm = "";
	private String cnsltUserNm = "";
	private String workInTimeHour = "";
	private String workInTimeMinute = "";
	private String workOutTimeHour = "";
	private String workOutTimeMinute = "";

	private String searchCnsltUserId = "";                        /* 콜고객코드 */
	private String searchCnsltUserNm = "";                        /* 콜고객명 */
	private String searchUserId = "";                        /* 콜고객코드 */
	private String searchUserNm = "";                        /* 콜고객명 */
	private String searchDclzDt = "";                         /* 리드일자 */
	private String searchDclzType = "";                       /* 리드유형 */
	private String searchBrandCd = "";                        /* 브랜드코드 */
	private String searchVhcty = "";                          /* 차종 */
	private String searchModel = "";                          /* 모델 */
	private String searchHpno = "";                           /* 핸드폰번호 */
	private String searchTelno = "";                          /* 전화번호 */
	private String searchShopNm = "";                         /* 전시장 */
	private String searchDelvDt = "";                         /* 희망출고일 */
    private String searchBeginDe = "";
    private String searchEndDe = "";
    private String searchOrgnztId = ""; //상담원부서
	
	
    
    
    
    
    
    
    
	
	public String getSearchOrgnztId() {
		return searchOrgnztId;
	}

	public void setSearchOrgnztId(String searchOrgnztId) {
		this.searchOrgnztId = searchOrgnztId;
	}

	public String getWorkOutTimeHour() {
		return workOutTimeHour;
	}

	public void setWorkOutTimeHour(String workOutTimeHour) {
		this.workOutTimeHour = workOutTimeHour;
	}

	public String getWorkOutTimeMinute() {
		return workOutTimeMinute;
	}

	public void setWorkOutTimeMinute(String workOutTimeMinute) {
		this.workOutTimeMinute = workOutTimeMinute;
	}

	public String getWorkInTimeHour() {
		return workInTimeHour;
	}

	public void setWorkInTimeHour(String workInTimeHour) {
		this.workInTimeHour = workInTimeHour;
	}

	public String getWorkInTimeMinute() {
		return workInTimeMinute;
	}

	public void setWorkInTimeMinute(String workInTimeMinute) {
		this.workInTimeMinute = workInTimeMinute;
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

	public String getAttendDt() {
		return attendDt;
	}

	public void setAttendDt(String attendDt) {
		this.attendDt = attendDt;
	}

	public String getWorkInDt() {
		return workInDt;
	}

	public void setWorkInDt(String workInDt) {
		this.workInDt = workInDt;
	}

	public String getWorkInTime() {
		return workInTime;
	}

	public void setWorkInTime(String workInTime) {
		this.workInTime = workInTime;
	}

	public String getWorkOutDt() {
		return workOutDt;
	}

	public void setWorkOutDt(String workOutDt) {
		this.workOutDt = workOutDt;
	}

	public String getWorkOutTime() {
		return workOutTime;
	}

	public void setWorkOutTime(String workOutTime) {
		this.workOutTime = workOutTime;
	}

	public String getWorkGroup() {
		return workGroup;
	}

	public void setWorkGroup(String workGroup) {
		this.workGroup = workGroup;
	}

	public String getEduTime() {
		return eduTime;
	}

	public void setEduTime(String eduTime) {
		this.eduTime = eduTime;
	}

	public String getExtndTime() {
		return extndTime;
	}

	public void setExtndTime(String extndTime) {
		this.extndTime = extndTime;
	}

	public String getHoliWorkYn() {
		return holiWorkYn;
	}

	public void setHoliWorkYn(String holiWorkYn) {
		this.holiWorkYn = holiWorkYn;
	}

	public String getVacatnYn() {
		return vacatnYn;
	}

	public void setVacatnYn(String vacatnYn) {
		this.vacatnYn = vacatnYn;
	}

	public String getAlterVacatnYn() {
		return alterVacatnYn;
	}

	public void setAlterVacatnYn(String alterVacatnYn) {
		this.alterVacatnYn = alterVacatnYn;
	}

	public String getSatOffYn() {
		return satOffYn;
	}

	public void setSatOffYn(String satOffYn) {
		this.satOffYn = satOffYn;
	}

	public String getRealWorkTime() {
		return realWorkTime;
	}

	public void setRealWorkTime(String realWorkTime) {
		this.realWorkTime = realWorkTime;
	}

	public String getLateYn() {
		return lateYn;
	}

	public void setLateYn(String lateYn) {
		this.lateYn = lateYn;
	}

	public String getEarlyLeavYn() {
		return earlyLeavYn;
	}

	public void setEarlyLeavYn(String earlyLeavYn) {
		this.earlyLeavYn = earlyLeavYn;
	}

	public String getOutWorkTime() {
		return outWorkTime;
	}

	public void setOutWorkTime(String outWorkTime) {
		this.outWorkTime = outWorkTime;
	}

	public String getWorkBreakTime() {
		return workBreakTime;
	}

	public void setWorkBreakTime(String workBreakTime) {
		this.workBreakTime = workBreakTime;
	}

	public String getOffWorkYn() {
		return offWorkYn;
	}

	public void setOffWorkYn(String offWorkYn) {
		this.offWorkYn = offWorkYn;
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

	public String getSearchDclzDt() {
		return searchDclzDt;
	}

	public void setSearchDclzDt(String searchDclzDt) {
		this.searchDclzDt = searchDclzDt;
	}

	public String getSearchDclzType() {
		return searchDclzType;
	}

	public void setSearchDclzType(String searchDclzType) {
		this.searchDclzType = searchDclzType;
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

	List <CnsltDclzMngVO> cnsltDclzMngList;
	

	/**
	 * cnsltDclzMngList attribute 를 리턴한다.
	 * @return List<CnsltDclzMngVO>
	 */
	public List<CnsltDclzMngVO> getCnsltDclzMngList() {
		return cnsltDclzMngList;
	}

	/**
	 * ec4CnsltDclzRegMngList attribute 값을 설정한다.
	 * @param cnsltDclzMngList List<CnsltDclzMngVO>
	 */
	public void setCnsltDclzMngList(List<CnsltDclzMngVO> cnsltDclzMngList) {
		this.cnsltDclzMngList = cnsltDclzMngList;
	}





    /**
     * EgovMap에서 VO셋팅
     *
     * @param egovMap
     */
    public void setValuesFromEgovMap(EgovMap egovMap) {

		this.makrCd = (String)egovMap.get("makrCd");                       /* 메이커코드 */
		this.cnsltUserId = (String)egovMap.get("cnsltUserId");		 /* 상담원아이디 */
		this.attendDt = (String)egovMap.get("attendDt");                       /* 근태일자 */
		this.workInDt = (String)egovMap.get("workInDt");                       /* 출근일자 */
		this.workInTime = (String)egovMap.get("workInTime");                     /* 출근시간 */
		this.workOutDt = (String)egovMap.get("workOutDt");                      /* 퇴근일자 */
		this.workOutTime = (String)egovMap.get("workOutTime");                    /* 퇴근시간 */
		this.workGroup = "null".equals((String)egovMap.get("workGroup"))?"":(String)egovMap.get("workGroup");                      /* 작업그룹 */
		this.eduTime = "null".equals(String.valueOf(egovMap.get("eduTime")))?"":String.valueOf(egovMap.get("eduTime"));                      /* 교육시간 */
		this.extndTime = "null".equals(String.valueOf(egovMap.get("extndTime")))?"":String.valueOf(egovMap.get("extndTime"));                      /* 연장근무시간 */
		this.holiWorkYn = (String)egovMap.get("holiWorkYn");                     /* 휴일특근여부 */
		this.vacatnYn = (String)egovMap.get("vacatnYn");                       /* 휴가여부 */
		this.alterVacatnYn = (String)egovMap.get("alterVacatnYn");                  /* 대체휴가여부 */
		this.satOffYn = (String)egovMap.get("satOffYn");                       /* 토요휴무여부 */
		//System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>["+String.valueOf(egovMap.get("realWorkTime"))+"]");
		//this.realWorkTime = StringUtils.isEmpty(String.valueOf(egovMap.get("realWorkTime")))?"a":String.valueOf(egovMap.get("realWorkTime"));                      /* 실근무시간 */
		this.realWorkTime = "null".equals(String.valueOf(egovMap.get("realWorkTime")))?"":String.valueOf(egovMap.get("realWorkTime"));                      /* 실근무시간 */
		this.lateYn = (String)egovMap.get("lateYn");                         /* 지각여부 */
		this.earlyLeavYn = (String)egovMap.get("earlyLeavYn");                    /* 조퇴여부 */
		this.outWorkTime = "null".equals(String.valueOf(egovMap.get("outWorkTime")))?"":String.valueOf(egovMap.get("outWorkTime"));                      /* 외근시간 */
		this.workBreakTime = "null".equals(String.valueOf(egovMap.get("workBreakTime")))?"":String.valueOf(egovMap.get("workBreakTime"));                      /* 근무이탈시간 */
		this.offWorkYn = (String)egovMap.get("offWorkYn");                      /* 결근여부 */
		this.registDe = String.valueOf(egovMap.get("registDe"));
		this.register = (String)egovMap.get("register");
		this.updtDe = String.valueOf(egovMap.get("updtDe"));
		this.updusr = (String)egovMap.get("updusr");

        this.cnsltUserNm = (String)egovMap.get("cnsltUserNm");
    	this.workInTimeHour = (String)egovMap.get("workInTimeHour");
    	this.workInTimeMinute = (String)egovMap.get("workInTimeMinute");
    	this.workOutTimeHour = (String)egovMap.get("workOutTimeHour");
    	this.workOutTimeMinute = (String)egovMap.get("workOutTimeMinute");
    }



}