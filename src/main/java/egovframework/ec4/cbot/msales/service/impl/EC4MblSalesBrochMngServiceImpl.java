package egovframework.ec4.cbot.msales.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.cbot.msales.service.EC4MblSalesBrochMngService;
import egovframework.ec4.cbot.msales.service.MblSalesBrochMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 모바일 브로셔보기화면에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("mblSalesBrochMngService")
public class EC4MblSalesBrochMngServiceImpl extends EgovAbstractServiceImpl implements EC4MblSalesBrochMngService {

	@Resource(name="mblSalesBrochMngDAO")
    private MblSalesBrochMngDAO mblSalesBrochMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param MblSalesBrochMngVO mblSalesBrochMngVO
	 * @return List<mblSalesBrochMngVO>
	 * @exception Exception
	 */
    public List<MblSalesBrochMngVO> selectMblSalesBrochMng(MblSalesBrochMngVO mblSalesBrochMngVO) throws Exception {
        return mblSalesBrochMngDAO.selectMblSalesBrochMng(mblSalesBrochMngVO);
    }


}
