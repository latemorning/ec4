package egovframework.ec4.cbot.msales.service;

import java.util.List;

/**
 * 모바일 판매조건확인화면에 대한 Vo 클래스를 정의한다.
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

public class MblSaleCondMngVO {

	private static final long serialVersionUID = 1L;

	List <MblSaleCondMngVO> mblSaleCondMngList;


	/**
	 * mblSaleCondMngList attribute 를 리턴한다.
	 * @return List<MblSaleCondMngVO>
	 */
	public List<MblSaleCondMngVO> getMblSaleCondMngList() {
		return mblSaleCondMngList;
	}

	/**
	 * ec4SalesLeadRegMngList attribute 값을 설정한다.
	 * @param mblSaleCondMngList List<MblSaleCondMngVO>
	 */
	public void setMblSaleCondMngList(List<MblSaleCondMngVO> mblSaleCondMngList) {
		this.mblSaleCondMngList = mblSaleCondMngList;
	}



}