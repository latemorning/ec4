package egovframework.ec4.call.outbd.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.call.outbd.service.EC4CnsltAppntBussPlcSetMngService;
import egovframework.ec4.call.outbd.service.CnsltAppntBussPlcSetMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 아웃바운드콜상담 대상고객정보 상담에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("cnsltAppntBussPlcSetMngService")
public class EC4CnsltAppntBussPlcSetMngServiceImpl extends EgovAbstractServiceImpl implements EC4CnsltAppntBussPlcSetMngService {

	@Resource(name="cnsltAppntBussPlcSetMngDAO")
    private CnsltAppntBussPlcSetMngDAO cnsltAppntBussPlcSetMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param cnsltAppntBussPlcSetMngVO cnsltAppntBussPlcSetMngVO
	 * @return List<cnsltAppntBussPlcSetMngVO>
	 * @exception Exception
	 */
    public List<CnsltAppntBussPlcSetMngVO> selectCnsltAppntBussPlcSetMng(CnsltAppntBussPlcSetMngVO cnsltAppntBussPlcSetMngVO) throws Exception {
        return cnsltAppntBussPlcSetMngDAO.selectCnsltAppntBussPlcSetMng(cnsltAppntBussPlcSetMngVO);
    }


}
