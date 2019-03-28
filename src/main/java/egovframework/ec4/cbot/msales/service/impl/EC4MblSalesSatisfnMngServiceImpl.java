package egovframework.ec4.cbot.msales.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.cbot.msales.service.EC4MblSalesSatisfnMngService;
import egovframework.ec4.cbot.msales.service.MblSalesSatisfnMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 모바일 SALES만족도화면에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("mblSalesSatisfnMngService")
public class EC4MblSalesSatisfnMngServiceImpl extends EgovAbstractServiceImpl implements EC4MblSalesSatisfnMngService {

	@Resource(name="mblSalesSatisfnMngDAO")
    private MblSalesSatisfnMngDAO mblSalesSatisfnMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param MblSalesSatisfnMngVO mblSalesSatisfnMngVO
	 * @return List<mblSalesSatisfnMngVO>
	 * @exception Exception
	 */
    public List<MblSalesSatisfnMngVO> selectMblSalesSatisfnMng(MblSalesSatisfnMngVO mblSalesSatisfnMngVO) throws Exception {
        return mblSalesSatisfnMngDAO.selectMblSalesSatisfnMng(mblSalesSatisfnMngVO);
    }


}
