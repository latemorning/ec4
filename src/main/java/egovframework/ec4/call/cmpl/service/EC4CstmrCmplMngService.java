package egovframework.ec4.call.cmpl.service;

import java.util.List;

import egovframework.ec4.call.inbd.service.CnsltInBoundMngVO;
import egovframework.ec4.cmm.cbase.ctm.service.CnsltTypeDefaultVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.com.cmm.service.CmmnDetailCode;

/**
 * 불만접수에 관한 서비스 인터페이스 클래스를 정의한다.
 * @author 최재중
 * @since 2018.04.26
 * @version 1.0
 * @see
 *
 * <pre>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2018.04.26  최재중          최초 생성
 *
 * </pre>
 */

public interface EC4CstmrCmplMngService {
    /**
	 * 목록을 조회한다.
	 * @param cstmrCmplMngVO cstmrCmplMngVO
	 * @return List<cstmrCmplMngVO>
	 * @exception Exception
	 */
	public List<CstmrCmplMngVO> selectCstmrCmplMng(CstmrCmplMngVO cstmrCmplMngVO) throws Exception;

	public List<CmmnDetailCode> selectScmsCmplCdComboList(CmmnDetailCode searchVO) throws Exception;

    List<EgovMap> selectScmsCmplCdList(CstmrCmplMngVO searchVO) throws Exception;
    
    int selectScmsCmplCdListCnt(CstmrCmplMngVO searchVO) throws Exception;
    
	void insertCstmrCmplReg(CstmrCmplMngVO cstmrCmplMngVO) throws Exception;
	
}
