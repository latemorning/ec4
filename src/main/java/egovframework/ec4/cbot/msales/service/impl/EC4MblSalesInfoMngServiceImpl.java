package egovframework.ec4.cbot.msales.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.cbot.msales.service.EC4MblSalesInfoMngService;
import egovframework.ec4.cbot.msales.service.MblSalesInfoMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 모바일 신차정보보기화면에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("mblSalesInfoMngService")
public class EC4MblSalesInfoMngServiceImpl extends EgovAbstractServiceImpl implements EC4MblSalesInfoMngService {

	@Resource(name="mblSalesInfoMngDAO")
    private MblSalesInfoMngDAO mblSalesInfoMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param MblSalesInfoMngVO mblSalesInfoMngVO
	 * @return List<mblSalesInfoMngVO>
	 * @exception Exception
	 */
    public List<MblSalesInfoMngVO> selectMblSalesInfoMng(MblSalesInfoMngVO mblSalesInfoMngVO) throws Exception {
        return mblSalesInfoMngDAO.selectMblSalesInfoMng(mblSalesInfoMngVO);
    }


}
