package egovframework.ec4.cbot.msales.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.cbot.msales.service.EC4MblSaleCondMngService;
import egovframework.ec4.cbot.msales.service.MblSaleCondMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 모바일 판매조건확인화면에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("mblSaleCondMngService")
public class EC4MblSaleCondMngServiceImpl extends EgovAbstractServiceImpl implements EC4MblSaleCondMngService {

	@Resource(name="mblSaleCondMngDAO")
    private MblSaleCondMngDAO mblSaleCondMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param MblSaleCondMngVO mblSaleCondMngVO
	 * @return List<mblSaleCondMngVO>
	 * @exception Exception
	 */
    public List<MblSaleCondMngVO> selectMblSaleCondMng(MblSaleCondMngVO mblSaleCondMngVO) throws Exception {
        return mblSaleCondMngDAO.selectMblSaleCondMng(mblSaleCondMngVO);
    }


}
