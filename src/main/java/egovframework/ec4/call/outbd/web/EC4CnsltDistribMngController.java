package egovframework.ec4.call.outbd.web;


import java.util.ArrayList;
import java.util.List;

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
import egovframework.ec4.call.outbd.service.EC4CnsltDistribMngService;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.EC4WebUtil;
import egovframework.ec4.cmm.service.ResponseWrapperVO;
import egovframework.ec4.call.cnslt.service.CnsltntMngVO;
import egovframework.ec4.call.cnslt.service.EC4CnsltntMngService;
import egovframework.ec4.call.outbd.service.CallScriptMngVO;
import egovframework.ec4.call.outbd.service.CnsltDistribMngVO;
import egovframework.ec4.call.outbd.service.EC4CallScriptMngService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;

/**
 * 아웃바운드콜상담 대상고객정보 상담에 관한 controller 클래스를 정의한다.
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
public class EC4CnsltDistribMngController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EC4CnsltDistribMngController.class);

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "cnsltDistribMngService")
    private EC4CnsltDistribMngService cnsltDistribMngService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Autowired
	private DefaultBeanValidator beanValidator;

    @Resource(name = "EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

    @Resource(name = "ec4WebUtil")
    private EC4WebUtil ec4WebUtil;

    @Resource(name = "callScriptMngService")
    private EC4CallScriptMngService callScriptMngService;

    @Resource(name = "cnsltntMngService")
    private EC4CnsltntMngService cnsltntMngService;


    /**
	 * 아웃바운드콜상담 상담원분배 상담 화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/outbd/cnsltDistribMng.do")
    public String openEC4CnsltDistribMng(@ModelAttribute("searchCnsltDistribMngVO") CnsltDistribMngVO cnsltDistribMngVO, ModelMap model)
            throws Exception {


        LOGGER.debug("EC4CnsltDistribMng 아웃바운드콜상담 상담원분배 is called ");

        //model.addAttribute("callbackClass", searchVO.getCallbackClass());
        
        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();
    	

        // 콜진행상태
        codeVO.setCodeId("CLSTTCD");
        List<CmmnDetailCode> callStateList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("callStateList", callStateList);
    	

        // 콜배정상태
        codeVO.setCodeId("CALLASIGN");
        List<CmmnDetailCode> callAsignList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("callAsignList", callAsignList);
    	

        // 콜구분
        codeVO.setCodeId("CALLCOLECTGB");
        List<CmmnDetailCode> callColectGbList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("callColectGbList", callColectGbList);

        // 스크립트구분
        codeVO.setCodeId("CALLSCRIPT");
        List<CmmnDetailCode> scriptList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("scriptList", scriptList);
        
        // 스크립트제목
        CallScriptMngVO callScriptMngVO = new CallScriptMngVO();
        List<CmmnDetailCode> scriptTitleList = callScriptMngService.selectScriptTitleComboList(callScriptMngVO);
        model.addAttribute("scriptTitleList", scriptTitleList);
        
        
        //담당자
        CnsltntMngVO cnsltntMngVO = new CnsltntMngVO();
        List<CmmnDetailCode> callCnsltList = cnsltntMngService.selectCnsltntComboList(cnsltntMngVO);
        model.addAttribute("callCnsltList", callCnsltList);

        // 배분저장구분
        codeVO.setCodeId("INSTASIGNKND");
        List<CmmnDetailCode> instAsignKndList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("instAsignKndList", instAsignKndList);
        
        
        
        
        
        return "egovframework/ec4/call/outbd/EC4CnsltDistribMng";
    }



    
    
    
    

    /**
	 * 목록을 조회한다
	 * @param CnsltDistribMngVO cnsltDistribMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/outbd/selectEC4CnsltDistribMng.do")
    public @ResponseBody String selectEC4CnsltDistribMng(@ModelAttribute("searchCnsltDistribMngVO") CnsltDistribMngVO searchVO, ModelMap model, HttpServletRequest request)
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

        //System.out.println("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL["+searchVO.getCnsltTyCn()+"]");
        if(!"".equals(searchVO.getCnsltTyCn())){
        	String [] aryTypeCn = searchVO.getCnsltTyCn().split("/");
        	String [] aryTypeCnCode = searchVO.getCnsltTyCnCode().split("/");
        	String sTypeCn = "''";
        	String sTypeCnCode = "''";
        	for(int i=0; i<aryTypeCn.length;i++) {
        		//sTypeCn += ","+UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCn[i]));
        		sTypeCn += ",'"+UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCn[i]))+"'";
        		sTypeCnCode += ",'"+UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCnCode[i]))+"'";
        	}
        	searchVO.setSearchCnsltTyCn(sTypeCn);
        	searchVO.setSearchCnsltTyCnCode(sTypeCnCode);
        }
        ArrayList<EgovMap> cnsltDistribList = cnsltDistribMngService.searchCnsltDistribList(searchVO);
        int totalCount = cnsltDistribMngService.searchCnsltDistribListCnt(searchVO);
        //System.out.println("uuuuuuuuuuuuuuuuuuuuuuuuuuuuu["+searchVO.toString()+"]");        
        
        
        /*int cnsltTyCnt=0;
        ArrayList<EgovMap> cnsltDistribList = null;
        if(!"".equals(searchVO.getSearchCnsltTyCnCode())){
            String [] aryTypeCnCode = searchVO.getSearchCnsltTyCnCode().split("/");
            String sTypeCnCode = "";
            for(int i=0; i<aryTypeCnCode.length;i++) {
                searchVO.setSearchCnsltTyCnCode(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(aryTypeCnCode[i])));
                cnsltDistribList.addAll(cnsltDistribMngService.searchCnsltDistribList(searchVO));
                cnsltTyCnt++;
            }
        }
        int totalCount = cnsltTyCnt;*/        
        
        
        
        
        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(cnsltDistribList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }
    
    




    /**
     * 리스트 대상고객정보 등록 액션
     *
     * @param cnsltDistribMngVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/insertCnsltDistrib.do")
    public @ResponseBody String insertCnsltDistrib(@ModelAttribute("cnsltDistribMngVO") CnsltDistribMngVO cnsltDistribMngVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        //System.out.println("=========["+cnsltDistribMngVO.toString());
        //System.out.println("##################################["+cnsltDistribMngVO.getCnsltUserId());

        if (isAuthenticated) {
        	
            beanValidator.validate(cnsltDistribMngVO, bindingResult);
            
            if (bindingResult.hasErrors()) {
            	
                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {

            	cnsltDistribMngVO.setRegister(loginVO.getUniqId());
            	cnsltDistribMngVO.setUpdusr(loginVO.getUniqId());
            	
            	cnsltDistribMngService.insertCnsltDistrib(cnsltDistribMngVO);
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
     * 리스트 대상고객정보 등록 액션
     *
     * @param cnsltDistribMngVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/updateCnsltAsign.do")
    public @ResponseBody String updateCnsltAsign(@ModelAttribute("cnsltDistribMngVO") CnsltDistribMngVO cnsltDistribMngVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        //System.out.println("=========["+cnsltDistribMngVO.toString());
        //System.out.println("##################################["+cnsltDistribMngVO.getCnsltUserId());

        if (isAuthenticated) {
        	
            beanValidator.validate(cnsltDistribMngVO, bindingResult);
            
            if (bindingResult.hasErrors()) {
            	
                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {

            	cnsltDistribMngVO.setRegister(loginVO.getUniqId());
            	cnsltDistribMngVO.setUpdusr(loginVO.getUniqId());
            	
            	cnsltDistribMngService.updateCnsltAsign(cnsltDistribMngVO);
                wrapperVO.setSuccess(true);
                wrapperVO.setMessage(egovMessageSource.getMessage("success.common.insert"));

            }
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }

}
