package egovframework.ec4.cmm.cinfo.web;


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
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.ec4.cmm.cinfo.service.EC4CstmrIntgrMngService;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.EC4WebUtil;
import egovframework.ec4.cmm.service.ResponseWrapperVO;
import egovframework.ec4.cmm.web.EC4ComIndexController;
import egovframework.ec4.call.inbd.service.CnsltInBoundMngVO;
import egovframework.ec4.call.inbd.web.EC4CnsltInBoundMngController;
import egovframework.ec4.cmm.cinfo.service.CstmrIntgrMngVO;
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
public class EC4CstmrIntgrMngController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EC4CstmrIntgrMngController.class);

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "cstmrIntgrMngService")
    private EC4CstmrIntgrMngService cstmrIntgrMngService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Autowired
	private DefaultBeanValidator beanValidator;

    @Resource(name = "EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

    @Resource(name = "ec4WebUtil")
    private EC4WebUtil ec4WebUtil;

    

    /**
	 * 고객정보조회팝업화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/cmm/cinfo/cstmrIntgrPop.do")
    public String openEC4CstmrIntgrPop(@ModelAttribute("cstmrIntgrMngVO") CstmrIntgrMngVO cstmrIntgrMngVO, @ModelAttribute("popUpMngVO") CnsltInBoundMngVO cnsltInBoundMngVO, ModelMap model)
            throws Exception {

        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        cstmrIntgrMngVO.setRegister(loginVO.getUniqId());
        cstmrIntgrMngVO.setUpdusr(loginVO.getUniqId());
        
        int totalCount = cstmrIntgrMngService.selectCstmrIntgrMngListCnt(cstmrIntgrMngVO);
        
        LOGGER.debug("EC4CstmrIntgrMngController 고객조회 popup is called ");
        if(totalCount > 0){
            return "egovframework/ec4/cmm/cinfo/EC4CstmrIntgrPop";
        }else{
        	
        	//EC4CnsltInBoundMngController.popupCnsltInBoundReg  해당 호출함수 내 로직과 동일해야한다. (인바운드 상담내용저장화면)
        	
        	cnsltInBoundMngVO.setCnsltIncallNo("");
        	cnsltInBoundMngVO.setSelectStyle("single");
        	cnsltInBoundMngVO.setCallbackClass("callback");
        	cnsltInBoundMngVO.setHpno(cstmrIntgrMngVO.getHpno());
        	cnsltInBoundMngVO.setCstmrNm(cstmrIntgrMngVO.getCstmrNm());
        	cnsltInBoundMngVO.setEmailAdres(cstmrIntgrMngVO.getEmailAdres());
        	
            ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

            codeVO.setCodeId("VOCKND");
            List<CmmnDetailCode> rcptKndList = cmmUseService.selectCmmCodeDetail(codeVO);
            model.addAttribute("vocKndList", rcptKndList);
            
            codeVO.setCodeId("COM073");
            List<CmmnDetailCode> cstmrRelList = cmmUseService.selectCmmCodeDetail(codeVO);
            model.addAttribute("cstmrRelList", cstmrRelList);
            
            codeVO.setCodeId("CALLTYPE");
            List<CmmnDetailCode> callTypeList = cmmUseService.selectCmmCodeDetail(codeVO);
            model.addAttribute("callTypeList", callTypeList);
            
            codeVO.setCodeId("CNSLTRSLT");
            List<CmmnDetailCode> cnsltRsltList = cmmUseService.selectCmmCodeDetail(codeVO);
            model.addAttribute("cnsltRsltList", cnsltRsltList);
            
            codeVO.setCodeId("CNSLTKND");
            List<CmmnDetailCode> cnsltKndList = cmmUseService.selectCmmCodeDetail(codeVO);
            model.addAttribute("cnsltKndList", cnsltKndList);
            
            codeVO.setCodeId("VMCD");
            List<CmmnDetailCode> vmcdList = cmmUseService.selectCmmCodeDetail(codeVO);
            model.addAttribute("vmcdList", vmcdList);
            
            codeVO.setCodeId("VHCT");
            List<CmmnDetailCode> vhctList = cmmUseService.selectCmmCodeDetail(codeVO);
            model.addAttribute("vhctList", vhctList);

            codeVO.setCodeId("EMAILDMN");
            List<CmmnDetailCode> selectEmailDomainList = cmmUseService.selectCmmCodeDetail(codeVO);
            model.addAttribute("selectEmailDomainList", selectEmailDomainList);
            
            codeVO.setCodeId("CNSLTCUSTKND");
            List<CmmnDetailCode> cnsltCustKndList = cmmUseService.selectCmmCodeDetail(codeVO);
            model.addAttribute("cnsltCustKndList", cnsltCustKndList);

            return "egovframework/ec4/call/inbd/EC4CnsltInBoundRegNewCustPop";
        }
    }





    /**
	 * 목록을 조회한다
	 * @param MblMembInfoMngVO cstmrIntgrMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/cmm/cinfo/cstmrIntgrMngList.do")
    public @ResponseBody String cstmrIntgrMngList(@ModelAttribute("cstmrIntgrMngVO") CstmrIntgrMngVO cstmrIntgrMngVO,
    		                        ModelMap model, HttpServletRequest request)
            throws Exception {

        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

        // 정렬할 필드명 셋팅
    	cstmrIntgrMngVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + cstmrIntgrMngVO.getiSortCol_0()))));

        List<EgovMap> resultList = cstmrIntgrMngService.selectCstmrIntgrMngList(cstmrIntgrMngVO);
        int totalCount = cstmrIntgrMngService.selectCstmrIntgrMngListCnt(cstmrIntgrMngVO);

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(resultList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(cstmrIntgrMngVO.getsEcho());

        return wrapperVO.toJson();
    }




    
    
    


    /**
	 * 고객차량정보조회팝업화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/cmm/cinfo/cstmrCarPop.do")
    public String openEC4CstmrCarPop(@ModelAttribute("cstmrIntgrMngVO") CstmrIntgrMngVO cstmrIntgrMngVO, @ModelAttribute("popUpMngVO") CnsltInBoundMngVO cnsltInBoundMngVO, ModelMap model)
            throws Exception {

        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        cstmrIntgrMngVO.setRegister(loginVO.getUniqId());
        cstmrIntgrMngVO.setUpdusr(loginVO.getUniqId());
        
        LOGGER.debug("EC4CstmrIntgrMngController 고객차량조회 popup is called ");
        return "egovframework/ec4/cmm/cinfo/EC4CstmrCarPop";
    }
    

    /**
	 * 고객차량목록을 조회한다
	 * @param MblMembInfoMngVO cstmrIntgrMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/cmm/cinfo/cstmrCarList.do")
    public @ResponseBody String cstmrCarList(@ModelAttribute("cstmrIntgrMngVO") CstmrIntgrMngVO cstmrIntgrMngVO,
    		                        ModelMap model, HttpServletRequest request)
            throws Exception {

        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

        // 정렬할 필드명 셋팅
    	cstmrIntgrMngVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + cstmrIntgrMngVO.getiSortCol_0()))));

        List<EgovMap> resultList = cstmrIntgrMngService.selectCstmrCarList(cstmrIntgrMngVO);
        int totalCount = cstmrIntgrMngService.selectCstmrCarListCnt(cstmrIntgrMngVO);

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(resultList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(cstmrIntgrMngVO.getsEcho());

        return wrapperVO.toJson();
    }

    

    /**
	 * 긴급출동고객정보조회팝업화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/cmm/cinfo/cstmrIntgrCarSosPop.do")
    public String openEC4CstmrIntgrCarSosPop(@ModelAttribute("cstmrIntgrMngVO") CstmrIntgrMngVO cstmrIntgrMngVO, @ModelAttribute("popUpMngVO") CnsltInBoundMngVO cnsltInBoundMngVO, ModelMap model)
            throws Exception {

        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        cstmrIntgrMngVO.setRegister(loginVO.getUniqId());
        cstmrIntgrMngVO.setUpdusr(loginVO.getUniqId());
        
        int totalCount = cstmrIntgrMngService.selectCstmrIntgrMngListCnt(cstmrIntgrMngVO);
        
        LOGGER.debug("EC4CstmrIntgrMngController 긴급출동고객조회 popup is called ");
        return "egovframework/ec4/cmm/cinfo/EC4CstmrIntgrPop";
    }
    
    
    
    
    
    


    

    /**
	 * 기존고객정보조회팝업화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/cmm/cinfo/existCstmrSearchPop.do")
    public String openEC4ExistCstmrSearchPop(@ModelAttribute("cstmrIntgrMngVO") CstmrIntgrMngVO cstmrIntgrMngVO, @ModelAttribute("popUpMngVO") CnsltInBoundMngVO cnsltInBoundMngVO, ModelMap model)
            throws Exception {

        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        cstmrIntgrMngVO.setRegister(loginVO.getUniqId());
        cstmrIntgrMngVO.setUpdusr(loginVO.getUniqId());
        
        //int totalCount = cstmrIntgrMngService.selectCstmrIntgrMngListCnt(cstmrIntgrMngVO);
        
        LOGGER.debug("EC4CstmrIntgrMngController 기존고객조회 popup is called ");
        //if(totalCount > 0){
            return "egovframework/ec4/cmm/cinfo/EC4ExistCstmrSearchPop";
        //}else{
            //return "egovframework/ec4/cmm/cinfo/EC4CstmrIntgrPop";
        //}
    }
    

    /**
	 * 기존고객차량목록을 조회한다
	 * @param MblMembInfoMngVO cstmrIntgrMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/cmm/cinfo/existCstmrSearchList.do")
    public @ResponseBody String existCstmrSearchList(@ModelAttribute("cstmrIntgrMngVO") CstmrIntgrMngVO cstmrIntgrMngVO,
    		                        ModelMap model, HttpServletRequest request)
            throws Exception {

        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

        // 정렬할 필드명 셋팅
    	cstmrIntgrMngVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + cstmrIntgrMngVO.getiSortCol_0()))));

        List<EgovMap> resultList = cstmrIntgrMngService.existCstmrSearchList(cstmrIntgrMngVO);
        int totalCount = cstmrIntgrMngService.existCstmrSearchListCnt(cstmrIntgrMngVO);

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(resultList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(cstmrIntgrMngVO.getsEcho());

        return wrapperVO.toJson();
    }
    

    /**
	 * 고객소유차량목록을 조회한다
	 * @param MblMembInfoMngVO cstmrIntgrMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/cmm/cinfo/cstmrOwnerCarList.do")
    public @ResponseBody String cstmrOwnerCarList(@ModelAttribute("cstmrIntgrMngVO") CstmrIntgrMngVO cstmrIntgrMngVO,
    		                        ModelMap model, HttpServletRequest request)
            throws Exception {

        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

        // 정렬할 필드명 셋팅
    	cstmrIntgrMngVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + cstmrIntgrMngVO.getiSortCol_0()))));

        List<EgovMap> resultList = cstmrIntgrMngService.cstmrOwnerCarList(cstmrIntgrMngVO);
        int totalCount = cstmrIntgrMngService.cstmrOwnerCarListCnt(cstmrIntgrMngVO);

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(resultList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(cstmrIntgrMngVO.getsEcho());

        return wrapperVO.toJson();
    }





    /**
	 * 고객통합정보
	 * @param MblMembInfoMngVO cstmrIntgrMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/cmm/cinfo/cstmrIntgrMng.do")
    public String openEC4CstmrIntgrMng(@ModelAttribute("cstmrIntgrMngVO") CstmrIntgrMngVO cstmrIntgrMngVO, ModelMap model)
            throws Exception {

        LOGGER.debug("openEC4CstmrIntgrMng 고객통합정보 is called ");

        //model.addAttribute("callbackClass", searchVO.getCallbackClass());
        
        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        codeVO.setCodeId("CALLTYPE");
        List<CmmnDetailCode> callTypeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("callTypeList", callTypeList);
        
        codeVO.setCodeId("CNSLTRSLT");
        List<CmmnDetailCode> cnsltRsltList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("cnsltRsltList", cnsltRsltList);
        
        codeVO.setCodeId("CNSLTKND");
        List<CmmnDetailCode> cnsltKndList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("cnsltKndList", cnsltKndList);
        
        codeVO.setCodeId("VMCD");
        List<CmmnDetailCode> vmcdList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vmcdList", vmcdList);
        
        codeVO.setCodeId("VHCT");
        List<CmmnDetailCode> vhctList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vhctList", vhctList);    	
        
        
        return "egovframework/ec4/cmm/cinfo/EC4CstmrIntgrMng";
    }





    /**
	 * 고객통합정보 신규저장화면 OPEN
	 * @param MblMembInfoMngVO cstmrIntgrMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/cmm/cinfo/cstmrIntgrMngRegPopup.do")
    public String cstmrIntgrMngRegPopup(@ModelAttribute("popUpMngVO") CstmrIntgrMngVO cstmrIntgrMngVO, ModelMap model)
            throws Exception {

        LOGGER.debug("cstmrIntgrMngRegPopup 고객통합정보 is called ");

        //model.addAttribute("callbackClass", searchVO.getCallbackClass());
        
        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();
        
        codeVO.setCodeId("VMCD");
        List<CmmnDetailCode> vmcdList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vmcdList", vmcdList);
        
        codeVO.setCodeId("VHCT");
        List<CmmnDetailCode> vhctList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vhctList", vhctList);    	
        
        codeVO.setCodeId("EMAILDMN");
        List<CmmnDetailCode> selectEmailDomainList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("selectEmailDomainList", selectEmailDomainList);        
        
        
        return "egovframework/ec4/cmm/cinfo/EC4CstmrIntgrMngRegPopup";
    }


    /**
     * 고객통합정보 등록 액션
     *
     * @param CstmrIntgrMngVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cinfo/insertCstmrIntgrMng.do")
    public @ResponseBody String insertCstmrIntgrMng(@ModelAttribute("popUpMngVO") CstmrIntgrMngVO cstmrIntgrMngVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {
        	
            beanValidator.validate(cstmrIntgrMngVO, bindingResult);
            
            if (bindingResult.hasErrors()) {
            	
                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {

            	cstmrIntgrMngVO.setRegister(loginVO.getUniqId());
            	cstmrIntgrMngVO.setUpdusr(loginVO.getUniqId());
            	/* 신규등록 */
            	cstmrIntgrMngService.insertCstmrIntgrMngNew(cstmrIntgrMngVO);

    			

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
	 * 고객통합정보 수정화면 OPEN
	 * @param MblMembInfoMngVO cstmrIntgrMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/cmm/cinfo/cstmrIntgrMngModPopup.do")
    public String cstmrIntgrMngModPopup(@ModelAttribute("popUpMngVO") CstmrIntgrMngVO cstmrIntgrMngVO, ModelMap model)
            throws Exception {

        LOGGER.debug("cstmrIntgrMngModPopup 고객통합정보 is called ");

        //model.addAttribute("callbackClass", searchVO.getCallbackClass());
        
        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();
        
        codeVO.setCodeId("VMCD");
        List<CmmnDetailCode> vmcdList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vmcdList", vmcdList);
        
        codeVO.setCodeId("VHCT");
        List<CmmnDetailCode> vhctList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("vhctList", vhctList);
        
        codeVO.setCodeId("EMAILDMN");
        List<CmmnDetailCode> selectEmailDomainList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("selectEmailDomainList", selectEmailDomainList);
        
        
        // select
        cstmrIntgrMngVO.setValuesFromEgovMap(cstmrIntgrMngService.selectCstmrIntgrMngMod(cstmrIntgrMngVO));
        
        return "egovframework/ec4/cmm/cinfo/EC4CstmrIntgrMngModPopup";
    }


    /**
     * 고객통합정보 수정 액션
     *
     * @param CstmrIntgrMngVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cinfo/updateCstmrIntgrMng.do")
    public @ResponseBody String updateCstmrIntgrMng(@ModelAttribute("popUpMngVO") CstmrIntgrMngVO cstmrIntgrMngVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {
        	
            beanValidator.validate(cstmrIntgrMngVO, bindingResult);
            
            if (bindingResult.hasErrors()) {
            	
                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {

            	cstmrIntgrMngVO.setRegister(loginVO.getUniqId());
            	cstmrIntgrMngVO.setUpdusr(loginVO.getUniqId());
            	/* 수정 */
            	cstmrIntgrMngService.updateCstmrIntgrMng(cstmrIntgrMngVO);

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
     * 고객통합정보 삭제
     *
     * @param salesLeadRegMngVO
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/cmm/cinfo/deleteCstmrIntgrMng.do")
    public @ResponseBody String deleteCstmrIntgrMng(@ModelAttribute("cstmrIntgrMngVO") CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

        	cstmrIntgrMngVO.setRegister(loginVO.getUniqId());
        	cstmrIntgrMngVO.setUpdusr(loginVO.getUniqId());

        	//삭제
        	cstmrIntgrMngService.deleteCstmrIntgrMng(cstmrIntgrMngVO);

            wrapperVO.setSuccess(true);
            wrapperVO.setMessage(egovMessageSource.getMessage("success.common.delete"));
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }
    
    
    
    






    /**
	 * 고객SMS파일첨부 화면 OPEN
	 * @param MblMembInfoMngVO cstmrIntgrMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/cmm/cinfo/cstmrFileAttachMobile.do")
    public String cstmrFileAttachMobile(@ModelAttribute("popUpMngVO") CstmrIntgrMngVO cstmrIntgrMngVO, ModelMap model)
            throws Exception {

        LOGGER.debug("cstmrFileAttach 고객SMS파일첨부화면 is called ");


        
        return "egovframework/ec4/cmm/cinfo/EC4CstmrFileAttachMobilePop";
    }
    
    
    
    






    /**
	 * 고객 마케팅활용동의 화면 OPEN
	 * @param MblMembInfoMngVO cstmrIntgrMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/cmm/cinfo/cstmrMktAgreeMobile.do")
    public String cstmrMktAgreeMobile(@ModelAttribute("popUpMngVO") CstmrIntgrMngVO cstmrIntgrMngVO, ModelMap model)
            throws Exception {

        LOGGER.debug("cstmrMktAgreeMobile 고객 마케팅활용동의 화면 is called ");


        
        return "egovframework/ec4/cmm/cinfo/EC4CstmrMktAgreeMobilePop";
    }
    

}
