package egovframework.ec4.call.cnslt.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.ec4.call.cnslt.service.EC4CnsltCareerMngService;
import egovframework.ec4.call.cnslt.service.CnsltCareerMngVO;
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

@Service("cnsltCareerMngService")
public class EC4CnsltCareerMngServiceImpl extends EgovAbstractServiceImpl implements EC4CnsltCareerMngService {

	private static final Logger LOGGER = LoggerFactory.getLogger(EC4CnsltCareerMngServiceImpl.class);

	@Resource(name="cnsltCareerMngDAO")
    private CnsltCareerMngDAO cnsltCareerMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param cnsltCareerMngVO cnsltCareerMngVO
	 * @return List<cnsltCareerMngVO>
	 * @exception Exception
	 */
    public List<CnsltCareerMngVO> selectCnsltCareerMng(CnsltCareerMngVO cnsltCareerMngVO) throws Exception {
        return cnsltCareerMngDAO.selectCnsltCareerMng(cnsltCareerMngVO);
    }


    /*
     * 상담원근태 목록
     */
    @Override
    public ArrayList<EgovMap> selectCnsltCareerRegList(CnsltCareerMngVO searchVO) throws Exception {
    	return cnsltCareerMngDAO.selectCnsltCareerRegList(searchVO);
    }


    /*
     * 상담원근태 목록 카운트
     */
    @Override
    public int selectCnsltCareerRegListCnt(CnsltCareerMngVO searchVO) throws Exception {
    	return cnsltCareerMngDAO.selectCnsltCareerRegListCnt(searchVO);
    }


    /*
     * 상담원근태 등록 액션
     */
    @Override
    public void insertCnsltCareer(CnsltCareerMngVO cnsltCareerMngVO) throws Exception {

        LOGGER.debug(cnsltCareerMngVO.toString());


        
        LOGGER.debug(cnsltCareerMngVO.toString());
        
        cnsltCareerMngDAO.insertCnsltCareer(cnsltCareerMngVO);
    }

    /*
     * 상담원근태 수정모드 select
     */
    @Override
    public EgovMap selectCnsltCareerMod(CnsltCareerMngVO cnsltCareerMngVO) throws Exception {

        return cnsltCareerMngDAO.selectCnsltCareerMod(cnsltCareerMngVO);
    }


    /*
     * 상담원근태 수정 액션
     */
    @Override
    public void updateCnsltCareer(CnsltCareerMngVO cnsltCareerMngVO) throws Exception {
        
        cnsltCareerMngDAO.updateCnsltCareer(cnsltCareerMngVO);
    }


    /*
     * 상담원근태 수정 액션
     */
    @Override
    public void deleteCnsltCareer(CnsltCareerMngVO cnsltCareerMngVO) throws Exception {
        
        cnsltCareerMngDAO.deleteCnsltCareer(cnsltCareerMngVO);
    }


}
