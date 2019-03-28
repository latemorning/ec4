package egovframework.ec4.cbot.msales.service;

import java.util.List;

/**
 * 모바일 SALES만족도화면에 대한 Vo 클래스를 정의한다.
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

public class MblSalesSatisfnMngVO {

	private static final long serialVersionUID = 1L;

	List <MblSalesSatisfnMngVO> mblSalesSatisfnMngList;


	/**
	 * mblSalesSatisfnMngList attribute 를 리턴한다.
	 * @return List<MblSalesSatisfnMngVO>
	 */
	public List<MblSalesSatisfnMngVO> getMblSalesSatisfnMngList() {
		return mblSalesSatisfnMngList;
	}

	/**
	 * ec4SalesLeadRegMngList attribute 값을 설정한다.
	 * @param mblSalesSatisfnMngList List<MblSalesSatisfnMngVO>
	 */
	public void setMblSalesSatisfnMngList(List<MblSalesSatisfnMngVO> mblSalesSatisfnMngList) {
		this.mblSalesSatisfnMngList = mblSalesSatisfnMngList;
	}



}