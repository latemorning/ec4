package egovframework.ec4.cbot.msales.service;

import java.util.List;

/**
 * 모바일 브로셔보기화면에 대한 Vo 클래스를 정의한다.
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

public class MblSalesBrochMngVO {

	private static final long serialVersionUID = 1L;

	List <MblSalesBrochMngVO> mblSalesBrochMngList;


	/**
	 * mblSalesBrochMngList attribute 를 리턴한다.
	 * @return List<MblSalesBrochMngVO>
	 */
	public List<MblSalesBrochMngVO> getMblSalesBrochMngList() {
		return mblSalesBrochMngList;
	}

	/**
	 * ec4SalesLeadRegMngList attribute 값을 설정한다.
	 * @param mblSalesBrochMngList List<MblSalesBrochMngVO>
	 */
	public void setMblSalesBrochMngList(List<MblSalesBrochMngVO> mblSalesBrochMngList) {
		this.mblSalesBrochMngList = mblSalesBrochMngList;
	}



}