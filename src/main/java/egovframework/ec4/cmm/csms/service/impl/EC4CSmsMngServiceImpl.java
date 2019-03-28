package egovframework.ec4.cmm.csms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import egovframework.ec4.cmm.csms.service.EC4CSmsMngService;
import egovframework.ec4.cmm.service.PopupTestDefaultVO;
import egovframework.ec4.cmm.csms.service.CSmsMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 상담원에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("csmsMngService")
public class EC4CSmsMngServiceImpl extends EgovAbstractServiceImpl implements EC4CSmsMngService {

	@Resource(name="csmsMngDAO")
    private CSmsMngDAO csmsMngDAO;

    /** ID Generation */
    @Resource(name = "ec4CallCustIdGnrService")
    private EgovIdGnrService callCustIdGnrService;

    /** ID Generation */
    @Resource(name = "ec4SMSJobNoIdGnrService")
    private EgovIdGnrService smsJobNoGnrService;
    
    
    
    


    /**
	 * 목록을 조회한다.
	 * @param CSmsMngVO csmsMngVO
	 * @return List<csmsMngVO>
	 * @exception Exception
	 */
    @Override
    public List<EgovMap> selectCSmsMngList(CSmsMngVO csmsMngVO) throws Exception {
        return csmsMngDAO.selectCSmsMngList(csmsMngVO);
    }


    @Override
    public int selectCSmsMngListCnt(CSmsMngVO csmsMngVO) throws Exception {
        return csmsMngDAO.selectCSmsMngListCnt(csmsMngVO);
    }

   



    /*
     * SMS 등록
     */
    @Override
    public void insertCSmsMng(CSmsMngVO csmsMngVO) throws Exception {
    	// 현재로써 사용안하는 함수 20190129
    	csmsMngDAO.insertCSmsMng(csmsMngVO);
    }



    /*
     * RelSeq
     */
    @Override
    public String getNextRelSeq(CSmsMngVO searchVO) throws Exception {
    return csmsMngDAO.getNextRelSeq(searchVO);
    }



    /*
     * 추가SMS발송로그 등록
     */
    @Override
    public void regiAddSmsSendLog(CSmsMngVO csmsMngVO) throws Exception {
    	
    	csmsMngDAO.regiAddSmsSendLog(csmsMngVO);
    }



    /*
     * SMS발송 등록
     */
    @Override
    public void regiSmsSend(CSmsMngVO csmsMngVO) throws Exception {
    	
    	csmsMngDAO.regiSmsSend(csmsMngVO);
    }



    /*
     * MMS발송 등록
     */
    @Override
    public void regiMmsSend(CSmsMngVO csmsMngVO) throws Exception {
    	
    	csmsMngDAO.regiMmsSend(csmsMngVO);
    }



    /*
     * 이모티콘 등록
     */
    @Override
    public void regiSmsEmoticon(CSmsMngVO csmsMngVO) throws Exception {
    	
    	String strSsiSeq = csmsMngDAO.getNextSsiSeq(csmsMngVO);
    	csmsMngVO.setSsiSeq(strSsiSeq);
    	csmsMngVO.setMaxSsiSeq(strSsiSeq);
    	
    	csmsMngDAO.regiSmsEmoticon(csmsMngVO);
    }



    /*
     * SMS발송로그 등록
     */
    @Override
    public void regiSmsSendLog(CSmsMngVO csmsMngVO) throws Exception {
    	
    	csmsMngDAO.regiSmsSendLog(csmsMngVO);
    }



    /*
     * SMS JOB 등록
     */
    @Override
    public void regiSmsJob(CSmsMngVO csmsMngVO) throws Exception {
    	
    	csmsMngDAO.regiSmsJob(csmsMngVO);
    }



    /*
     * SMS처리통계 수정
     */
    @Override
    public void updtSmsJobSum(CSmsMngVO csmsMngVO) throws Exception {
    	
    	csmsMngDAO.updtSmsJobSum(csmsMngVO);
    }



