package egovframework.ec4.call.outbd.service;

import java.util.List;

/**
 * CTI설정에 대한 Vo 클래스를 정의한다.
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

public class CtiCallSetMngVO {

	private static final long serialVersionUID = 1L;

	List <CtiCallSetMngVO> ctiCallSetMngList;


	/**
	 * ctiCallSetMngList attribute 를 리턴한다.
	 * @return List<CtiCallSetMngVO>
	 */
	public List<CtiCallSetMngVO> getCtiCallSetMngList() {
		return ctiCallSetMngList;
	}

	/**
	 * ec4SalesLeadRegMngList attribute 값을 설정한다.
	 * @param ctiCallSetMngList List<CtiCallSetMngVO>
	 */
	public void setCtiCallSetMngList(List<CtiCallSetMngVO> ctiCallSetMngList) {
		this.ctiCallSetMngList = ctiCallSetMngList;
	}



}