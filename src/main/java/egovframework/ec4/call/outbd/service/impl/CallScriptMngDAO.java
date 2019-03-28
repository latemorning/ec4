package egovframework.ec4.call.outbd.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.call.outbd.service.CallScriptMngVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.com.cmm.service.CmmnDetailCode;

/**
 * CTI설정에 대한 DAO 클래스를 정의한다.
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

@Repository("callScriptMngDAO")
public class CallScriptMngDAO extends EgovComAbstractDAO {



    /**
	 * 목록을 조회한다.
	 * @param callScriptMngVO callScriptMngVO
	 * @return List<callScriptMngVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<CallScriptMngVO> selectCallScriptMng(CallScriptMngVO callScriptMngVO) throws Exception {
        return (List<CallScriptMngVO>) list("callScriptMngDAO.selectCallScriptMng", callScriptMngVO);
    }

    
    
    
    
    
    /**
     * 콜스크립트 타이틀 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<CmmnDetailCode> selectScriptTitleComboList(CallScriptMngVO searchVO) throws Exception {
        return (List<CmmnDetailCode>) list("callScriptMngDAO.selectScriptTitleComboList", searchVO);
    }
    
    
    
    
    

    /**
     * 콜스크립트 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectCallScriptList(CallScriptMngVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("callScriptMngDAO.selectCallScriptList", searchVO);
    }


    /**
     * 콜스크립트 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCallScriptListCnt(CallScriptMngVO searchVO) throws Exception {

        return (int)select("callScriptMngDAO.selectCallScriptListCnt", searchVO);
    }


    /**
     * 콜스크립트 등록 액션
     *
     * @param callScriptMngVO
     * @throws Exception
     */
    public void insertCallScript(CallScriptMngVO callScriptMngVO) throws Exception {

        insert("callScriptMngDAO.insertCallScript", callScriptMngVO);
    }


    /**
     * 콜스크립트 수정모드 select
     *
     * @param callScriptMngVO
     * @return
     * @throws Exception
     */
    public EgovMap selectCallScriptMod(CallScriptMngVO callScriptMngVO) throws Exception {

        return (EgovMap)select("callScriptMngDAO.selectCallScriptMod", callScriptMngVO);
    }


    /**
     * 콜스크립트 수정 액션
     *
     * @param callScriptMngVO
     * @throws Exception
     */
    public void updateCallScript(CallScriptMngVO callScriptMngVO) throws Exception {

        update("callScriptMngDAO.updateCallScript", callScriptMngVO);
    }


    /**
     * 콜스크립트 삭제 액션
     *
     * @param callScriptMngVO
     * @throws Exception
     */
    public void deleteCallScript(CallScriptMngVO callScriptMngVO) throws Exception {

        delete("callScriptMngDAO.deleteCallScript", callScriptMngVO);
    }

    
    
    
    


    
    
    
    
    
    
    
    
    
    

    /**
     * 질문스크립트 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectCallQuestList(CallScriptMngVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("callScriptMngDAO.selectCallQuestList", searchVO);
    }


    /**
     * 질문스크립트 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCallQuestListCnt(CallScriptMngVO searchVO) throws Exception {

        return (int)select("callScriptMngDAO.selectCallQuestListCnt", searchVO);
    }


    /**
     * 질문스크립트 등록 액션
     *
     * @param callScriptMngVO
     * @throws Exception
     */
    public void insertCallQuest(CallScriptMngVO callScriptMngVO) throws Exception {

        insert("callScriptMngDAO.insertCallQuest", callScriptMngVO);
    }


    /**
     * 질문스크립트 수정모드 select
     *
     * @param callScriptMngVO
     * @return
     * @throws Exception
     */
    public EgovMap selectCallQuestMod(CallScriptMngVO callScriptMngVO) throws Exception {

        return (EgovMap)select("callScriptMngDAO.selectCallQuestMod", callScriptMngVO);
    }


    /**
     * 질문스크립트 수정 액션
     *
     * @param callScriptMngVO
     * @throws Exception
     */
    public void updateCallQuest(CallScriptMngVO callScriptMngVO) throws Exception {

        update("callScriptMngDAO.updateCallQuest", callScriptMngVO);
    }


    /**
     * 질문스크립트 삭제 액션
     *
     * @param callScriptMngVO
     * @throws Exception
     */
    public void deleteCallQuest(CallScriptMngVO callScriptMngVO) throws Exception {

        delete("callScriptMngDAO.deleteCallQuest", callScriptMngVO);
    }
    
    
    
    
    
    


    
    
    
    
    
    
    
    
    
    

    /**
     * 답변스크립트 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectCallAnswerList(CallScriptMngVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("callScriptMngDAO.selectCallAnswerList", searchVO);
    }


    /**
     * 답변스크립트 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCallAnswerListCnt(CallScriptMngVO searchVO) throws Exception {

        return (int)select("callScriptMngDAO.selectCallAnswerListCnt", searchVO);
    }


    /**
     * 답변스크립트 등록 액션
     *
     * @param callScriptMngVO
     * @throws Exception
     */
    public void insertCallAnswer(CallScriptMngVO callScriptMngVO) throws Exception {

        insert("callScriptMngDAO.insertCallAnswer", callScriptMngVO);
    }


    /**
     * 답변스크립트 수정모드 select
     *
     * @param callScriptMngVO
     * @return
     * @throws Exception
     */
    public EgovMap selectCallAnswerMod(CallScriptMngVO callScriptMngVO) throws Exception {

        return (EgovMap)select("callScriptMngDAO.selectCallAnswerMod", callScriptMngVO);
    }


    /**
     * 답변스크립트 수정 액션
     *
     * @param callScriptMngVO
     * @throws Exception
     */
    public void updateCallAnswer(CallScriptMngVO callScriptMngVO) throws Exception {

        update("callScriptMngDAO.updateCallAnswer", callScriptMngVO);
    }


    /**
     * 답변스크립트 삭제 액션
     *
     * @param callScriptMngVO
     * @throws Exception
     */
    public void deleteCallAnswer(CallScriptMngVO callScriptMngVO) throws Exception {

        delete("callScriptMngDAO.deleteCallAnswer", callScriptMngVO);
    }

}
