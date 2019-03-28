package egovframework.ec4.call.cnslt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.call.cnslt.service.EC4CnsltScheduleMngService;
import egovframework.ec4.cmm.service.PopupTestDefaultVO;
import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.ec4.call.cnslt.service.CnsltScheduleMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 상담원스케줄에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("cnsltScheduleMngService")
public class EC4CnsltScheduleMngServiceImpl extends EgovAbstractServiceImpl implements EC4CnsltScheduleMngService {

	@Resource(name="cnsltScheduleMngDAO")
    private CnsltScheduleMngDAO cnsltScheduleMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param cnsltScheduleMngVO cnsltScheduleMngVO
	 * @return List<cnsltScheduleMngVO>
	 * @exception Exception
	 */
    @Override
    public List<EgovMap> selectCnsltScheduleMngList(CnsltScheduleMngVO cnsltScheduleMngVO) throws Exception {
        return cnsltScheduleMngDAO.selectCnsltScheduleMngList(cnsltScheduleMngVO);
    }


    @Override
    public int selectCnsltScheduleMngListCnt(CnsltScheduleMngVO cnsltScheduleMngVO) throws Exception {
        return cnsltScheduleMngDAO.selectCnsltScheduleMngListCnt(cnsltScheduleMngVO);
    }
    

    /**
	 * 상담원목록 combo 조회한다.
	 * @param cnsltScheduleMngVO cnsltScheduleMngVO
	 * @return List<cnsltScheduleMngVO>
	 * @exception Exception
	 */
    @Override
    public List<CmmnDetailCode> selectCnsltntComboList(CnsltScheduleMngVO cnsltScheduleMngVO) throws Exception {
        return cnsltScheduleMngDAO.selectCnsltntComboList(cnsltScheduleMngVO);
    }
    

    /**
	 * 상담원부서목록 combo 조회한다.
	 * @param cnsltScheduleMngVO cnsltScheduleMngVO
	 * @return List<cnsltScheduleMngVO>
	 * @exception Exception
	 */
    @Override
    public List<CmmnDetailCode> selectOrgnztInfoComboDfList(CmmnDetailCode searchVO) throws Exception {
        return cnsltScheduleMngDAO.selectOrgnztInfoComboDfList(searchVO);
    }


}
