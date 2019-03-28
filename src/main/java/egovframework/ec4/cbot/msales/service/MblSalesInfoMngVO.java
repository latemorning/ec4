package egovframework.ec4.cbot.msales.service;

import java.util.List;

/**
 * 모바일 신차정보보기화면에 대한 Vo 클래스를 정의한다.
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

public class MblSalesInfoMngVO {

	private static final long serialVersionUID = 1L;

	List <MblSalesInfoMngVO> mblSalesInfoMngList;


	/**
	 * mblSalesInfoMngList attribute 를 리턴한다.
	 * @return List<MblSalesInfoMngVO>
	 */
	public List<MblSalesInfoMngVO> getMblSalesInfoMngList() {
		return mblSalesInfoMngList;
	}

	/**
	 * ec4SalesLeadRegMngList attribute 값을 설정한다.
	 * @param mblSalesInfoMngList List<MblSalesInfoMngVO>
	 */
	public void setMblSalesInfoMngList(List<MblSalesInfoMngVO> mblSalesInfoMngList) {
		this.mblSalesInfoMngList = mblSalesInfoMngList;
	}



}