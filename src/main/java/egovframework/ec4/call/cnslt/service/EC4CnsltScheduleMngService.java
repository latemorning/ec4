package egovframework.ec4.call.cnslt.service;

import java.util.List;

import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 상담원스케줄에 관한 서비스 인터페이스 클래스를 정의한다.
 * @author 최재중
 * @since 2019.01.03
 * @version 1.0
 * @see
 *
 * <pre>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2019.01.03  최재중          최초 생성
 *
 * </pre>
 */

public interface EC4CnsltScheduleMngService {
    /**
	 * 목록을 조회한다.
	 * @param cnsltScheduleMngVO cnsltScheduleMngVO
	 * @return List<cnsltScheduleMngVO>
	 * @exception Exception
	 */
	public List<EgovMap> selectCnsltScheduleMngList(CnsltScheduleMngVO cnsltScheduleMngVO) throws Exception;

    int selectCnsltScheduleMngListCnt(CnsltScheduleMngVO cnsltScheduleMngVO) throws Exception;
    
    public List<CmmnDetailCode> selectCnsltntComboList(CnsltScheduleMngVO cnsltScheduleMngVO) throws Exception;
    
    public List<CmmnDetailCode> selectOrgnztInfoComboDfList(CmmnDetailCode searchVO) throws Exception;
}