    /*
     * MMS발송 로그 수정
     */
    @Override
    public void updtMmsSendLog(CSmsMngVO csmsMngVO) throws Exception {
    	
    	csmsMngDAO.updtMmsSendLog(csmsMngVO);
    }



    /*
     * SMS발송로그 수정
     */
    @Override
    public void updtSmsSendLog(CSmsMngVO csmsMngVO) throws Exception {
    	
    	csmsMngDAO.updtSmsSendLog(csmsMngVO);
    }



    /*
     * SMS발송 단건 등록
     */
    @Override
    public void smsSendAllNotMulti(CSmsMngVO csmsMngVO) throws Exception {
    	
		List list = null;
		String result = "Y";
		int cnt = 0;
		Integer getMsgLen = 0;
		Integer msgLen = 0;
		String sendDate = StringUtils.defaultString(csmsMngVO.getSendDate());

		System.out.println("csmsMngVO.getSendDate()["+csmsMngVO.getSendDate()+"] ");
		if(!sendDate.isEmpty()) sendDate = sendDate.replace("-", "");
		String sendHour = StringUtils.defaultString(csmsMngVO.getSendHour());
		String sendMinute = StringUtils.defaultString(csmsMngVO.getSendMinute());
		String reserveTime;
		String msgType =  StringUtils.defaultString(csmsMngVO.getMsgType());
		String SMS_080_ADD = StringUtils.defaultString(csmsMngVO.getSMS_080_ADD());
		String SMS_ADD_ADD = StringUtils.defaultString(csmsMngVO.getSMS_ADD_ADD());
		String rejectReceiveNo = StringUtils.defaultString(csmsMngVO.getRejectReceiveNo());
		if("".equals(rejectReceiveNo)){
			rejectReceiveNo = "080-111-1111";
		}
		
		System.out.println("sendDate["+sendDate+"] sendHour["+sendHour+"] sendMinute["+sendMinute+"]");
		if ("".equals(sendDate)) {
			reserveTime = "00000000000000";
		} else {
			if("".equals(sendHour) || "".equals(sendMinute) ){
				throw new egovframework.rte.fdl.cmmn.exception.EgovBizException("예약시간을 확인해주세요.");
			}
			reserveTime = sendDate.concat(sendHour).concat(sendMinute).concat("00");
		}
		csmsMngVO.setReserveTime(reserveTime);

		String msgComment = csmsMngVO.getMsgComment();

		if("Y".equals(SMS_080_ADD)) {
			msgComment = msgComment.concat("수신거부:").concat(rejectReceiveNo);
		}
		
		if("Y".equals(SMS_ADD_ADD)) {
			msgComment = "[광고] ".concat(msgComment);
		}
		csmsMngVO.setMsgComment(msgComment);
		
		String smsJobNo = smsJobNoGnrService.getNextStringId();
		csmsMngVO.setSmsJobNo(smsJobNo);
		
		
		////////////
		csmsMngDAO.regiSmsSendLog(csmsMngVO);

		
		///////////
		csmsMngDAO.regiSmsJob(csmsMngVO);
		
		
		//////////
		if ("SMS".equals(msgType)) {
			csmsMngDAO.updtSmsSendLog(csmsMngVO);
		} else {
			csmsMngDAO.updtMmsSendLog(csmsMngVO);
		}
		
		
		
		//////////
		if ("SMS".equals(msgType)) {
			csmsMngDAO.regiAddSmsSendLog(csmsMngVO);
			csmsMngDAO.regiSmsSend(csmsMngVO);//cnt = dao.executeUpdate("Comm.regiSmsSend", reqMap);
		} else {
			csmsMngDAO.regiMmsSend(csmsMngVO);//cnt = dao.executeUpdate("Comm.regiMmsSend", reqMap);
		}
		
		csmsMngDAO.updtSmsJobSum(csmsMngVO);//cnt = dao.executeUpdate("Comm.updtSmsJobSum", reqMap);  		
    }



}
