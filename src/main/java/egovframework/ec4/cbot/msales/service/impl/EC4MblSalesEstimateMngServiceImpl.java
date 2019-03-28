package egovframework.ec4.cbot.msales.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.cbot.msales.service.EC4MblSalesEstimateMngService;
import egovframework.ec4.cbot.msales.service.MblSalesEstimateMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 모바일 견적신청화면에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("mblSalesEstimateMngService")
public class EC4MblSalesEstimateMngServiceImpl extends EgovAbstractServiceImpl implements EC4MblSalesEstimateMngService {

	@Resource(name="mblSalesEstimateMngDAO")
    private MblSalesEstimateMngDAO mblSalesEstimateMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param MblSalesEstimateMngVO mblSalesEstimateMngVO
	 * @return List<mblSalesEstimateMngVO>
	 * @exception Exception
	 */
    public List<MblSalesEstimateMngVO> selectMblSalesEstimateMng(MblSalesEstimateMngVO mblSalesEstimateMngVO) throws Exception {
        return mblSalesEstimateMngDAO.selectMblSalesEstimateMng(mblSalesEstimateMngVO);
    }


}
