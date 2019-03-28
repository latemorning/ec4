package egovframework.ec4.call.cmpl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.call.cmpl.service.EC4CstmrCmplMngService;
import egovframework.ec4.call.inbd.service.CnsltInBoundMngVO;
import egovframework.ec4.cmm.cbase.ctm.service.CnsltTypeDefaultVO;
import egovframework.ec4.call.cmpl.service.CstmrCmplMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.com.cmm.service.CmmnDetailCode;

/**
 * 불만접수에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("cstmrCmplMngService")
public class EC4CstmrCmplMngServiceImpl extends EgovAbstractServiceImpl implements EC4CstmrCmplMngService {

	@Resource(name="cstmrCmplMngDAO")
    private CstmrCmplMngDAO cstmrCmplMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param cstmrCmplMngVO cstmrCmplMngVO
	 * @return List<cstmrCmplMngVO>
	 * @exception Exception
	 */
    public List<CstmrCmplMngVO> selectCstmrCmplMng(CstmrCmplMngVO cstmrCmplMngVO) throws Exception {
        return cstmrCmplMngDAO.selectCstmrCmplMng(cstmrCmplMngVO);
    }

    /*
     * SCMS불만코드 콤보박스
     */
    @Override
    public List<CmmnDetailCode> selectScmsCmplCdComboList(CmmnDetailCode searchVO) throws Exception {

        return cstmrCmplMngDAO.selectScmsCmplCdComboList(searchVO);
    }

    /*
     * SCMS불만코드 목록 조회
     */
    @Override
    public List<EgovMap> selectScmsCmplCdList(CstmrCmplMngVO searchVO) throws Exception {

        return cstmrCmplMngDAO.selectScmsCmplCdList(searchVO);
    }


    /*
     * SCMS불만코드 목록 카운트
     */
    @Override
    public int selectScmsCmplCdListCnt(CstmrCmplMngVO searchVO) throws Exception {

        return cstmrCmplMngDAO.selectScmsCmplCdListCnt(searchVO);
    }



    /*
     * VOC불만내용 등록
     */
    @Override
    public void insertCstmrCmplReg(CstmrCmplMngVO cstmrCmplMngVO) throws Exception {

    	cstmrCmplMngDAO.insertCstmrCmplReg(cstmrCmplMngVO);
    	
    }

}
