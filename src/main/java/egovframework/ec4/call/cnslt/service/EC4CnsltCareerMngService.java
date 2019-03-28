package egovframework.ec4.call.cnslt.service;

import java.util.ArrayList;
import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 상담원에 관한 서비스 인터페이스 클래스를 정의한다.
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

public interface EC4CnsltCareerMngService {
    /**
	 * 목록을 조회한다.
	 * @param cnsltCareerMngVO cnsltCareerMngVO
	 * @return List<cnsltCareerMngVO>
	 * @exception Exception
	 */
	public List<CnsltCareerMngVO> selectCnsltCareerMng(CnsltCareerMngVO cnsltCareerMngVO) throws Exception;
	
	ArrayList<EgovMap> selectCnsltCareerRegList(CnsltCareerMngVO searchVO) throws Exception;
	
	int selectCnsltCareerRegListCnt(CnsltCareerMngVO searchVO) throws Exception;

    void insertCnsltCareer(CnsltCareerMngVO searchVO) throws Exception;
    
    EgovMap selectCnsltCareerMod(CnsltCareerMngVO cnsltCareerMngVO) throws Exception;

    void updateCnsltCareer(CnsltCareerMngVO searchVO) throws Exception;

    void deleteCnsltCareer(CnsltCareerMngVO searchVO) throws Exception;
	
}
