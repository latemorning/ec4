package egovframework.ec4.call.outbd.web;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.ec4.call.outbd.service.EC4CallScriptMngService;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.EC4WebUtil;
import egovframework.ec4.cmm.service.ResponseWrapperVO;
import egovframework.ec4.call.outbd.service.CallScriptMngVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;

/**
 * 콜스크립트설정에 관한 controller 클래스를 정의한다.
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
public class EC4CallScriptMngController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

    @Resource(name = "callScriptMngService")
    private EC4CallScriptMngService callScriptMngService;

    /** ID Generation */
    @Resource(name = "ec4CallScriptIdGnrService")
    private EgovIdGnrService callScriptIdGnrService;

    /** ID Generation */
    @Resource(name = "ec4CallQuestIdGnrService")
    private EgovIdGnrService callQuestIdGnrService;

    /** ID Generation */
    @Resource(name = "ec4CallAnswerIdGnrService")
    private EgovIdGnrService callAnswerIdGnrService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Autowired
	private DefaultBeanValidator beanValidator;

    @Resource(name = "ec4WebUtil")
    private EC4WebUtil ec4WebUtil;


    /**
	 * 콜스크립트설정 화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/outbd/callScriptMng.do")
    public String openEC4CallScriptMng(@ModelAttribute("searchVO") CmmnDetailCode searchVO, @ModelAttribute("callScriptMngVO") CallScriptMngVO callScriptMngVO, ModelMap model)
            throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        // 콜구분
        codeVO.setCodeId("CALLSCRIPT");
        List<CmmnDetailCode> scriptList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("scriptList", scriptList);

        
        List<CmmnDetailCode> scriptTitleList = callScriptMngService.selectScriptTitleComboList(callScriptMngVO);
        model.addAttribute("scriptTitleList", scriptTitleList);
        
        model.addAttribute("scriptIdText", egovMessageSource.getMessage("callScript.scriptCd"));
        model.addAttribute("questIdText", egovMessageSource.getMessage("callScript.questCd"));
        model.addAttribute("ansrIdText", egovMessageSource.getMessage("callScript.ansrCd"));
        
        
        return "egovframework/ec4/call/outbd/EC4CallScriptMng";
    }


    /**
     * 콜스크립트 등록 팝업
     *
     * @param searchVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/outcall/callScriptMngRegPopup.do") 
    public String callScriptMngRegPopup(@ModelAttribute("popUpScriptMngVO") CallScriptMngVO callScriptMngVO, ModelMap model) throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();


        // 스크립트구분
        codeVO.setCodeId("CALLSCRIPT");
        List<CmmnDetailCode> scriptList = cmmUseService.selectCmmCodeDetail(codeVO);

        model.addAttribute("scriptList", scriptList);
        
        return "egovframework/ec4/call/outbd/outcall/EC4CallScriptMngRegPopup";
    }


    /**
     * 콜스크립트 등록 액션
     *
     * @param callScriptMngVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/insertCallScript.do")
    public @ResponseBody String insertCallScript(@ModelAttribute("popUpScriptMngVO") CallScriptMngVO callScriptMngVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        //System.out.println("=========["+callScriptMngVO.toString());
        //System.out.println("##################################["+callScriptMngVO.getScriptKnd());
        //System.out.println("##################################("+callScriptMngVO.getScriptCd());

        if (isAuthenticated) {
        	
            beanValidator.validate(callScriptMngVO, bindingResult);
            
            if (bindingResult.hasErrors()) {
            	
                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {
            	
            	String callScriptCd = callScriptIdGnrService.getNextStringId();
            	callScriptMngVO.setScriptCd(callScriptCd);
            	callScriptMngVO.setRegister(loginVO.getUniqId());
            	callScriptMngVO.setUpdusr(loginVO.getUniqId());
            	
            	callScriptMngService.insertCallScript(callScriptMngVO);
                wrapperVO.setSuccess(true);
                wrapperVO.setMessage(egovMessageSource.getMessage("success.common.insert"));

            }
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }


    /**
     * 콜스크립트 수정 팝업
     *
     * @param searchVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/outcall/callScriptMngModPopup.do") 
    public String callScriptMngModPopup(@ModelAttribute("popUpScriptMngVO") CallScriptMngVO callScriptMngVO, ModelMap model) throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();


        // 스크립트구분
        codeVO.setCodeId("CALLSCRIPT");
        List<CmmnDetailCode> scriptList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("scriptList", scriptList);
        
        callScriptMngVO.setValuesFromEgovMap(callScriptMngService.selectCallScriptMod(callScriptMngVO));

        return "egovframework/ec4/call/outbd/outcall/EC4CallScriptMngModPopup";
    }


    /**
     * 콜스크립트 수정 액션
     *
     * @param callScriptMngVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/updateCallScript.do")
    public @ResponseBody String updateCallScript(@ModelAttribute("popUpScriptMngVO") CallScriptMngVO callScriptMngVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            beanValidator.validate(callScriptMngVO, bindingResult);

            if (bindingResult.hasErrors()) {

                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {


            	callScriptMngVO.setRegister(loginVO.getUniqId());
            	callScriptMngVO.setUpdusr(loginVO.getUniqId());
            	
            	callScriptMngService.updateCallScript(callScriptMngVO);

                wrapperVO.setSuccess(true);
                wrapperVO.setMessage(egovMessageSource.getMessage("success.common.update"));
            }
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }


    /**
     * 콜스크립트 삭제
     *
     * @param callScriptMngVO
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/call/outbd/deleteCallScript.do")
    public @ResponseBody String deleteCallScript(@ModelAttribute("callScriptMngVO") CallScriptMngVO callScriptMngVO) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

        	callScriptMngVO.setRegister(loginVO.getUniqId());
        	callScriptMngVO.setUpdusr(loginVO.getUniqId());
        	
        	callScriptMngService.deleteCallScript(callScriptMngVO);

            wrapperVO.setSuccess(true);
            wrapperVO.setMessage(egovMessageSource.getMessage("success.common.delete"));
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }



    /**
	 * 목록을 조회한다
	 * @param CallScriptMngVO callScriptMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/outbd/selectCallScriptList.do")
    public @ResponseBody String selectCallScriptList(@ModelAttribute("searchVO") CallScriptMngVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        ArrayList<String> authList = (ArrayList<String>)EgovUserDetailsHelper.getAuthorities();

        if (isAuthenticated) {

            if (authList.contains("ROLE_ADMIN")) {

                searchVO.setRoleInfo("ROLE_ADMIN");
            } else if (authList.contains("ROLE_MANAGER")) {

                searchVO.setRoleInfo("ROLE_MANAGER");                // 상담관리자
            } else if (authList.contains("ROLE_COUNSELLER")) {

                searchVO.setRoleInfo("ROLE_COUNSELLER");             // 상담사
            }

            searchVO.setUniqId(loginVO.getUniqId());
        }

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));


    	//System.out.println("2222222222222222222222222222222222222222222222222222222222");

        int totalCount = 0;
        ArrayList<EgovMap> callScriptList = new ArrayList<EgovMap>();
    	
        //if (StringUtils.isNotBlank(searchVO.getSearchParntsCodeId())) {
        	callScriptList = callScriptMngService.selectCallScriptList(searchVO);
        	totalCount = callScriptMngService.selectCallScriptListCnt(searchVO);
            model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	//System.out.println("11111111111111111111111111111111111111111111111111111111111");
        //}

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(callScriptList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    



    /**
     * 질문스크립트 등록 팝업
     *
     * @param searchVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/outcall/callQuestMngRegPopup.do") 
    public String callQuestMngRegPopup(@ModelAttribute("popUpQuestMngVO") CallScriptMngVO callScriptMngVO, ModelMap model) throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();


        // 콜스크립트구분
        codeVO.setCodeId("CALLSCRIPT");
        List<CmmnDetailCode> scriptList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("scriptList", scriptList);


        // 질문스크립트유형  객관식/주관식
        codeVO.setCodeId("COM018");
        List<CmmnDetailCode> questTypeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("questTypeList", questTypeList);
        
                
        
        //call 스크립트 LOAD
        callScriptMngVO.setValuesFromEgovMap(callScriptMngService.selectCallScriptMod(callScriptMngVO));
        
        return "egovframework/ec4/call/outbd/outcall/EC4CallQuestMngRegPopup";
    }


    /**
     * 질문스크립트 등록 액션
     *
     * @param callScriptMngVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/insertCallQuest.do")
    public @ResponseBody String insertCallQuest(@ModelAttribute("popUpQuestMngVO") CallScriptMngVO callScriptMngVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        //System.out.println("=========["+callScriptMngVO.toString());
        //System.out.println("##################################["+callScriptMngVO.getScriptKnd());
        //System.out.println("##################################("+callScriptMngVO.getScriptCd());

        if (isAuthenticated) {
        	
            beanValidator.validate(callScriptMngVO, bindingResult);
            
            if (bindingResult.hasErrors()) {
            	
                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {

            	String callQuestCd = callQuestIdGnrService.getNextStringId();
            	callScriptMngVO.setQuestCd(callQuestCd);
            	callScriptMngVO.setRegister(loginVO.getUniqId());
            	callScriptMngVO.setUpdusr(loginVO.getUniqId());
            	
            	callScriptMngService.insertCallQuest(callScriptMngVO);
                wrapperVO.setSuccess(true);
                wrapperVO.setMessage(egovMessageSource.getMessage("success.common.insert"));

            }
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }


    /**
     * 질문스크립트 수정 팝업
     *
     * @param searchVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/outcall/callQuestMngModPopup.do") 
    public String callQuestMngModPopup(@ModelAttribute("popUpQuestMngVO") CallScriptMngVO callScriptMngVO, ModelMap model) throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();


        // 스크립트구분
        codeVO.setCodeId("CALLSCRIPT");
        List<CmmnDetailCode> scriptList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("scriptList", scriptList);


        // 질문스크립트유형  객관식/주관식
        codeVO.setCodeId("COM018");
        List<CmmnDetailCode> questTypeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("questTypeList", questTypeList);
        
        callScriptMngVO.setValuesFromEgovMap(callScriptMngService.selectCallQuestMod(callScriptMngVO));

        return "egovframework/ec4/call/outbd/outcall/EC4CallQuestMngModPopup";
    }


    /**
     * 질문스크립트 수정 액션
     *
     * @param callScriptMngVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/updateCallQuest.do")
    public @ResponseBody String updateCallQuest(@ModelAttribute("popUpQuestMngVO") CallScriptMngVO callScriptMngVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            beanValidator.validate(callScriptMngVO, bindingResult);

            if (bindingResult.hasErrors()) {

                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {


            	callScriptMngVO.setRegister(loginVO.getUniqId());
            	callScriptMngVO.setUpdusr(loginVO.getUniqId());
            	
            	callScriptMngService.updateCallQuest(callScriptMngVO);

                wrapperVO.setSuccess(true);
                wrapperVO.setMessage(egovMessageSource.getMessage("success.common.update"));
            }
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }


    /**
     * 질문스크립트 삭제
     *
     * @param callScriptMngVO
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/call/outbd/deleteCallQuest.do")
    public @ResponseBody String deleteCallQuest(@ModelAttribute("callScriptMngVO") CallScriptMngVO callScriptMngVO) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

        	callScriptMngVO.setRegister(loginVO.getUniqId());
        	callScriptMngVO.setUpdusr(loginVO.getUniqId());
        	
        	callScriptMngService.deleteCallQuest(callScriptMngVO);

            wrapperVO.setSuccess(true);
            wrapperVO.setMessage(egovMessageSource.getMessage("success.common.delete"));
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }



    /**
	 * 목록을 조회한다
	 * @param CallScriptMngVO callScriptMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/outbd/selectCallQuestList.do")
    public @ResponseBody String selectCallQuestList(@ModelAttribute("searchVO") CallScriptMngVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        ArrayList<String> authList = (ArrayList<String>)EgovUserDetailsHelper.getAuthorities();

        if (isAuthenticated) {

            if (authList.contains("ROLE_ADMIN")) {

                searchVO.setRoleInfo("ROLE_ADMIN");
            } else if (authList.contains("ROLE_MANAGER")) {

                searchVO.setRoleInfo("ROLE_MANAGER");                // 상담관리자
            } else if (authList.contains("ROLE_COUNSELLER")) {

                searchVO.setRoleInfo("ROLE_COUNSELLER");             // 상담사
            }

            searchVO.setUniqId(loginVO.getUniqId());
        }

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));


    	//System.out.println("333333333333333333333333333333333333333333333333333");
    	//System.out.println("(((((((((((((((((((("+searchVO.toString()+")))))))))))))");

        int totalCount = 0;
        ArrayList<EgovMap> callQuestList = new ArrayList<EgovMap>();
    	
        if (StringUtils.isNotBlank(searchVO.getSearchScriptCd())) {
        	callQuestList = callScriptMngService.selectCallQuestList(searchVO);
        	totalCount = callScriptMngService.selectCallQuestListCnt(searchVO);
            model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	//System.out.println("11111111111111111111111111111111111111111111111111111111111");
        }

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(callQuestList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    



    /**
     * 답변스크립트 등록 팝업
     *
     * @param searchVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/outcall/callAnswerMngRegPopup.do") 
    public String callAnswerMngRegPopup(@ModelAttribute("popUpAnswerMngVO") CallScriptMngVO callScriptMngVO, ModelMap model) throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();


        // 스크립트구분
        codeVO.setCodeId("CALLSCRIPT");
        List<CmmnDetailCode> scriptList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("scriptList", scriptList);


        // 질문스크립트유형  객관식/주관식
        codeVO.setCodeId("COM018");
        List<CmmnDetailCode> questTypeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("questTypeList", questTypeList);
        
                
        
        //call 스크립트 LOAD
        callScriptMngVO.setValuesFromEgovMap(callScriptMngService.selectCallQuestMod(callScriptMngVO));
        
        return "egovframework/ec4/call/outbd/outcall/EC4CallAnswerMngRegPopup";
    }


    /**
     * 답변스크립트 등록 액션
     *
     * @param callScriptMngVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/insertCallAnswer.do")
    public @ResponseBody String insertCallAnswer(@ModelAttribute("popUpAnswerMngVO") CallScriptMngVO callScriptMngVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        //System.out.println("=========["+callScriptMngVO.toString());
        //System.out.println("##################################["+callScriptMngVO.getScriptKnd());
        //System.out.println("##################################("+callScriptMngVO.getScriptCd());

        if (isAuthenticated) {
        	
            beanValidator.validate(callScriptMngVO, bindingResult);
            
            if (bindingResult.hasErrors()) {
            	
                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {

            	String callAnswerCd = callAnswerIdGnrService.getNextStringId();
            	callScriptMngVO.setAnsrCd(callAnswerCd);
            	callScriptMngVO.setRegister(loginVO.getUniqId());
            	callScriptMngVO.setUpdusr(loginVO.getUniqId());
            	
            	callScriptMngService.insertCallAnswer(callScriptMngVO);
                wrapperVO.setSuccess(true);
                wrapperVO.setMessage(egovMessageSource.getMessage("success.common.insert"));

            }
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }


    /**
     * 답변스크립트 수정 팝업
     *
     * @param searchVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/outcall/callAnswerMngModPopup.do") 
    public String callAnswerMngModPopup(@ModelAttribute("popUpAnswerMngVO") CallScriptMngVO callScriptMngVO, ModelMap model) throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();


        // 스크립트구분
        codeVO.setCodeId("CALLSCRIPT");
        List<CmmnDetailCode> scriptList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("scriptList", scriptList);


        // 질문스크립트유형  객관식/주관식
        codeVO.setCodeId("COM018");
        List<CmmnDetailCode> questTypeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("questTypeList", questTypeList);
        
        callScriptMngVO.setValuesFromEgovMap(callScriptMngService.selectCallAnswerMod(callScriptMngVO));

        return "egovframework/ec4/call/outbd/outcall/EC4CallAnswerMngModPopup";
    }


    /**
     * 답변스크립트 수정 액션
     *
     * @param callScriptMngVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/updateCallAnswer.do")
    public @ResponseBody String updateCallAnswer(@ModelAttribute("popUpAnswerMngVO") CallScriptMngVO callScriptMngVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            beanValidator.validate(callScriptMngVO, bindingResult);

            if (bindingResult.hasErrors()) {

                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {


            	callScriptMngVO.setRegister(loginVO.getUniqId());
            	callScriptMngVO.setUpdusr(loginVO.getUniqId());
            	
            	callScriptMngService.updateCallAnswer(callScriptMngVO);

                wrapperVO.setSuccess(true);
                wrapperVO.setMessage(egovMessageSource.getMessage("success.common.update"));
            }
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }


    /**
     * 답변스크립트 삭제
     *
     * @param callScriptMngVO
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/call/outbd/deleteCallAnswer.do")
    public @ResponseBody String deleteCallAnswer(@ModelAttribute("callScriptMngVO") CallScriptMngVO callScriptMngVO) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

        	callScriptMngVO.setRegister(loginVO.getUniqId());
        	callScriptMngVO.setUpdusr(loginVO.getUniqId());
        	
        	callScriptMngService.deleteCallAnswer(callScriptMngVO);

            wrapperVO.setSuccess(true);
            wrapperVO.setMessage(egovMessageSource.getMessage("success.common.delete"));
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }



    /**
	 * 목록을 조회한다
	 * @param CallScriptMngVO callScriptMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/outbd/selectCallAnswerList.do")
    public @ResponseBody String selectCallAnswerList(@ModelAttribute("searchVO") CallScriptMngVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        ArrayList<String> authList = (ArrayList<String>)EgovUserDetailsHelper.getAuthorities();

        if (isAuthenticated) {

            if (authList.contains("ROLE_ADMIN")) {

                searchVO.setRoleInfo("ROLE_ADMIN");
            } else if (authList.contains("ROLE_MANAGER")) {

                searchVO.setRoleInfo("ROLE_MANAGER");                // 상담관리자
            } else if (authList.contains("ROLE_COUNSELLER")) {

                searchVO.setRoleInfo("ROLE_COUNSELLER");             // 상담사
            }

            searchVO.setUniqId(loginVO.getUniqId());
        }

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));


    	//System.out.println("444444444444444444444444444444444444444444444444444444444");

        int totalCount = 0;
        ArrayList<EgovMap> callAnswerList = new ArrayList<EgovMap>();
    	
        if (StringUtils.isNotBlank(searchVO.getSearchQuestCd())) {
        	callAnswerList = callScriptMngService.selectCallAnswerList(searchVO);
        	totalCount = callScriptMngService.selectCallAnswerListCnt(searchVO);
            model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	//System.out.println("11111111111111111111111111111111111111111111111111111111111");
        }

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(callAnswerList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }
    

}
