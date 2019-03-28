package egovframework.ec4.call.cnslt.service;

import java.util.List;

import egovframework.com.cmm.service.CmmnDetailCode;
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

public interface EC4CnsltntMngService {
    /**
	 * 목록을 조회한다.
	 * @param cnsltntMngVO cnsltntMngVO
	 * @return List<cnsltntMngVO>
	 * @exception Exception
	 */
	public List<EgovMap> selectCnsltntMngList(CnsltntMngVO cnsltntMngVO) throws Exception;

    int selectCnsltntMngListCnt(CnsltntMngVO cnsltntMngVO) throws Exception;
    
    public List<CmmnDetailCode> selectCnsltntComboList(CnsltntMngVO cnsltntMngVO) throws Exception;
    
    public List<CmmnDetailCode> selectOrgnztInfoComboDfList(CmmnDetailCode searchVO) throws Exception;
}
