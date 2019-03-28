package egovframework.ec4.cbot.mmy.service;

import java.util.List;

/**
 * 모바일 주기점검화면에 대한 Vo 클래스를 정의한다.
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

public class MblMyCheckMngVO {

	private static final long serialVersionUID = 1L;

	List <MblMyCheckMngVO> mblMyCheckMngList;


	/**
	 * mblMyCheckMngList attribute 를 리턴한다.
	 * @return List<MblMyCheckMngVO>
	 */
	public List<MblMyCheckMngVO> getMblMyCheckMngList() {
		return mblMyCheckMngList;
	}

	/**
	 * ec4SalesLeadRegMngList attribute 값을 설정한다.
	 * @param mblMyCheckMngList List<MblMyCheckMngVO>
	 */
	public void setMblMyCheckMngList(List<MblMyCheckMngVO> mblMyCheckMngList) {
		this.mblMyCheckMngList = mblMyCheckMngList;
	}



}