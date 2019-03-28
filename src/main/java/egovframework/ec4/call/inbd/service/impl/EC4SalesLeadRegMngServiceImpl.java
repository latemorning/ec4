package egovframework.ec4.call.inbd.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.ec4.call.inbd.service.EC4SalesLeadRegMngService;
import egovframework.ec4.call.inbd.service.SalesLeadRegMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * SALES리드 판매정보 상담에 관한 ServiceImpl 클래스를 정의한다.
 * @author 최재중
 * @since 2018.04.23
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2018.04.23  최재중          최초 생성
 *
 * </pre>
 */

@Service("salesLeadRegMngService")
public class EC4SalesLeadRegMngServiceImpl extends EgovAbstractServiceImpl implements EC4SalesLeadRegMngService {

	private static final Logger LOGGER = LoggerFactory.getLogger(EC4SalesLeadRegMngServiceImpl.class);
	
	@Resource(name="salesLeadRegMngDAO")
    private SalesLeadRegMngDAO salesLeadRegMngDAO;

    /** ID Generation (context-idgn-......xml) */
    //@Resource(name = "ec4SalesLeadIdGnrService")
    //private EgovIdGnrService salesLeadIdGnrService;


    /**
	 * 목록을 조회한다.
	 * @param salesLeadRegMngVO salesLeadRegMngVO
	 * @return List<salesLeadRegMngVO>
	 * @exception Exception
	 */
    public List<SalesLeadRegMngVO> selectEC4CnsltInBound(SalesLeadRegMngVO salesLeadRegMngVO) throws Exception {
        return salesLeadRegMngDAO.selectEC4CnsltInBound(salesLeadRegMngVO);
    }


    /*
     * SALES판매 목록
     */
    @Override
    public ArrayList<EgovMap> selectSalesLeadRegList(SalesLeadRegMngVO searchVO) throws Exception {
    	return salesLeadRegMngDAO.selectSalesLeadRegList(searchVO);
    }


    /*
     * SALES판매 목록 카운트
     */
    @Override
    public int selectSalesLeadRegListCnt(SalesLeadRegMngVO searchVO) throws Exception {
    	return salesLeadRegMngDAO.selectSalesLeadRegListCnt(searchVO);
    }


    /*
     * SALES리드 판매정보 등록 액션
     */
    @Override
    public void insertSalesLead(SalesLeadRegMngVO salesLeadRegMngVO) throws Exception {

        LOGGER.debug(salesLeadRegMngVO.toString());

        /** ID Generation Service */
        //String salesLeadId = salesLeadIdGnrService.getNextStringId();
        
        //salesLeadRegMngVO.setSalesLeadId(salesLeadId);
        
        LOGGER.debug(salesLeadRegMngVO.toString());
        
        salesLeadRegMngDAO.insertSalesLead(salesLeadRegMngVO);
    }

    /*
     * SALES리드 판매정보 PK순번
     */
    @Override
    public EgovMap selectLeadSeqChk(SalesLeadRegMngVO salesLeadRegMngVO) throws Exception {

        return salesLeadRegMngDAO.selectLeadSeqChk(salesLeadRegMngVO);
    }

    /*
     * SALES리드 판매정보 수정모드 select
     */
    @Override
    public EgovMap selectSalesLeadMod(SalesLeadRegMngVO salesLeadRegMngVO) throws Exception {

        return salesLeadRegMngDAO.selectSalesLeadMod(salesLeadRegMngVO);
    }


    /*
     * SALES리드 판매정보 수정 액션
     */
    @Override
    public void updateSalesLead(SalesLeadRegMngVO salesLeadRegMngVO) throws Exception {
        
        salesLeadRegMngDAO.updateSalesLead(salesLeadRegMngVO);
    }


    /*
     * SALES리드 판매정보 수정 액션
     */
    @Override
    public void deleteSalesLead(SalesLeadRegMngVO salesLeadRegMngVO) throws Exception {
        
        salesLeadRegMngDAO.deleteSalesLead(salesLeadRegMngVO);
    }
 

}
