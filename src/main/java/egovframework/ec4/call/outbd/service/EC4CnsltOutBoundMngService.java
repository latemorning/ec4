package egovframework.ec4.call.outbd.service;

import java.util.ArrayList;
import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 아웃바운드콜상담현황에 관한 서비스 인터페이스 클래스를 정의한다.
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

public interface EC4CnsltOutBoundMngService {
    /**
	 * 목록을 조회한다.
	 * @param cnsltOutBoundMngVO cnsltOutBoundMngVO
	 * @return List<cnsltOutBoundMngVO>
	 * @exception Exception
	 */
	public List<CnsltOutBoundMngVO> selectCnsltOutBoundMng(CnsltOutBoundMngVO cnsltOutBoundMngVO) throws Exception;
	
	ArrayList<EgovMap> searchCnsltOutBoundList(CnsltOutBoundMngVO searchVO) throws Exception;
	
	int searchCnsltOutBoundListCnt(CnsltOutBoundMngVO searchVO) throws Exception;
	
	List<EgovMap> selectCnsltOutBoundMngLoad(CnsltOutBoundMngVO searchVO) throws Exception;
	
}
