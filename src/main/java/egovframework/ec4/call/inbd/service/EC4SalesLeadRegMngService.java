package egovframework.ec4.call.inbd.service;

import java.util.ArrayList;
import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * SALES리드 판매정보 상담에 관한 서비스 인터페이스 클래스를 정의한다.
 * @author 최재중
 * @since 2018.04.23
 * @version 1.0
 * @see
 *
 * <pre>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2018.04.23  최재중          최초 생성
 *
 * </pre>
 */

public interface EC4SalesLeadRegMngService {
    /**
	 * 목록을 조회한다.
	 * @param salesLeadRegMngVO salesLeadRegMngVO
	 * @return List<salesLeadRegMngVO>
	 * @exception Exception
	 */
	public List<SalesLeadRegMngVO> selectEC4CnsltInBound(SalesLeadRegMngVO salesLeadRegMngVO) throws Exception;
	
	ArrayList<EgovMap> selectSalesLeadRegList(SalesLeadRegMngVO searchVO) throws Exception;
	
	int selectSalesLeadRegListCnt(SalesLeadRegMngVO searchVO) throws Exception;

    void insertSalesLead(SalesLeadRegMngVO searchVO) throws Exception;
    
    EgovMap selectLeadSeqChk(SalesLeadRegMngVO salesLeadRegMngVO) throws Exception;
    
    EgovMap selectSalesLeadMod(SalesLeadRegMngVO salesLeadRegMngVO) throws Exception;

    void updateSalesLead(SalesLeadRegMngVO searchVO) throws Exception;

    void deleteSalesLead(SalesLeadRegMngVO searchVO) throws Exception;
	
}
