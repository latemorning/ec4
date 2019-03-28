package egovframework.ec4.cmm.csms.web;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.ec4.cmm.csms.service.EC4CSmsMngService;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.ResponseWrapperVO;
import egovframework.ec4.cmm.web.EC4ComIndexController;
import egovframework.ec4.call.inbd.service.CnsltInBoundMngVO;
import egovframework.ec4.call.inbd.web.EC4CnsltInBoundMngController;
import egovframework.ec4.cmm.cinfo.service.CstmrIntgrMngVO;
import egovframework.ec4.cmm.csms.service.CSmsMngVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;

/**
 * 상담원에 관한 controller 클래스를 정의한다.
 * @author 최재중
 * @since 2018.04.26
 * @version 1.0
 * @see
 *
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2018.04.26  최재중          최초 생성
 *
 * </pre>
 */


@Controller
@SessionAttributes(types=SessionVO.class)
public class EC4CSmsMngController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EC4CSmsMngController.class);

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "csmsMngService")
    private EC4CSmsMngService csmsMngService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Autowired
	private DefaultBeanValidator beanValidator;

    @Resource(name = "EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

    /** ID Generation */
    @Resource(name = "ec4SMSJobNoIdGnrService")
    private EgovIdGnrService smsJobNoGnrService;

    

    /**
	 * SMS전송팝업화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/cmm/csms/csmsPop.do")
    public String openEC4CSmsPop(@ModelAttribute("csmsMngVO") CSmsMngVO csmsMngVO, @ModelAttribute("popUpMngVO") CnsltInBoundMngVO cnsltInBoundMngVO, ModelMap model)
            throws Exception {

        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        csmsMngVO.setRegister(loginVO.getUniqId());
        csmsMngVO.setUpdusr(loginVO.getUniqId());
        
        
        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();
        
        
        codeVO.setCodeId("THOUR");
        List<CmmnDetailCode> hourList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("hourList", hourList);

        codeVO.setCodeId("TMINUTE");
        List<CmmnDetailCode> minuteList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("minuteList", minuteList);
        
        model.addAttribute("sendHour", "");
        model.addAttribute("sendMinute", "");
        
        
        LOGGER.debug("EC4CSmsMngController SMS전송 popup is called ");
        return "egovframework/ec4/cmm/csms/EC4CSmsPop";
    }







    /**
	 * SMS발송 접수 저장한다
	 * @param CSmsMngVO csmsMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping("/ec4/cmm/csms/EC4RegiSendSms.do")
    public @ResponseBody String EC4RegiSendSms(@ModelAttribute("csmsMngVO") CSmsMngVO csmsMngVO, 
    											BindingResult bindingResult, 
    											@RequestParam Map commandMap, 
    											ModelMap model) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	    String today = EgovDateUtil.getToday();
        String toYy = today.substring(0,4);
        String toMm = today.substring(4,6);
        String toDt = today.substring(6,8);
        
        String toTime = "";
		String pattern = "HH:mm:ss.SSS";
		SimpleDateFormat sdfCurrent = new SimpleDateFormat(pattern, Locale.KOREA);
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		toTime = sdfCurrent.format(ts.getTime());
		
		


        
        //System.out.println("isAuthenticated["+isAuthenticated+"]");
        if (isAuthenticated) {
        	//System.out.println("EgovDoubleSubmitHelper.checkAndSaveToken()["+EgovDoubleSubmitHelper.checkAndSaveToken()+"]");
            //if (EgovDoubleSubmitHelper.checkAndSaveToken()) {


                beanValidator.validate(csmsMngVO, bindingResult);

                // 폼오류
                //System.out.println("bindingResult.hasErrors()["+bindingResult.hasErrors()+"]");
                if (bindingResult.hasErrors()) {
                	
                }
                
                csmsMngVO.setUserId(loginVO.getUniqId());
                //sms발송 단건등록
        		csmsMngService.smsSendAllNotMulti(csmsMngVO);

                wrapperVO.setSuccess(true);
                wrapperVO.setMessage(egovMessageSource.getMessage("success.common.insert"));

            } else {

                wrapperVO.setSuccess(false);
                wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
            }
            
            return wrapperVO.toJson();
    }







    /**
	 * 이모티콘 저장한다
	 * @param CSmsMngVO csmsMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping("/ec4/cmm/csms/EC4RegiSmsEmoticon.do")
    public @ResponseBody String EC4RegiSmsEmoticon(@ModelAttribute("csmsMngVO") CSmsMngVO csmsMngVO, 
    											BindingResult bindingResult, 
    											@RequestParam Map commandMap, 
    											ModelMap model) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	    String today = EgovDateUtil.getToday();
        String toYy = today.substring(0,4);
        String toMm = today.substring(4,6);
        String toDt = today.substring(6,8);
        
        String toTime = "";
		String pattern = "HH:mm:ss.SSS";
		SimpleDateFormat sdfCurrent = new SimpleDateFormat(pattern, Locale.KOREA);
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		toTime = sdfCurrent.format(ts.getTime());
		
		


        
        //System.out.println("isAuthenticated["+isAuthenticated+"]");
        if (isAuthenticated) {
        	//System.out.println("EgovDoubleSubmitHelper.checkAndSaveToken()["+EgovDoubleSubmitHelper.checkAndSaveToken()+"]");
            //if (EgovDoubleSubmitHelper.checkAndSaveToken()) {


                beanValidator.validate(csmsMngVO, bindingResult);

                // 폼오류
                //System.out.println("bindingResult.hasErrors()["+bindingResult.hasErrors()+"]");
                if (bindingResult.hasErrors()) {
                	
                }
                
                csmsMngVO.setUserId(loginVO.getUniqId());
                //이모티콘 등록
        		csmsMngService.regiSmsEmoticon(csmsMngVO);

                wrapperVO.setSuccess(true);
                wrapperVO.setMessage(egovMessageSource.getMessage("success.common.insert"));

            } else {

                wrapperVO.setSuccess(false);
                wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
            }
            
            return wrapperVO.toJson();
    }




    
    
    
    



}
