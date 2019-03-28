package egovframework.ec4.cbot.mmy.service;

import java.util.List;

/**
 * 모바일 내차판매이력화면에 관한 서비스 인터페이스 클래스를 정의한다.
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

public interface EC4MblMySalesHistMngService {
    /**
	 * 목록을 조회한다.
	 * @param MblMySalesHistMngVO mblMySalesHistMngVO
	 * @return List<mblMySalesHistMngVO>
	 * @exception Exception
	 */
	public List<MblMySalesHistMngVO> selectMblMySalesHistMng(MblMySalesHistMngVO mblMySalesHistMngVO) throws Exception;
	
}