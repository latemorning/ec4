package egovframework.ec4.call.cnslt.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.ec4.call.cnslt.service.EC4CnsltLicenseMngService;
import egovframework.ec4.call.cnslt.service.CnsltLicenseMngVO;
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

@Service("cnsltLicenseMngService")
public class EC4CnsltLicenseMngServiceImpl extends EgovAbstractServiceImpl implements EC4CnsltLicenseMngService {

	private static final Logger LOGGER = LoggerFactory.getLogger(EC4CnsltLicenseMngServiceImpl.class);

	@Resource(name="cnsltLicenseMngDAO")
    private CnsltLicenseMngDAO cnsltLicenseMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param cnsltLicenseMngVO cnsltLicenseMngVO
	 * @return List<cnsltLicenseMngVO>
	 * @exception Exception
	 */
    public List<CnsltLicenseMngVO> selectCnsltLicenseMng(CnsltLicenseMngVO cnsltLicenseMngVO) throws Exception {
        return cnsltLicenseMngDAO.selectCnsltLicenseMng(cnsltLicenseMngVO);
    }


    /*
     * 상담원근태 목록
     */
    @Override
    public ArrayList<EgovMap> selectCnsltLicenseRegList(CnsltLicenseMngVO searchVO) throws Exception {
    	return cnsltLicenseMngDAO.selectCnsltLicenseRegList(searchVO);
    }


    /*
     * 상담원근태 목록 카운트
     */
    @Override
    public int selectCnsltLicenseRegListCnt(CnsltLicenseMngVO searchVO) throws Exception {
    	return cnsltLicenseMngDAO.selectCnsltLicenseRegListCnt(searchVO);
    }


    /*
     * 상담원근태 등록 액션
     */
    @Override
    public void insertCnsltLicense(CnsltLicenseMngVO cnsltLicenseMngVO) throws Exception {

        LOGGER.debug(cnsltLicenseMngVO.toString());


        
        LOGGER.debug(cnsltLicenseMngVO.toString());
        
        cnsltLicenseMngDAO.insertCnsltLicense(cnsltLicenseMngVO);
    }

    /*
     * 상담원근태 수정모드 select
     */
    @Override
    public EgovMap selectCnsltLicenseMod(CnsltLicenseMngVO cnsltLicenseMngVO) throws Exception {

        return cnsltLicenseMngDAO.selectCnsltLicenseMod(cnsltLicenseMngVO);
    }


    /*
     * 상담원근태 수정 액션
     */
    @Override
    public void updateCnsltLicense(CnsltLicenseMngVO cnsltLicenseMngVO) throws Exception {
        
        cnsltLicenseMngDAO.updateCnsltLicense(cnsltLicenseMngVO);
    }


    /*
     * 상담원근태 삭제 액션
     */
    @Override
    public void deleteCnsltLicense(CnsltLicenseMngVO cnsltLicenseMngVO) throws Exception {
        
        cnsltLicenseMngDAO.deleteCnsltLicense(cnsltLicenseMngVO);
    }


}
