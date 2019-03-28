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
import egovframework.ec4.call.cnslt.service.EC4CnsltLicenseMngService;
import egovframework.ec4.call.cnslt.service.EC4CnsltntMngService;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.EC4WebUtil;
import egovframework.ec4.cmm.service.ResponseWrapperVO;
import egovframework.ec4.cmm.web.EC4ComIndexController;
import egovframework.ec4.call.cnslt.service.CnsltLicenseMngVO;
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
public class EC4CnsltLicenseMngController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EC4CnsltLicenseMngController.class);

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "cnsltLicenseMngService")
    private EC4CnsltLicenseMngService cnsltLicenseMngService;

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
	 * 상담원자격증관리화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cnslt/cnsltLicenseMng.do")
    public String openEC4CnsltLicenseMng(@ModelAttribute("cnsltLicenseMngVO") CnsltLicenseMngVO cnsltLicenseMngVO, ModelMap model)
            throws Exception {
        
        CmmnDetailCode sVo = new CmmnDetailCode();
        
        sVo.setUpCodeId("ALL");
        List<CmmnDetailCode> OrgnztList = cnsltntMngService.selectOrgnztInfoComboDfList(sVo);
        model.addAttribute("OrgnztList", OrgnztList);
        
        
        return "egovframework/ec4/call/cnslt/EC4CnsltLicenseMng";
    }




    /**
	 * 목록을 조회한다
	 * @param cnsltLicenseMngVO cnsltLicenseMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cnslt/cnsltLicenseMngList.do")
    public @ResponseBody String selectCnsltLicenseRegList(@ModelAttribute("searchVO") CnsltLicenseMngVO searchVO, ModelMap model, HttpServletRequest request)
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

        ArrayList<EgovMap> cnsltLicenseList = cnsltLicenseMngService.selectCnsltLicenseRegList(searchVO);
        int totalCount = cnsltLicenseMngService.selectCnsltLicenseRegListCnt(searchVO);
        
        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(cnsltLicenseList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }


    /**
     * 상담원자격증 등록 팝업
     *
     * @param searchVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/cnslt/cnsltLicenseRegPopup.do")
    public String cnsltLicenseRegPopup(@ModelAttribute("popUpMngVO") CnsltLicenseMngVO cnsltLicenseMngVO, ModelMap model)
            throws Exception {

        LOGGER.debug("cnsltLicenseMng 상담원자격증입력팝업 is called ");

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


        return "egovframework/ec4/call/cnslt/EC4CnsltLicenseRegPopup";
    }


    /**
     * 상담원자격증 등록 액션
     *
     * @param cnsltLicenseMngVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/cnslt/insertCnsltLicense.do")
    public @ResponseBody String insertCnsltLicense(@ModelAttribute("popUpMngVO") CnsltLicenseMngVO cnsltLicenseMngVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        //System.out.println("=========["+cnsltLicenseMngVO.toString());
        //System.out.println("##################################["+cnsltLicenseMngVO.getCnsltUserId());
        //System.out.println("##################################("+cnsltLicenseMngVO.getLicenseNo());

        if (isAuthenticated) {
        	
            beanValidator.validate(cnsltLicenseMngVO, bindingResult);
            
            if (bindingResult.hasErrors()) {
            	
                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {

            	cnsltLicenseMngVO.setRegister(loginVO.getUniqId());
            	cnsltLicenseMngVO.setUpdusr(loginVO.getUniqId());
            	
            	cnsltLicenseMngService.insertCnsltLicense(cnsltLicenseMngVO);
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
     * 상담원자격증 수정 팝업
     *
     * @param searchVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/cnslt/cnsltLicenseModPopup.do")
    public String cnsltLicenseModPopup(@ModelAttribute("popUpMngVO") CnsltLicenseMngVO cnsltLicenseMngVO, ModelMap model)
            throws Exception {

        LOGGER.debug("cnsltLicenseModPopup 상담원자격증 is called ");

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
        cnsltLicenseMngVO.setValuesFromEgovMap(cnsltLicenseMngService.selectCnsltLicenseMod(cnsltLicenseMngVO));

        return "egovframework/ec4/call/cnslt/EC4CnsltLicenseModPopup";
    }


    /**
     * 상담원자격증 수정 액션
     *
     * @param cnsltLicenseMngVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/cnslt/updateCnsltLicense.do")
    public @ResponseBody String updateCnsltLicense(@ModelAttribute("popUpMngVO") CnsltLicenseMngVO cnsltLicenseMngVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            beanValidator.validate(cnsltLicenseMngVO, bindingResult);

            if (bindingResult.hasErrors()) {

                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {


            	cnsltLicenseMngVO.setRegister(loginVO.getUniqId());
            	cnsltLicenseMngVO.setUpdusr(loginVO.getUniqId());
    
            	cnsltLicenseMngService.updateCnsltLicense(cnsltLicenseMngVO);

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
     * 상담원자격증 삭제
     *
     * @param cnsltLicenseMngVO
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/call/cnslt/deleteCnsltLicense.do")
    public @ResponseBody String deleteCnsltLicense(@ModelAttribute("cnsltLicenseMngVO") CnsltLicenseMngVO cnsltLicenseMngVO) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

        	cnsltLicenseMngVO.setRegister(loginVO.getUniqId());
        	cnsltLicenseMngVO.setUpdusr(loginVO.getUniqId());
        	
        	cnsltLicenseMngService.deleteCnsltLicense(cnsltLicenseMngVO);

            wrapperVO.setSuccess(true);
            wrapperVO.setMessage(egovMessageSource.getMessage("success.common.delete"));
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }

    
    
    
    



}
