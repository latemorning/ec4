package egovframework.ec4.cmm.csms.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.cmm.csms.service.CSmsMngVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * SMS발송에 대한 DAO 클래스를 정의한다.
 * @author 최재중
 * @since 2019.01.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2019.01.21  최재중          최초 생성
 *
 * </pre>
 */

@Repository("csmsMngDAO")
public class CSmsMngDAO extends EgovComAbstractDAO {



    /**
	 * 목록을 조회한다.
	 * @param CSmsMngVO csmsMngVO
	 * @return List<csmsMngVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<EgovMap> selectCSmsMngList(CSmsMngVO csmsMngVO) throws Exception {
        return (List<EgovMap>) list("EC4CSmsMngSQL.selectCSmsMngList", csmsMngVO);
    }


    public int selectCSmsMngListCnt(CSmsMngVO csmsMngVO) throws Exception {
        return (int)select("EC4CSmsMngSQL.selectCSmsMngListCnt", csmsMngVO);
    }





    /**
     * SMS 등록
     *
     * @param detailCodeVO
     * @throws Exception
     */
    public void insertCSmsMng(CSmsMngVO csmsMngVO) throws Exception {
    	insert("EC4CSmsMngSQL.insertCSmsMng", csmsMngVO);
    }

    
    /**
     * RelSeq
     *
     * @param CSmsMngVO
     * @throws Exception
     */
    public String getNextRelSeq(CSmsMngVO searchVO) throws Exception {
    return (String)select("EC4CSmsMngSQL.getNextRelSeq", searchVO);
    }


    /**
     * 추가SMS발송로그 등록
     *
     * @param CSmsMngVO
     * @throws Exception
     */
    public void regiAddSmsSendLog(CSmsMngVO csmsMngVO) throws Exception {
    	insert("EC4CSmsMngSQL.regiAddSmsSendLog", csmsMngVO);
    }


    /**
     * SMS발송 등록
     *
     * @param CSmsMngVO
     * @throws Exception
     */
    public void regiSmsSend(CSmsMngVO csmsMngVO) throws Exception {
    	insert("EC4CSmsMngSQL.regiSmsSend", csmsMngVO);
    }


    /**
     * MMS발송 등록
     *
     * @param CSmsMngVO
     * @throws Exception
     */
    public void regiMmsSend(CSmsMngVO csmsMngVO) throws Exception {
    	insert("EC4CSmsMngSQL.regiMmsSend", csmsMngVO);
    }


    /**
     * 이모티콘 등록
     *
     * @param CSmsMngVO
     * @throws Exception
     */
    public void regiSmsEmoticon(CSmsMngVO csmsMngVO) throws Exception {
    	insert("EC4CSmsMngSQL.regiSmsEmoticon", csmsMngVO);
    }


    /**
     * SMS발송 로그 등록
     *
     * @param CSmsMngVO
     * @throws Exception
     */
    public void regiSmsSendLog(CSmsMngVO csmsMngVO) throws Exception {
    	insert("EC4CSmsMngSQL.regiSmsSendLog", csmsMngVO);
    }


    /**
     * SMS JOB 등록
     *
     * @param CSmsMngVO
     * @throws Exception
     */
    public void regiSmsJob(CSmsMngVO csmsMngVO) throws Exception {
    	insert("EC4CSmsMngSQL.regiSmsJob", csmsMngVO);
    }



    /**
     * SMS작업통계  수정
     *
     * @param detailCodeVO
     * @throws Exception
     */
    public void updtSmsJobSum(CSmsMngVO csmsMngVO) throws Exception {
    	insert("EC4CSmsMngSQL.updtSmsJobSum", csmsMngVO);
    }



    /**
     * MMS발송 로그  수정
     *
     * @param detailCodeVO
     * @throws Exception
     */
    public void updtMmsSendLog(CSmsMngVO csmsMngVO) throws Exception {
    	insert("EC4CSmsMngSQL.updtMmsSendLog", csmsMngVO);
    }



    /**
     * SMS발송 로그 수정
     *
     * @param detailCodeVO
     * @throws Exception
     */
    public void updtSmsSendLog(CSmsMngVO csmsMngVO) throws Exception {
    	insert("EC4CSmsMngSQL.updtSmsSendLog", csmsMngVO);
    }
    
    /**
     * 이모티콘PK
     *
     * @param CSmsMngVO
     * @throws Exception
     */
    public String getNextSsiSeq(CSmsMngVO csmsMngVO) throws Exception {
    return (String)select("EC4CSmsMngSQL.getNextSsiSeq", csmsMngVO);
    }





}
