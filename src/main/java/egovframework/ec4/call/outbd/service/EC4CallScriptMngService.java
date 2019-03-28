package egovframework.ec4.call.outbd.service;

import java.util.ArrayList;
import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.com.cmm.service.CmmnDetailCode;

/**
 * CTI설정에 관한 서비스 인터페이스 클래스를 정의한다.
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

public interface EC4CallScriptMngService {
    /**
	 * 목록을 조회한다.
	 * @param callScriptMngVO callScriptMngVO
	 * @return List<callScriptMngVO>
	 * @exception Exception
	 */
	public List<CallScriptMngVO> selectCallScriptMng(CallScriptMngVO callScriptMngVO) throws Exception;
	
	
	
	public List<CmmnDetailCode> selectScriptTitleComboList(CallScriptMngVO searchVO) throws Exception;
	
	
	//콜스크립트
	ArrayList<EgovMap> selectCallScriptList(CallScriptMngVO searchVO) throws Exception;
	
	int selectCallScriptListCnt(CallScriptMngVO searchVO) throws Exception;
	
	void insertCallScript(CallScriptMngVO searchVO) throws Exception;
	
	EgovMap selectCallScriptMod(CallScriptMngVO callScriptMngVO) throws Exception;
	
	void updateCallScript(CallScriptMngVO searchVO) throws Exception;
	
	void deleteCallScript(CallScriptMngVO searchVO) throws Exception;
	
	
	
	
	//질문스크립트
	ArrayList<EgovMap> selectCallQuestList(CallScriptMngVO searchVO) throws Exception;
	
	int selectCallQuestListCnt(CallScriptMngVO searchVO) throws Exception;
	
	void insertCallQuest(CallScriptMngVO searchVO) throws Exception;
	
	EgovMap selectCallQuestMod(CallScriptMngVO callScriptMngVO) throws Exception;
	
	void updateCallQuest(CallScriptMngVO searchVO) throws Exception;
	
	void deleteCallQuest(CallScriptMngVO searchVO) throws Exception;
	
	
	
	
	//답변스크립트
	ArrayList<EgovMap> selectCallAnswerList(CallScriptMngVO searchVO) throws Exception;
	
	int selectCallAnswerListCnt(CallScriptMngVO searchVO) throws Exception;
	
	void insertCallAnswer(CallScriptMngVO searchVO) throws Exception;
	
	EgovMap selectCallAnswerMod(CallScriptMngVO callScriptMngVO) throws Exception;
	
	void updateCallAnswer(CallScriptMngVO searchVO) throws Exception;
	
	void deleteCallAnswer(CallScriptMngVO searchVO) throws Exception;
	
}
