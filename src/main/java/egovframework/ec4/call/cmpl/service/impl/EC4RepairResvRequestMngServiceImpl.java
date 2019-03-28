package egovframework.ec4.call.cmpl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.call.cmpl.service.EC4RepairResvRequestMngService;
import egovframework.ec4.call.cmpl.service.RepairResvRequestMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 정비예약요청에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("repairResvRequestMngService")
public class EC4RepairResvRequestMngServiceImpl extends EgovAbstractServiceImpl implements EC4RepairResvRequestMngService {

	@Resource(name="repairResvRequestMngDAO")
    private RepairResvRequestMngDAO repairResvRequestMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param RepairResvRequestMngVO repairResvRequestMngVO
	 * @return List<RepairResvRequestMngVO>
	 * @exception Exception
	 */
    public List<RepairResvRequestMngVO> selectRepairResvRequestMng(RepairResvRequestMngVO repairResvRequestMngVO) throws Exception {
        return repairResvRequestMngDAO.selectRepairResvRequestMng(repairResvRequestMngVO);
    }


}
