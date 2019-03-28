package egovframework.com.cmm.service;

import java.io.Serializable;

/**
 * 공통상세코드 모델 클래스
 * @author 공통서비스 개발팀 이중호
 * @since 2009.04.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.01  이중호          최초 생성
 *
 * </pre>
 */
public class CmmnDetailCode implements Serializable {

	private static final long serialVersionUID = 1L;

	/*
	 * 코드ID
	 */
    private String codeId = "";

    /*
     * 코드ID명
     */
    private String codeIdNm = "";

	/*
	 * 상위코드ID
	 */
    private String upCodeId = "";

    /*
     * 상위코드ID명
     */
    private String upCodeIdNm = "";

    /*
     * 코드
     */
	private String code = "";

	/*
	 * 코드명
	 */
    private String codeNm = "";

    /*
     * 코드설명
     */
    private String codeDc = "";

    /*
     * 사용여부
     */
    private String useAt = "";

    /*
     * 최초등록자ID
     */
    private String frstRegisterId = "";

    /*
     * 최종수정자ID
     */
    private String lastUpdusrId   = "";
    
    /*
     * 구분
     * */
    private String cnsltSeCode  = "";
    
    /*
     * 상위코드
     * */
    private String upCode  = "";
    
    /*
     * 코드구분
     * */
    private String codeKnd  = "";
    
    /*
     * 코드레벨
     * */
    private String lvlCode  = "";

    /*select2 콤보 관련*/
    private String id = "";
    private String text = "";
    private String selected = "";
    private String disabled = "";
    
    
    
    

	public String getCodeKnd() {
		return codeKnd;
	}

	public void setCodeKnd(String codeKnd) {
		this.codeKnd = codeKnd;
	}

	public String getLvlCode() {
		return lvlCode;
	}

	public void setLvlCode(String lvlCode) {
		this.lvlCode = lvlCode;
	}

	public String getUpCode() {
		return upCode;
	}

	public void setUpCode(String upCode) {
		this.upCode = upCode;
	}

	public String getCnsltSeCode() {
		return cnsltSeCode;
	}

	public void setCnsltSeCode(String cnsltSeCode) {
		this.cnsltSeCode = cnsltSeCode;
	}

	public String getUpCodeId() {
		return upCodeId;
	}

	public void setUpCodeId(String upCodeId) {
		this.upCodeId = upCodeId;
	}

	public String getUpCodeIdNm() {
		return upCodeIdNm;
	}

	public void setUpCodeIdNm(String upCodeIdNm) {
		this.upCodeIdNm = upCodeIdNm;
	}

	/**
	 * codeId attribute 를 리턴한다.
	 * @return String
	 */
	public String getCodeId() {
		return codeId;
	}

	/**
	 * codeId attribute 값을 설정한다.
	 * @param codeId String
	 */
	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}

	/**
	 * codeIdNm attribute 를 리턴한다.
	 * @return String
	 */
	public String getCodeIdNm() {
		return codeIdNm;
	}

	/**
	 * codeIdNm attribute 값을 설정한다.
	 * @param codeIdNm String
	 */
	public void setCodeIdNm(String codeIdNm) {
		this.codeIdNm = codeIdNm;
	}

	/**
	 * code attribute 를 리턴한다.
	 * @return String
	 */
	public String getCode() {
		return code;
	}

	/**
	 * code attribute 값을 설정한다.
	 * @param code String
	 */
	public void setCode(String code) {
		this.code = code;
	}

	/**
	 * codeNm attribute 를 리턴한다.
	 * @return String
	 */
	public String getCodeNm() {
		return codeNm;
	}

	/**
	 * codeNm attribute 값을 설정한다.
	 * @param codeNm String
	 */
	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
	}

	/**
	 * codeDc attribute 를 리턴한다.
	 * @return String
	 */
	public String getCodeDc() {
		return codeDc;
	}

	/**
	 * codeDc attribute 값을 설정한다.
	 * @param codeDc String
	 */
	public void setCodeDc(String codeDc) {
		this.codeDc = codeDc;
	}

	/**
	 * useAt attribute 를 리턴한다.
	 * @return String
	 */
	public String getUseAt() {
		return useAt;
	}

	/**
	 * useAt attribute 값을 설정한다.
	 * @param useAt String
	 */
	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}

	/**
	 * frstRegisterId attribute 를 리턴한다.
	 * @return String
	 */
	public String getFrstRegisterId() {
		return frstRegisterId;
	}

	/**
	 * frstRegisterId attribute 값을 설정한다.
	 * @param frstRegisterId String
	 */
	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}

	/**
	 * lastUpdusrId attribute 를 리턴한다.
	 * @return String
	 */
	public String getLastUpdusrId() {
		return lastUpdusrId;
	}

	/**
	 * lastUpdusrId attribute 값을 설정한다.
	 * @param lastUpdusrId String
	 */
	public void setLastUpdusrId(String lastUpdusrId) {
		this.lastUpdusrId = lastUpdusrId;
	}


    public String getId() {

        return id;
    }


    public void setId(String id) {

        this.id = id;
    }


    public String getText() {

        return text;
    }


    public void setText(String text) {

        this.text = text;
    }


    public String getSelected() {

        return selected;
    }


    public void setSelected(String selected) {

        this.selected = selected;
    }


    public String getDisabled() {

        return disabled;
    }


    public void setDisabled(String disabled) {

        this.disabled = disabled;
    }



}
