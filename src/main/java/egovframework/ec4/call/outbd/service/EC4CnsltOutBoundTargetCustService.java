package egovframework.ec4.call.outbd.service;

import java.util.ArrayList;
import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 아웃바운드콜상담 대상고객정보 상담에 관한 서비스 인터페이스 클래스를 정의한다.
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

public interface EC4CnsltOutBoundTargetCustService {
    /**
	 * 목록을 조회한다.
	 * @param cnsltOutBoundTargetCustVO cnsltOutBoundTargetCustVO
	 * @return List<cnsltOutBoundTargetCustVO>
	 * @exception Exception
	 */
	public List<CnsltOutBoundTargetCustVO> selectCnsltOutBoundTargetCust(CnsltOutBoundTargetCustVO cnsltOutBoundTargetCustVO) throws Exception;
	
	ArrayList<EgovMap> selectCnsltTargetCustDBLoad(CnsltOutBoundTargetCustVO searchVO) throws Exception;
	
	void insertCnsltTargetCust(CnsltOutBoundTargetCustVO cnsltOutBoundTargetCustVO) throws Exception;
	
	ArrayList<EgovMap> searchCnsltOutBoundTargetCustList(CnsltOutBoundTargetCustVO searchVO) throws Exception;
	
	int searchCnsltOutBoundTargetCustListCnt(CnsltOutBoundTargetCustVO searchVO) throws Exception;
}
