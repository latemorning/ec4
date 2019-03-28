package egovframework.ec4.call.outbd.service;

import java.util.List;

/**
 * 아웃바운드콜상담 대상고객정보 상담에 대한 Vo 클래스를 정의한다.
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

public class CnsltAppntBussPlcSetMngVO {

	private static final long serialVersionUID = 1L;

	List <CnsltAppntBussPlcSetMngVO> cnsltAppntBussPlcSetMngList;


	/**
	 * cnsltAppntBussPlcSetMngList attribute 를 리턴한다.
	 * @return List<CnsltAppntBussPlcSetMngVO>
	 */
	public List<CnsltAppntBussPlcSetMngVO> getCnsltAppntBussPlcSetMngList() {
		return cnsltAppntBussPlcSetMngList;
	}

	/**
	 * ec4SalesLeadRegMngList attribute 값을 설정한다.
	 * @param cnsltAppntBussPlcSetMngList List<CnsltAppntBussPlcSetMngVO>
	 */
	public void setCnsltAppntBussPlcSetMngList(List<CnsltAppntBussPlcSetMngVO> cnsltAppntBussPlcSetMngList) {
		this.cnsltAppntBussPlcSetMngList = cnsltAppntBussPlcSetMngList;
	}



}