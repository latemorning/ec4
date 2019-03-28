package egovframework.ec4.call.inbd.service;

import java.util.ArrayList;
import java.util.List;

import egovframework.ec4.call.cmpl.service.CstmrCmplMngVO;
import egovframework.ec4.cmm.cbase.cmt.service.DetailCodeVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 인바운드콜 상담에 관한 서비스 인터페이스 클래스를 정의한다.
 * @author 최재중
 * @since 2018.04.13
 * @version 1.0
 * @see
 *
 * <pre>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2018.04.13  최재중          최초 생성
 *
 * </pre>
 */

public interface EC4CnsltInBoundMngService {
    /**
	 * 목록을 조회한다.
	 * @param cnsltInBoundMngVO cnsltInBoundMngVO
	 * @return List<cnsltInBoundMngVO>
	 * @exception Exception
	 */
	public List<CnsltInBoundMngVO> selectEC4CnsltInBound(CnsltInBoundMngVO cnsltInBoundMngVO) throws Exception;
	
	void insertCnsltInBoundRegAll(CnsltInBoundMngVO cnsltInBoundMngVO, CstmrCmplMngVO cstmrCmplMngVO) throws Exception;
	
	void insertCnsltInBoundReg(CnsltInBoundMngVO cnsltInBoundMngVO) throws Exception;
	
	void insertCnsltTypeReg(CnsltInBoundMngVO cnsltInBoundMngVO) throws Exception;
	
	List<EgovMap> selectInCallCnsltTypeList(CnsltInBoundMngVO searchVO) throws Exception;
	
	int selectInCallCnsltTypeListCnt(CnsltInBoundMngVO searchVO) throws Exception;
	
	ArrayList<EgovMap> selectCallCnsltHistList(CnsltInBoundMngVO searchVO) throws Exception;
	
	int selectCallCnsltHistListCnt(CnsltInBoundMngVO searchVO) throws Exception;
	
	List<EgovMap> selectCnsltTypeLoad(CnsltInBoundMngVO searchVO) throws Exception;
	
	ArrayList<EgovMap> selectCallCnsltInBoundList(CnsltInBoundMngVO searchVO) throws Exception;
	
	int selectCallCnsltInBoundListCnt(CnsltInBoundMngVO searchVO) throws Exception;
	
	ArrayList<EgovMap> selectCallCnsltInBoundStatList(CnsltInBoundMngVO searchVO) throws Exception;
	
	int selectCallCnsltInBoundStatListCnt(CnsltInBoundMngVO searchVO) throws Exception;
	
	ArrayList<EgovMap> selectCallCnsltReqList(CnsltInBoundMngVO searchVO) throws Exception;
	
	int selectCallCnsltReqListCnt(CnsltInBoundMngVO searchVO) throws Exception;
	
	ArrayList<EgovMap> selectCnsltInBoundMgrProcList(CnsltInBoundMngVO searchVO) throws Exception;
	
	int selectCnsltInBoundMgrProcListCnt(CnsltInBoundMngVO searchVO) throws Exception;
	
	EgovMap selectCnsltInBoundMgrProcLoad(CnsltInBoundMngVO cnsltInBoundMngVO) throws Exception;
	
	void updateCnsltInBoundRegAll(CnsltInBoundMngVO cnsltInBoundMngVO, CstmrCmplMngVO cstmrCmplMngVO) throws Exception;
	
	EgovMap loadCstmrLastInfo(CnsltInBoundMngVO cnsltInBoundMngVO) throws Exception;
	
	ArrayList<EgovMap> selectCallCarRecallList(CnsltInBoundMngVO searchVO) throws Exception;
	
	int selectCallCarRecallListCnt(CnsltInBoundMngVO searchVO) throws Exception;
	
	ArrayList<EgovMap> selectCallCarPeriodList(CnsltInBoundMngVO searchVO) throws Exception;
	
	int selectCallCarPeriodListCnt(CnsltInBoundMngVO searchVO) throws Exception;

	ArrayList<EgovMap> selectCallContSalesList(CnsltInBoundMngVO searchVO) throws Exception;
	
	int selectCallContSalesListCnt(CnsltInBoundMngVO searchVO) throws Exception;
}
