package egovframework.ec4.call.cnslt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.call.cnslt.service.EC4CnsltntMngService;
import egovframework.ec4.cmm.service.PopupTestDefaultVO;
import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.ec4.call.cnslt.service.CnsltntMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 상담원에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("cnsltntMngService")
public class EC4CnsltntMngServiceImpl extends EgovAbstractServiceImpl implements EC4CnsltntMngService {

	@Resource(name="cnsltntMngDAO")
    private CnsltntMngDAO cnsltntMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param cnsltntMngVO cnsltntMngVO
	 * @return List<cnsltntMngVO>
	 * @exception Exception
	 */
    @Override
    public List<EgovMap> selectCnsltntMngList(CnsltntMngVO cnsltntMngVO) throws Exception {
        return cnsltntMngDAO.selectCnsltntMngList(cnsltntMngVO);
    }


    @Override
    public int selectCnsltntMngListCnt(CnsltntMngVO cnsltntMngVO) throws Exception {
        return cnsltntMngDAO.selectCnsltntMngListCnt(cnsltntMngVO);
    }
    

    /**
	 * 상담원목록 combo 조회한다.
	 * @param cnsltntMngVO cnsltntMngVO
	 * @return List<cnsltntMngVO>
	 * @exception Exception
	 */
    @Override
    public List<CmmnDetailCode> selectCnsltntComboList(CnsltntMngVO cnsltntMngVO) throws Exception {
        return cnsltntMngDAO.selectCnsltntComboList(cnsltntMngVO);
    }
    

    /**
	 * 상담원부서목록 combo 조회한다.
	 * @param cnsltntMngVO cnsltntMngVO
	 * @return List<cnsltntMngVO>
	 * @exception Exception
	 */
    @Override
    public List<CmmnDetailCode> selectOrgnztInfoComboDfList(CmmnDetailCode searchVO) throws Exception {
        return cnsltntMngDAO.selectOrgnztInfoComboDfList(searchVO);
    }


}
