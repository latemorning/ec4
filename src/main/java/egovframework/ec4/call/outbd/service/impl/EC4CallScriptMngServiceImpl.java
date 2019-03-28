package egovframework.ec4.call.outbd.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.ec4.call.outbd.service.EC4CallScriptMngService;
import egovframework.ec4.call.cnslt.service.impl.EC4CnsltLicenseMngServiceImpl;
import egovframework.ec4.call.outbd.service.CallScriptMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.com.cmm.service.CmmnDetailCode;

/**
 * CTI설정에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("callScriptMngService")
public class EC4CallScriptMngServiceImpl extends EgovAbstractServiceImpl implements EC4CallScriptMngService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EC4CnsltLicenseMngServiceImpl.class);

	@Resource(name="callScriptMngDAO")
    private CallScriptMngDAO callScriptMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param callScriptMngVO callScriptMngVO
	 * @return List<callScriptMngVO>
	 * @exception Exception
	 */
    public List<CallScriptMngVO> selectCallScriptMng(CallScriptMngVO callScriptMngVO) throws Exception {
        return callScriptMngDAO.selectCallScriptMng(callScriptMngVO);
    }

    
    
    
    
    /*
     * 콜스크립트 타이틀 목록
     */
    @Override
    public List<CmmnDetailCode> selectScriptTitleComboList(CallScriptMngVO vo) throws Exception {
    	return callScriptMngDAO.selectScriptTitleComboList(vo);
    }
    
    
    
    
    
    
    
    

    /*
     * 콜스크립트 목록
     */
    @Override
    public ArrayList<EgovMap> selectCallScriptList(CallScriptMngVO searchVO) throws Exception {
    	return callScriptMngDAO.selectCallScriptList(searchVO);
    }


    /*
     * 콜스크립트 목록 카운트
     */
    @Override
    public int selectCallScriptListCnt(CallScriptMngVO searchVO) throws Exception {
    	return callScriptMngDAO.selectCallScriptListCnt(searchVO);
    }


    /*
     * 콜스크립트 등록 액션
     */
    @Override
    public void insertCallScript(CallScriptMngVO callScriptMngVO) throws Exception {

        LOGGER.debug(callScriptMngVO.toString());
        
        callScriptMngDAO.insertCallScript(callScriptMngVO);
    }

    /*
     * 콜스크립트 수정모드 select
     */
    @Override
    public EgovMap selectCallScriptMod(CallScriptMngVO callScriptMngVO) throws Exception {
        
    	return callScriptMngDAO.selectCallScriptMod(callScriptMngVO);
    }


    /**
     * 콜스크립트 수정 액션
     *
     * @param callScriptMngVO
     * @throws Exception
     */
    public void updateCallScript(CallScriptMngVO callScriptMngVO) throws Exception {

    	callScriptMngDAO.updateCallScript(callScriptMngVO);
    }


    /*
     * 콜스크립트 삭제 액션
     */
    @Override
    public void deleteCallScript(CallScriptMngVO callScriptMngVO) throws Exception {
        
    	callScriptMngDAO.deleteCallScript(callScriptMngVO);
    }


    


    
    
    
    
    
    
    
    
    
    
    
    
    

    /*
     * 질문스크립트 목록
     */
    @Override
    public ArrayList<EgovMap> selectCallQuestList(CallScriptMngVO searchVO) throws Exception {
    	return callScriptMngDAO.selectCallQuestList(searchVO);
    }


    /*
     * 질문스크립트 목록 카운트
     */
    @Override
    public int selectCallQuestListCnt(CallScriptMngVO searchVO) throws Exception {
    	return callScriptMngDAO.selectCallQuestListCnt(searchVO);
    }


    /*
     * 질문스크립트 등록 액션
     */
    @Override
    public void insertCallQuest(CallScriptMngVO callScriptMngVO) throws Exception {

        LOGGER.debug(callScriptMngVO.toString());
        
        callScriptMngDAO.insertCallQuest(callScriptMngVO);
    }

    /*
     * 질문스크립트 수정모드 select
     */
    @Override
    public EgovMap selectCallQuestMod(CallScriptMngVO callScriptMngVO) throws Exception {
        
    	return callScriptMngDAO.selectCallQuestMod(callScriptMngVO);
    }


    /**
     * 질문스크립트 수정 액션
     *
     * @param callScriptMngVO
     * @throws Exception
     */
    public void updateCallQuest(CallScriptMngVO callScriptMngVO) throws Exception {

    	callScriptMngDAO.updateCallQuest(callScriptMngVO);
    }


    /*
     * 질문스크립트 삭제 액션
     */
    @Override
    public void deleteCallQuest(CallScriptMngVO callScriptMngVO) throws Exception {
        
    	callScriptMngDAO.deleteCallQuest(callScriptMngVO);
    }
    
    
    
    
    
    
    
    


    
    
    
    
    
    
    
    
    
    
    
    
    

    /*
     * 답변스크립트 목록
     */
    @Override
    public ArrayList<EgovMap> selectCallAnswerList(CallScriptMngVO searchVO) throws Exception {
    	return callScriptMngDAO.selectCallAnswerList(searchVO);
    }


    /*
     * 답변스크립트 목록 카운트
     */
    @Override
    public int selectCallAnswerListCnt(CallScriptMngVO searchVO) throws Exception {
    	return callScriptMngDAO.selectCallAnswerListCnt(searchVO);
    }


    /*
     * 답변스크립트 등록 액션
     */
    @Override
    public void insertCallAnswer(CallScriptMngVO callScriptMngVO) throws Exception {

        LOGGER.debug(callScriptMngVO.toString());
        
        callScriptMngDAO.insertCallAnswer(callScriptMngVO);
    }

    /*
     * 답변스크립트 수정모드 select
     */
    @Override
    public EgovMap selectCallAnswerMod(CallScriptMngVO callScriptMngVO) throws Exception {
        
    	return callScriptMngDAO.selectCallAnswerMod(callScriptMngVO);
    }


    /**
     * 답변스크립트 수정 액션
     *
     * @param callScriptMngVO
     * @throws Exception
     */
    public void updateCallAnswer(CallScriptMngVO callScriptMngVO) throws Exception {

    	callScriptMngDAO.updateCallAnswer(callScriptMngVO);
    }


    /*
     * 답변스크립트 삭제 액션
     */
    @Override
    public void deleteCallAnswer(CallScriptMngVO callScriptMngVO) throws Exception {
        
    	callScriptMngDAO.deleteCallAnswer(callScriptMngVO);
    }
    
    
    
}
