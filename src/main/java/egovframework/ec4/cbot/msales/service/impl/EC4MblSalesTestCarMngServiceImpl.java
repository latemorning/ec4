package egovframework.ec4.cbot.msales.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.cbot.msales.service.EC4MblSalesTestCarMngService;
import egovframework.ec4.cbot.msales.service.MblSalesTestCarMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 모바일 시승신청화면에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("mblSalesTestCarMngService")
public class EC4MblSalesTestCarMngServiceImpl extends EgovAbstractServiceImpl implements EC4MblSalesTestCarMngService {

	@Resource(name="mblSalesTestCarMngDAO")
    private MblSalesTestCarMngDAO mblSalesTestCarMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param MblSalesTestCarMngVO mblSalesTestCarMngVO
	 * @return List<mblSalesTestCarMngVO>
	 * @exception Exception
	 */
    public List<MblSalesTestCarMngVO> selectMblSalesTestCarMng(MblSalesTestCarMngVO mblSalesTestCarMngVO) throws Exception {
        return mblSalesTestCarMngDAO.selectMblSalesTestCarMng(mblSalesTestCarMngVO);
    }


}
