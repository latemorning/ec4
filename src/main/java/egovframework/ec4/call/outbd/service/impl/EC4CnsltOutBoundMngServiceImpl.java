package egovframework.ec4.call.outbd.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.call.outbd.service.EC4CnsltOutBoundMngService;
import egovframework.ec4.call.outbd.service.CnsltOutBoundMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 아웃바운드콜상담현황에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("cnsltOutBoundMngService")
public class EC4CnsltOutBoundMngServiceImpl extends EgovAbstractServiceImpl implements EC4CnsltOutBoundMngService {

	@Resource(name="cnsltOutBoundMngDAO")
    private CnsltOutBoundMngDAO cnsltOutBoundMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param cnsltOutBoundMngVO cnsltOutBoundMngVO
	 * @return List<cnsltOutBoundMngVO>
	 * @exception Exception
	 */
    public List<CnsltOutBoundMngVO> selectCnsltOutBoundMng(CnsltOutBoundMngVO cnsltOutBoundMngVO) throws Exception {
        return cnsltOutBoundMngDAO.selectCnsltOutBoundMng(cnsltOutBoundMngVO);
    }


    /*
     * 대상고객 목록
     */
    @Override
    public ArrayList<EgovMap> searchCnsltOutBoundList(CnsltOutBoundMngVO searchVO) throws Exception {
    	return cnsltOutBoundMngDAO.searchCnsltOutBoundList(searchVO);
    }


    /*
     * 대상고객 목록 카운트
     */
    @Override
    public int searchCnsltOutBoundListCnt(CnsltOutBoundMngVO searchVO) throws Exception {
    	return cnsltOutBoundMngDAO.searchCnsltOutBoundListCnt(searchVO);
    }



    /*
     * 콜대상고객 목록 LOAD
     */
    @Override
    public List<EgovMap> selectCnsltOutBoundMngLoad(CnsltOutBoundMngVO searchVO) throws Exception {
    	return cnsltOutBoundMngDAO.selectCnsltOutBoundMngLoad(searchVO);
    }


}
