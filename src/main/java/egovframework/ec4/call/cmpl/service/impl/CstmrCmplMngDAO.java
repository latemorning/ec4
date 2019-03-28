package egovframework.ec4.call.cmpl.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.call.cmpl.service.CstmrCmplMngVO;
import egovframework.ec4.call.inbd.service.CnsltInBoundMngVO;
import egovframework.ec4.cmm.cbase.ctm.service.CnsltTypeDefaultVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.com.cmm.service.CmmnDetailCode;

/**
 * 불만접수에 대한 DAO 클래스를 정의한다.
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

@Repository("cstmrCmplMngDAO")
public class CstmrCmplMngDAO extends EgovComAbstractDAO {



    /**
	 * 목록을 조회한다.
	 * @param cstmrCmplMngVO cstmrCmplMngVO
	 * @return List<cstmrCmplMngVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<CstmrCmplMngVO> selectCstmrCmplMng(CstmrCmplMngVO cstmrCmplMngVO) throws Exception {
        return (List<CstmrCmplMngVO>) list("cstmrCmplMngDAO.selectCstmrCmplMng", cstmrCmplMngVO);
    }


    /**
     * SCMS불만코드 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<EgovMap> selectScmsCmplCdList(CstmrCmplMngVO searchVO) throws Exception {

        return (List<EgovMap>)list("cstmrCmplMngDAO.selectScmsCmplCdList", searchVO);
    }


    /**
     * SCMS불만코드 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectScmsCmplCdListCnt(CstmrCmplMngVO searchVO) throws Exception {

        return (int)select("cstmrCmplMngDAO.selectScmsCmplCdListCnt", searchVO);
    }

    /**
	 * SCMS 콤보박스
	 * @param cstmrCmplMngVO cstmrCmplMngVO
	 * @return List<cstmrCmplMngVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<CmmnDetailCode> selectScmsCmplCdComboList(CmmnDetailCode searchVO) throws Exception {
        return (List<CmmnDetailCode>) list("cstmrCmplMngDAO.selectScmsCmplCdComboList", searchVO);
    }



    /**
     * 인바운드상담내용 등록
     *
     * @param detailCodeVO
     * @throws Exception
     */
    public void insertCstmrCmplReg(CstmrCmplMngVO cstmrCmplMngVO) throws Exception {

    	insert("cstmrCmplMngDAO.insertCstmrCmplReg", cstmrCmplMngVO);
    }



    /**
     * 인바운드상담내용 수정
     *
     * @param detailCodeVO
     * @throws Exception
     */
    public void updateCstmrCmplReg(CstmrCmplMngVO cstmrCmplMngVO) throws Exception {

    	update("cstmrCmplMngDAO.updateCstmrCmplReg", cstmrCmplMngVO);
    }
}
