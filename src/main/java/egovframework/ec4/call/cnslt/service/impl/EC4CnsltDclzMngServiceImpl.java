package egovframework.ec4.call.cnslt.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.ec4.call.cnslt.service.EC4CnsltDclzMngService;
import egovframework.ec4.call.cnslt.service.CnsltDclzMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 상담원에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("cnsltDclzMngService")
public class EC4CnsltDclzMngServiceImpl extends EgovAbstractServiceImpl implements EC4CnsltDclzMngService {

	private static final Logger LOGGER = LoggerFactory.getLogger(EC4CnsltDclzMngServiceImpl.class);

	@Resource(name="cnsltDclzMngDAO")
    private CnsltDclzMngDAO cnsltDclzMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param cnsltDclzMngVO cnsltDclzMngVO
	 * @return List<cnsltDclzMngVO>
	 * @exception Exception
	 */
    public List<CnsltDclzMngVO> selectCnsltDclzMng(CnsltDclzMngVO cnsltDclzMngVO) throws Exception {
        return cnsltDclzMngDAO.selectCnsltDclzMng(cnsltDclzMngVO);
    }


    /*
     * 상담원근태 목록
     */
    @Override
    public ArrayList<EgovMap> selectCnsltDclzRegList(CnsltDclzMngVO searchVO) throws Exception {
    	return cnsltDclzMngDAO.selectCnsltDclzRegList(searchVO);
    }


    /*
     * 상담원근태 목록 카운트
     */
    @Override
    public int selectCnsltDclzRegListCnt(CnsltDclzMngVO searchVO) throws Exception {
    	return cnsltDclzMngDAO.selectCnsltDclzRegListCnt(searchVO);
    }


    /*
     * 상담원근태 등록 액션
     */
    @Override
    public void insertCnsltDclz(CnsltDclzMngVO cnsltDclzMngVO) throws Exception {

        LOGGER.debug(cnsltDclzMngVO.toString());


        
        LOGGER.debug(cnsltDclzMngVO.toString());
        
        cnsltDclzMngDAO.insertCnsltDclz(cnsltDclzMngVO);
    }

    /*
     * 상담원근태 수정모드 select
     */
    @Override
    public EgovMap selectCnsltDclzMod(CnsltDclzMngVO cnsltDclzMngVO) throws Exception {

        return cnsltDclzMngDAO.selectCnsltDclzMod(cnsltDclzMngVO);
    }


    /*
     * 상담원근태 수정 액션
     */
    @Override
    public void updateCnsltDclz(CnsltDclzMngVO cnsltDclzMngVO) throws Exception {
        
        cnsltDclzMngDAO.updateCnsltDclz(cnsltDclzMngVO);
    }


    /*
     * 상담원근태 수정 액션
     */
    @Override
    public void deleteCnsltDclz(CnsltDclzMngVO cnsltDclzMngVO) throws Exception {
        
        cnsltDclzMngDAO.deleteCnsltDclz(cnsltDclzMngVO);
    }


}
