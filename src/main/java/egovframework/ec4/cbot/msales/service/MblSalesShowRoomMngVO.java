package egovframework.ec4.cbot.msales.service;

import java.util.List;

/**
 * 모바일 가까운전시장확인화면에 대한 Vo 클래스를 정의한다.
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

public class MblSalesShowRoomMngVO {

	private static final long serialVersionUID = 1L;

	List <MblSalesShowRoomMngVO> mblSalesShowRoomMngList;


	/**
	 * mblSalesShowRoomMngList attribute 를 리턴한다.
	 * @return List<MblSalesShowRoomMngVO>
	 */
	public List<MblSalesShowRoomMngVO> getMblSalesShowRoomMngList() {
		return mblSalesShowRoomMngList;
	}

	/**
	 * ec4SalesLeadRegMngList attribute 값을 설정한다.
	 * @param mblSalesShowRoomMngList List<MblSalesShowRoomMngVO>
	 */
	public void setMblSalesShowRoomMngList(List<MblSalesShowRoomMngVO> mblSalesShowRoomMngList) {
		this.mblSalesShowRoomMngList = mblSalesShowRoomMngList;
	}



}