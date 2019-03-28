package egovframework.ec4.cmm.cbase.bpc.web;

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
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.ec4.cmm.cbase.bpc.service.EC4BussplcService;
import egovframework.ec4.cmm.cbase.bpc.service.BussplcDefaultVO;
import egovframework.ec4.cmm.cbase.bpc.service.BussplcVO;
import egovframework.ec4.cmm.service.ComboWrapperVO;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.EC4WebUtil;
import egovframework.ec4.cmm.service.ResponseWrapperVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;

/**
 * @author harry
 * @since 2018.04.16
 */
@Controller
//@SessionAttributes(types = BussplcVO.class)
//@SessionAttributes("bussplcVO")
public class EC4BussplcController {

    @Resource(name = "bussplcService")
    private EC4BussplcService bussplcService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Autowired
    private DefaultBeanValidator beanValidator;

    /** EgovMessageSource */
    @Resource(name = "egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

    @Resource(name = "ec4WebUtil")
    private EC4WebUtil ec4WebUtil;









    /**
     * SCMS 사업소 목록 조회 grid server-side
     *
     * @param searchVO
     * @return
     * @exception Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/bpc/selectBussplcSCMSCombList.do")
    public @ResponseBody String selectBussplcSCMSCombList(@ModelAttribute("searchVO") CmmnDetailCode searchVO) throws Exception {

        ArrayList<CmmnDetailCode> codeList = new ArrayList<CmmnDetailCode>();
        
        if (StringUtils.isNotBlank(searchVO.getUpCodeId())) {
        	codeList = (ArrayList<CmmnDetailCode>)bussplcService.selectBussplcSCMSCombList(searchVO);
        }

        ComboWrapperVO wrapperVO = new ComboWrapperVO();
        wrapperVO.setResults(codeList);

        return wrapperVO.toJson();
    }



    /**
     * CCMS 사업소 목록 조회 grid server-side
     *
     * @param searchVO
     * @return
     * @exception Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/bpc/selectBussplcCCMSCombList.do")
    public @ResponseBody String selectBussplcCCMSCombList(@ModelAttribute("searchVO") CmmnDetailCode searchVO) throws Exception {

        ArrayList<CmmnDetailCode> codeList = new ArrayList<CmmnDetailCode>();
        
        if (StringUtils.isNotBlank(searchVO.getUpCodeId())) {
        	codeList = (ArrayList<CmmnDetailCode>)bussplcService.selectBussplcCCMSCombList(searchVO);
        }

        ComboWrapperVO wrapperVO = new ComboWrapperVO();
        wrapperVO.setResults(codeList);

        return wrapperVO.toJson();
    }



    /**
     * SCMS/CCMS 사업소 목록 조회 grid server-side
     *
     * @param searchVO
     * @return
     * @exception Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/bpc/selectBussplcCMSCombList.do")
    public @ResponseBody String selectBussplcCMSCombList(@ModelAttribute("searchVO") CmmnDetailCode searchVO) throws Exception {

        ArrayList<CmmnDetailCode> codeList = new ArrayList<CmmnDetailCode>();
        
        if (StringUtils.isNotBlank(searchVO.getUpCodeId())) {
        	
        	if("CCMS".equals(searchVO.getCodeKnd())){
        		codeList = (ArrayList<CmmnDetailCode>)bussplcService.selectBussplcCCMSCombList(searchVO);
        	}else if("SCMS".equals(searchVO.getCodeKnd())){
        		codeList = (ArrayList<CmmnDetailCode>)bussplcService.selectBussplcSCMSCombList(searchVO);
        	}else{
        		
        	}
        }

        ComboWrapperVO wrapperVO = new ComboWrapperVO();
        wrapperVO.setResults(codeList);

        return wrapperVO.toJson();
    }




}
