package egovframework.ec4.call.inbd.web;


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
import egovframework.ec4.cmm.cbase.vhi.service.EC4VhcleModelService;
import egovframework.ec4.call.inbd.service.CnsltInBoundMngVO;
import egovframework.ec4.call.inbd.service.EC4SalesLeadRegMngService;
import egovframework.ec4.call.inbd.service.SalesLeadRegMngVO;
import egovframework.ec4.cmm.cbase.vhi.service.EC4VhcleModelService;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.EC4WebUtil;
import egovframework.ec4.cmm.service.ResponseWrapperVO;
import egovframework.ec4.cmm.web.EC4ComIndexController;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;

/**
 * SALES리드 판매정보 상담에 관한 controller 클래스를 정의한다.
 * @author 최재중
 * @since 2018.04.23
 * @version 1.0
 * @see
 *
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2018.04.23  최재중          최초 생성
 *
 * </pre>
 */


@Controller
@SessionAttributes(types=SessionVO.class)
public class EC4SalesLeadRegMngController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EC4SalesLeadRegMngController.class);
	
    @Resource(name = "vhcleModelService")
    private EC4VhcleModelService vhcleModelService;

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "salesLeadRegMngService")
    private EC4SalesLeadRegMngService salesLeadRegMngService;

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
	 * SALES리드 판매정보 상담 화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/inbd/salesLeadRegMng.do")
    public String openEC4SalesLeadRegMng(@ModelAttribute("cnsltInBoundMngVO") CnsltInBoundMngVO cnsltInBoundMngVO, @ModelAttribute("salesLeadRegMngVO") SalesLeadRegMngVO salesLeadRegMngVO, ModelMap model)
            throws Exception {

        LOGGER.debug("salesLeadRegMng SALES리드 판매정보 is called ");

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
        
        
        return "egovframework/ec4/call/inbd/EC4SalesLeadRegMng";
    }




    /**
	 * 목록을 조회한다
	 * @param salesLeadRegMngVO salesLeadRegMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/inbd/salesLeadRegMngList.do")
    public @ResponseBody String selectSalesLeadRegList(@ModelAttribute("searchVO") SalesLeadRegMngVO searchVO, ModelMap model, HttpServletRequest request)
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

        ArrayList<EgovMap> salesLeadList = salesLeadRegMngService.selectSalesLeadRegList(searchVO);
        int totalCount = salesLeadRegMngService.selectSalesLeadRegListCnt(searchVO);
        
        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(salesLeadList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }


    /**
     * SALES리드 판매정보 등록 팝업
     *
     * @param searchVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/inbd/salesLeadRegPopup.do")
    public String salesLeadRegPopup(@ModelAttribute("popUpMngVO") SalesLeadRegMngVO salesLeadRegMngVO, ModelMap model)
            throws Exception {

        LOGGER.debug("salesLeadRegMng SALES리드 판매정보 is called ");

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

        return "egovframework/ec4/call/inbd/EC4SalesLeadRegPopup";
    }


    /**
     * SALES리드 판매정보 등록 액션
     *
     * @param salesLeadRegMngVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/inbd/insertSalesLead.do")
    public @ResponseBody String insertSalesLead(@ModelAttribute("popUpMngVO") SalesLeadRegMngVO salesLeadRegMngVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {
        	
            beanValidator.validate(salesLeadRegMngVO, bindingResult);
            
            if (bindingResult.hasErrors()) {
            	
                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {

            	salesLeadRegMngVO.setRegister(loginVO.getUniqId());
            	salesLeadRegMngVO.setUpdusr(loginVO.getUniqId());
            	
            	EgovMap chkVo = null;
            	chkVo = salesLeadRegMngService.selectLeadSeqChk(salesLeadRegMngVO);
            	String chkCstmrCd = (String)chkVo.get("cstmrCd");
            	String chkLeadSeq = String.valueOf(chkVo.get("leadSeq"));
            	
            	if(!"".equals(chkCstmrCd)){
            		salesLeadRegMngVO.setLeadSeq(chkLeadSeq);            		
            		salesLeadRegMngService.insertSalesLead(salesLeadRegMngVO);
                    wrapperVO.setSuccess(true);
                    wrapperVO.setMessage(egovMessageSource.getMessage("success.common.insert"));
            	}else{
                    wrapperVO.setSuccess(false);
                    wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.insert"));
            	}
            }
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }


    /**
     * SALES리드 판매정보 수정 팝업
     *
     * @param searchVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/inbd/salesLeadModPopup.do")
    public String salesLeadModPopup(@ModelAttribute("popUpMngVO") SalesLeadRegMngVO salesLeadRegMngVO, ModelMap model)
            throws Exception {

        LOGGER.debug("salesLeadModPopup SALES리드 판매정보 is called ");

        //model.addAttribute("callbackClass", searchVO.getCallbackClass());
        
        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();
        CmmnDetailCode sVo = new CmmnDetailCode();

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
        
        sVo.setCnsltSeCode("GM");
        sVo.setUpCodeId("ALL");
        List<CmmnDetailCode> modelList = vhcleModelService.selectVhclMdlComboDfList(sVo);
        model.addAttribute("modelList", modelList); 
        
        // select
        salesLeadRegMngVO.setValuesFromEgovMap(salesLeadRegMngService.selectSalesLeadMod(salesLeadRegMngVO));

        return "egovframework/ec4/call/inbd/EC4SalesLeadModPopup";
    }


    /**
     * SALES리드 판매정보 수정 액션
     *
     * @param salesLeadRegMngVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/inbd/updateSalesLead.do")
    public @ResponseBody String updateSalesLead(@ModelAttribute("popUpMngVO") SalesLeadRegMngVO salesLeadRegMngVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            beanValidator.validate(salesLeadRegMngVO, bindingResult);

            if (bindingResult.hasErrors()) {

                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {

            	salesLeadRegMngVO.setRegister(loginVO.getUniqId());
            	salesLeadRegMngVO.setUpdusr(loginVO.getUniqId());

            	salesLeadRegMngService.updateSalesLead(salesLeadRegMngVO);

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
     * SALES리드 판매정보 삭제
     *
     * @param salesLeadRegMngVO
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/call/inbd/deleteSalesLead.do")
    public @ResponseBody String deleteSalesLead(@ModelAttribute("salesLeadRegMngVO") SalesLeadRegMngVO salesLeadRegMngVO) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

        	salesLeadRegMngVO.setRegister(loginVO.getUniqId());
        	salesLeadRegMngVO.setUpdusr(loginVO.getUniqId());

        	salesLeadRegMngService.deleteSalesLead(salesLeadRegMngVO);

            wrapperVO.setSuccess(true);
            wrapperVO.setMessage(egovMessageSource.getMessage("success.common.delete"));
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }
}
