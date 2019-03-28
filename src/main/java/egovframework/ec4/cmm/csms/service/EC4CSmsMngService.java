package egovframework.ec4.cmm.csms.service;

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

public interface EC4CSmsMngService {
    /**
	 * 목록을 조회한다.
	 * @param CSmsMngVO csmsMngVO
	 * @return List<csmsMngVO>
	 * @exception Exception
	 */
	public List<EgovMap> selectCSmsMngList(CSmsMngVO csmsMngVO) throws Exception;

    void regiSmsSendLog(CSmsMngVO csmsMngVO) throws Exception;
    
    void regiSmsJob(CSmsMngVO csmsMngVO) throws Exception;
    
    void regiAddSmsSendLog(CSmsMngVO csmsMngVO) throws Exception;
    
    void regiSmsSend(CSmsMngVO csmsMngVO) throws Exception;
    
    void regiMmsSend(CSmsMngVO csmsMngVO) throws Exception;
    
    void regiSmsEmoticon(CSmsMngVO csmsMngVO) throws Exception;
    
    void updtMmsSendLog(CSmsMngVO csmsMngVO) throws Exception;
    
    void updtSmsSendLog(CSmsMngVO csmsMngVO) throws Exception;

    void updtSmsJobSum(CSmsMngVO csmsMngVO) throws Exception;
    
    void smsSendAllNotMulti(CSmsMngVO csmsMngVO) throws Exception;

    
    
    
    int selectCSmsMngListCnt(CSmsMngVO csmsMngVO) throws Exception;
    
    void insertCSmsMng(CSmsMngVO csmsMngVO) throws Exception;

    public String getNextRelSeq(CSmsMngVO searchVO) throws Exception;
    
}
