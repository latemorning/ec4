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

public interface EC4CnsltDistribMngService {
    /**
	 * 목록을 조회한다.
	 * @param cnsltDistribMngVO cnsltDistribMngVO
	 * @return List<cnsltDistribMngVO>
	 * @exception Exception
	 */
	public List<CnsltDistribMngVO> selectCnsltDistribMng(CnsltDistribMngVO cnsltDistribMngVO) throws Exception;
	
	void insertCnsltDistrib(CnsltDistribMngVO cnsltDistribMngVO) throws Exception;
	
	ArrayList<EgovMap> searchCnsltDistribList(CnsltDistribMngVO searchVO) throws Exception;
	
	int searchCnsltDistribListCnt(CnsltDistribMngVO searchVO) throws Exception;
	
	void updateCnsltAsign(CnsltDistribMngVO cnsltDistribMngVO) throws Exception;
	
}
