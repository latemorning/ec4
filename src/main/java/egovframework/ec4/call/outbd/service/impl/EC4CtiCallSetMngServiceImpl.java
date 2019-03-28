package egovframework.ec4.call.outbd.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.call.outbd.service.EC4CtiCallSetMngService;
import egovframework.ec4.call.outbd.service.CtiCallSetMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * CTI설정에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("ctiCallSetMngService")
public class EC4CtiCallSetMngServiceImpl extends EgovAbstractServiceImpl implements EC4CtiCallSetMngService {

	@Resource(name="ctiCallSetMngDAO")
    private CtiCallSetMngDAO ctiCallSetMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param ctiCallSetMngVO ctiCallSetMngVO
	 * @return List<ctiCallSetMngVO>
	 * @exception Exception
	 */
    public List<CtiCallSetMngVO> selectCtiCallSetMng(CtiCallSetMngVO ctiCallSetMngVO) throws Exception {
        return ctiCallSetMngDAO.selectCtiCallSetMng(ctiCallSetMngVO);
    }


}
