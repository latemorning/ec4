package egovframework.ec4.cbot.mreg.service;

import java.util.List;

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

public class MblMembInfoMngVO {

	private static final long serialVersionUID = 1L;

	List <MblMembInfoMngVO> mblMembInfoMngList;


	/**
	 * mblMembInfoMngList attribute 를 리턴한다.
	 * @return List<MblMembInfoMngVO>
	 */
	public List<MblMembInfoMngVO> getMblMembInfoMngList() {
		return mblMembInfoMngList;
	}

	/**
	 * ec4SalesLeadRegMngList attribute 값을 설정한다.
	 * @param mblMembInfoMngList List<MblMembInfoMngVO>
	 */
	public void setMblMembInfoMngList(List<MblMembInfoMngVO> mblMembInfoMngList) {
		this.mblMembInfoMngList = mblMembInfoMngList;
	}



}