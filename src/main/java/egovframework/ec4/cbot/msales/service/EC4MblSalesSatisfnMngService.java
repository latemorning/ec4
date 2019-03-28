package egovframework.ec4.cbot.msales.service;

import java.util.List;

/**
 * 모바일 SALES만족도화면에 관한 서비스 인터페이스 클래스를 정의한다.
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

public interface EC4MblSalesSatisfnMngService {
    /**
	 * 목록을 조회한다.
	 * @param MblSalesSatisfnMngVO mblSalesSatisfnMngVO
	 * @return List<mblSalesSatisfnMngVO>
	 * @exception Exception
	 */
	public List<MblSalesSatisfnMngVO> selectMblSalesSatisfnMng(MblSalesSatisfnMngVO mblSalesSatisfnMngVO) throws Exception;
	
}
