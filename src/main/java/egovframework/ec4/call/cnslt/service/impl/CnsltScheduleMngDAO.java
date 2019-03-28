package egovframework.ec4.call.cnslt.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.call.cnslt.service.CnsltScheduleMngVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 상담원스케줄에 대한 DAO 클래스를 정의한다.
 * @author 최재중
 * @since 2019.01.03
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2019.01.03  최재중          최초 생성
 *
 * </pre>
 */

@Repository("cnsltScheduleMngDAO")
public class CnsltScheduleMngDAO extends EgovComAbstractDAO {



    /**
	 * 목록을 조회한다.
	 * @param cnsltScheduleMngVO cnsltScheduleMngVO
	 * @return List<cnsltScheduleMngVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<EgovMap> selectCnsltScheduleMngList(CnsltScheduleMngVO cnsltScheduleMngVO) throws Exception {
        return (List<EgovMap>) list("cnsltScheduleMngDAO.selectCnsltScheduleRegList", cnsltScheduleMngVO);
    }


    public int selectCnsltScheduleMngListCnt(CnsltScheduleMngVO cnsltScheduleMngVO) throws Exception {
        return (int)select("cnsltScheduleMngDAO.selectCnsltScheduleRegListCnt", cnsltScheduleMngVO);
    }

    /**
	 * 상담원목록 combo 조회한다.
	 * @param cnsltScheduleMngVO cnsltScheduleMngVO
	 * @return List<cnsltScheduleMngVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<CmmnDetailCode> selectCnsltntComboList(CnsltScheduleMngVO cnsltScheduleMngVO) throws Exception {
        return (List<CmmnDetailCode>) list("cnsltScheduleMngDAO.selectCnsltntComboList", cnsltScheduleMngVO);
    }

    /**
	 * 상담원부서목록 combo 조회한다.
	 * @param cnsltScheduleMngVO cnsltScheduleMngVO
	 * @return List<cnsltScheduleMngVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<CmmnDetailCode> selectOrgnztInfoComboDfList(CmmnDetailCode searchVO) throws Exception {
        return (List<CmmnDetailCode>) list("cnsltScheduleMngDAO.selectOrgnztInfoComboDfList", searchVO);
    }

}
