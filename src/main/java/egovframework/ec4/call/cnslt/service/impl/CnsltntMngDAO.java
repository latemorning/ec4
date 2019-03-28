package egovframework.ec4.call.cnslt.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.call.cnslt.service.CnsltntMngVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 상담원에 대한 DAO 클래스를 정의한다.
 * @author 최재중
 * @since 2018.04.26
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2018.04.26  최재중          최초 생성
 *
 * </pre>
 */

@Repository("cnsltntMngDAO")
public class CnsltntMngDAO extends EgovComAbstractDAO {



    /**
	 * 목록을 조회한다.
	 * @param cnsltntMngVO cnsltntMngVO
	 * @return List<cnsltntMngVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<EgovMap> selectCnsltntMngList(CnsltntMngVO cnsltntMngVO) throws Exception {
        return (List<EgovMap>) list("EC4CnsltntMngSQL.selectCnsltntMngList", cnsltntMngVO);
    }


    public int selectCnsltntMngListCnt(CnsltntMngVO cnsltntMngVO) throws Exception {
        return (int)select("EC4CnsltntMngSQL.selectCnsltntMngListCnt", cnsltntMngVO);
    }

    /**
	 * 상담원목록 combo 조회한다.
	 * @param cnsltntMngVO cnsltntMngVO
	 * @return List<cnsltntMngVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<CmmnDetailCode> selectCnsltntComboList(CnsltntMngVO cnsltntMngVO) throws Exception {
        return (List<CmmnDetailCode>) list("EC4CnsltntMngSQL.selectCnsltntComboList", cnsltntMngVO);
    }

    /**
	 * 상담원부서목록 combo 조회한다.
	 * @param cnsltntMngVO cnsltntMngVO
	 * @return List<cnsltntMngVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<CmmnDetailCode> selectOrgnztInfoComboDfList(CmmnDetailCode searchVO) throws Exception {
        return (List<CmmnDetailCode>) list("EC4CnsltntMngSQL.selectOrgnztInfoComboDfList", searchVO);
    }

}
