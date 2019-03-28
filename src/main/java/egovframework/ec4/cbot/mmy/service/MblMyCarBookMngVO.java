package egovframework.ec4.cbot.mmy.service;

import java.util.List;

/**
 * 모바일 차계부화면에 대한 Vo 클래스를 정의한다.
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

public class MblMyCarBookMngVO {

	private static final long serialVersionUID = 1L;

	List <MblMyCarBookMngVO> mblMyCarBookMngList;


	/**
	 * mblMyCarBookMngList attribute 를 리턴한다.
	 * @return List<MblMyCarBookMngVO>
	 */
	public List<MblMyCarBookMngVO> getMblMyCarBookMngList() {
		return mblMyCarBookMngList;
	}

	/**
	 * ec4SalesLeadRegMngList attribute 값을 설정한다.
	 * @param mblMyCarBookMngList List<MblMyCarBookMngVO>
	 */
	public void setMblMyCarBookMngList(List<MblMyCarBookMngVO> mblMyCarBookMngList) {
		this.mblMyCarBookMngList = mblMyCarBookMngList;
	}



}