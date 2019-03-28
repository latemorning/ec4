package egovframework.ec4.call.cnslt.web;


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
import egovframework.ec4.call.cnslt.service.EC4CnsltDclzMngService;
import egovframework.ec4.call.cnslt.service.EC4CnsltntMngService;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.EC4WebUtil;
import egovframework.ec4.cmm.service.ResponseWrapperVO;
import egovframework.ec4.cmm.web.EC4ComIndexController;
import egovframework.ec4.call.cnslt.service.CnsltDclzMngVO;
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
public class EC4CnsltDclzMngController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EC4CnsltDclzMngController.class);

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "cnsltDclzMngService")
    private EC4CnsltDclzMngService cnsltDclzMngService;

    @Resource(name = "cnsltntMngService")
    private EC4CnsltntMngService cnsltntMngService;

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
	 * 상담원근태입력화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cnslt/cnsltDclzReg.do")
    public String openEC4CnsltDclzReg(@ModelAttribute("cnsltDclzMngVO") CnsltDclzMngVO cnsltDclzMngVO, ModelMap model)
            throws Exception {
    	
    	CmmnDetailCode sVo = new CmmnDetailCode();
        
        sVo.setUpCodeId("ALL");
        List<CmmnDetailCode> OrgnztList = cnsltntMngService.selectOrgnztInfoComboDfList(sVo);
        model.addAttribute("OrgnztList", OrgnztList); 
        
        return "egovframework/ec4/call/cnslt/EC4CnsltDclzReg";
    }




    /**
	 * 목록을 조회한다
	 * @param cnsltDclzMngVO cnsltDclzMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cnslt/cnsltDclzRegMngList.do")
    public @ResponseBody String selectCnsltDclzRegList(@ModelAttribute("searchVO") CnsltDclzMngVO searchVO, ModelMap model, HttpServletRequest request)
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

        ArrayList<EgovMap> cnsltDclzList = cnsltDclzMngService.selectCnsltDclzRegList(searchVO);
        int totalCount = cnsltDclzMngService.selectCnsltDclzRegListCnt(searchVO);
        
        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(cnsltDclzList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }


    /**
     * 상담원근태 등록 팝업
     *
     * @param searchVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/cnslt/cnsltDclzRegPopup.do")
    public String cnsltDclzRegPopup(@ModelAttribute("popUpMngVO") CnsltDclzMngVO cnsltDclzMngVO, ModelMap model)
            throws Exception {

        LOGGER.debug("cnsltDclzMng 상담원근태입력팝업 is called ");

        //model.addAttribute("callbackClass", searchVO.getCallbackClass());
        
        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        codeVO.setCodeId("THOUR");
        List<CmmnDetailCode> hourList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("hourList", hourList);

        codeVO.setCodeId("TMINUTE");
        List<CmmnDetailCode> minuteList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("minuteList", minuteList);

        codeVO.setCodeId("COM038");
        List<CmmnDetailCode> ynList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("ynList", ynList);


        return "egovframework/ec4/call/cnslt/EC4CnsltDclzRegPopup";
    }


    /**
     * 상담원근태 등록 액션
     *
     * @param cnsltDclzMngVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/cnslt/insertCnsltDclz.do")
    public @ResponseBody String insertCnsltDclz(@ModelAttribute("popUpMngVO") CnsltDclzMngVO cnsltDclzMngVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {
        	
            beanValidator.validate(cnsltDclzMngVO, bindingResult);
            
            if (bindingResult.hasErrors()) {
            	
                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {

            	cnsltDclzMngVO.setRegister(loginVO.getUniqId());
            	cnsltDclzMngVO.setUpdusr(loginVO.getUniqId());
            	
            	cnsltDclzMngService.insertCnsltDclz(cnsltDclzMngVO);
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
     * 상담원근태 수정 팝업
     *
     * @param searchVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/cnslt/cnsltDclzModPopup.do")
    public String cnsltDclzModPopup(@ModelAttribute("popUpMngVO") CnsltDclzMngVO cnsltDclzMngVO, ModelMap model)
            throws Exception {

        LOGGER.debug("cnsltDclzModPopup 상담원근태 is called ");

        //model.addAttribute("callbackClass", searchVO.getCallbackClass());
        
        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        codeVO.setCodeId("THOUR");
        List<CmmnDetailCode> hourList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("hourList", hourList);

        codeVO.setCodeId("TMINUTE");
        List<CmmnDetailCode> minuteList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("minuteList", minuteList);

        codeVO.setCodeId("COM038");
        List<CmmnDetailCode> ynList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("ynList", ynList);
        
        
        // select
        cnsltDclzMngVO.setValuesFromEgovMap(cnsltDclzMngService.selectCnsltDclzMod(cnsltDclzMngVO));

        return "egovframework/ec4/call/cnslt/EC4CnsltDclzModPopup";
    }


    /**
     * 상담원근태 수정 액션
     *
     * @param cnsltDclzMngVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/cnslt/updateCnsltDclz.do")
    public @ResponseBody String updateCnsltDclz(@ModelAttribute("popUpMngVO") CnsltDclzMngVO cnsltDclzMngVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            beanValidator.validate(cnsltDclzMngVO, bindingResult);

            if (bindingResult.hasErrors()) {

                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {


            	cnsltDclzMngVO.setRegister(loginVO.getUniqId());
            	cnsltDclzMngVO.setUpdusr(loginVO.getUniqId());
    
            	cnsltDclzMngService.updateCnsltDclz(cnsltDclzMngVO);

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
     * 상담원근태 삭제
     *
     * @param cnsltDclzMngVO
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/call/cnslt/deleteCnsltDclz.do")
    public @ResponseBody String deleteCnsltDclz(@ModelAttribute("cnsltDclzMngVO") CnsltDclzMngVO cnsltDclzMngVO) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

        	cnsltDclzMngVO.setRegister(loginVO.getUniqId());
        	cnsltDclzMngVO.setUpdusr(loginVO.getUniqId());
        	
        	cnsltDclzMngService.deleteCnsltDclz(cnsltDclzMngVO);

            wrapperVO.setSuccess(true);
            wrapperVO.setMessage(egovMessageSource.getMessage("success.common.delete"));
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
            


    /**
	 * 상담원근태현황화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cnslt/cnsltDclzList.do")
    public String openEC4CnsltDclzList(@ModelAttribute("cnsltDclzMngVO") CnsltDclzMngVO cnsltDclzMngVO, ModelMap model)
            throws Exception {
    	
    	CmmnDetailCode sVo = new CmmnDetailCode();
        
        sVo.setUpCodeId("ALL");
        List<CmmnDetailCode> OrgnztList = cnsltntMngService.selectOrgnztInfoComboDfList(sVo);
        model.addAttribute("OrgnztList", OrgnztList); 
        
        
        
        return "egovframework/ec4/call/cnslt/EC4CnsltDclzList";
    }


    /**
	 * 상담원인원관리화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cnslt/cnsltNumpersonlMng.do")
    public String openEC4CnsltNumpersonlMng()
            throws Exception {
        return "egovframework/ec4/call/cnslt/EC4CnsltNumpersonlMng";
    }







    /**
	 * O/T점검표화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cnslt/cnsltOtCheckList.do")
    public String openEC4CnsltOtCheckList()
            throws Exception {
        return "egovframework/ec4/call/cnslt/EC4CnsltOtCheckList";
    }


    /**
	 * O/T산출표화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cnslt/cnsltOtComputnList.do")
    public String openEC4CnsltOtComputnList()
            throws Exception {
        return "egovframework/ec4/call/cnslt/EC4CnsltOtComputnList";
    }


    /**
	 * 평가항목관리화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cnslt/cnsltEvltnItemMng.do")
    public String openEC4CnsltEvltnItemMng()
            throws Exception {
        return "egovframework/ec4/call/cnslt/EC4CnsltEvltnItemMng";
    }


    /**
	 * 상담원평가화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cnslt/cnsltEvltnReg.do")
    public String openEC4CnsltEvltnReg()
            throws Exception {
        return "egovframework/ec4/call/cnslt/EC4CnsltEvltnReg";
    }


    /**
	 * 상담원로그조회화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cnslt/cnsltLogList.do")
    public String openEC4CnsltLogList()
            throws Exception {
        return "egovframework/ec4/call/cnslt/EC4CnsltLogList";
    }






}
