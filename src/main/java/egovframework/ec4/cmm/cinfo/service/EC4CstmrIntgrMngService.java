package egovframework.ec4.cmm.cinfo.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 상담원에 관한 서비스 인터페이스 클래스를 정의한다.
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

public interface EC4CstmrIntgrMngService {
    /**
	 * 목록을 조회한다.
	 * @param cstmrIntgrMngVO cstmrIntgrMngVO
	 * @return List<cstmrIntgrMngVO>
	 * @exception Exception
	 */
	public List<EgovMap> selectCstmrIntgrMngList(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception;

    int selectCstmrIntgrMngListCnt(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception;
    
    void insertCstmrIntgrMng(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception;

	public List<EgovMap> selectCstmrCarList(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception;

    int selectCstmrCarListCnt(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception;

	public List<EgovMap> existCstmrSearchList(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception;

    int existCstmrSearchListCnt(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception;
    
    void updateCstmrIntgrLinkMng(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception;
    
    void insertCstmrLinkCarAcqs(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception;
    
    void insertCstmrInfoLinkMng(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception;
    
    public String getNextRelSeq(CstmrIntgrMngVO searchVO) throws Exception;
    
    void updateCstmrFinalYn(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception;

	public List<EgovMap> cstmrOwnerCarList(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception;

    int cstmrOwnerCarListCnt(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception;
    
    void insertCstmrIntgrMngNew(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception;
    
    void updateCstmrIntgrMng(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception;
    
    EgovMap selectCstmrIntgrMngMod(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception;
    
    void deleteCstmrIntgrMng(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception;
}
