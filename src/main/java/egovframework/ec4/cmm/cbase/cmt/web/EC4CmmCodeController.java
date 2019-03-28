package egovframework.ec4.cmm.cbase.cmt.web;

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
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovDoubleSubmitHelper;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.ec4.cmm.cbase.cmt.service.CmmCodeDefaultVO;
import egovframework.ec4.cmm.cbase.cmt.service.CmmCodeVO;
import egovframework.ec4.cmm.cbase.cmt.service.EC4CmmCodeService;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.ResponseWrapperVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;

/**
 * ec4 공통코드 관리
 *
 * @author harry
 * @since 2018.05.15
 *
 */
@Controller
public class EC4CmmCodeController {

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

    @Resource(name = "cmmCodeService")
    private EC4CmmCodeService cmmCodeService;


    /**
     * 공통코드 관리 페이지 이동
     *
     * @param searchVO
     * @param cmmCodeVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/cmt/cmmCodeMng.do")
    public String cmmCodeMng(@ModelAttribute("searchVO") CmmCodeDefaultVO searchVO, @ModelAttribute("cmmCodeVO") CmmCodeVO cmmCodeVO, ModelMap model)
            throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        List<CmmnDetailCode> clCodeList = cmmUseService.selectClCodeDetail(codeVO);

        model.addAttribute("clCodeList", clCodeList);

        return "egovframework/ec4/cmm/cbase/cmt/EC4CmmCodeMng";
    }


    /**
     * 공통코드 등록 이동
     *
     * @param cmmCodeVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/cmt/registCmmCodeView.do")
    public String registCmmCodeView(@ModelAttribute("cmmCodeVO") CmmCodeVO cmmCodeVO, ModelMap model) throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();
        List<CmmnDetailCode> clCodeList = cmmUseService.selectClCodeDetail(codeVO);

        model.addAttribute("clCodeList", clCodeList);

        return "egovframework/ec4/cmm/cbase/cmt/EC4CmmCodeReg";
    }


    /**
     * 공통코드 수정 이동
     *
     * @param cmmCodeVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/cmt/modifyCmmCodeView.do")
    public String modifyCmmCodeView(@ModelAttribute("cmmCodeVO") CmmCodeVO cmmCodeVO, ModelMap model) throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();
        List<CmmnDetailCode> clCodeList = cmmUseService.selectClCodeDetail(codeVO);

        // 공통코드 상세
        cmmCodeVO.setValuesFromEgovMap(cmmCodeService.selectCmmCode(cmmCodeVO));

        model.addAttribute("clCodeList", clCodeList);

        return "egovframework/ec4/cmm/cbase/cmt/EC4CmmCodeMod";
    }


    /**
     * 공통코드 목록
     *
     * @param searchVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/cmt/selectCmmCodeList.do")
    public @ResponseBody String selectCmmCodeList(@ModelAttribute("searchVO") CmmCodeDefaultVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));

        ArrayList<EgovMap> cmmCodeList = cmmCodeService.selectCmmCodeList(searchVO);
        int totalCount = cmmCodeService.selectCmmCodeListCnt(searchVO);

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(cmmCodeList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }


    /**
     * 공통코드 등록
     *
     * @param cmmCodeVO
     * @param bindingResult
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/cmm/cbase/cmt/insertCmmCode.do")
    public String insertCmmCode(@ModelAttribute("cmmCodeVO") CmmCodeVO cmmCodeVO, BindingResult bindingResult, ModelMap model) throws Exception {

        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            if (EgovDoubleSubmitHelper.checkAndSaveToken()) {

                beanValidator.validate(cmmCodeVO, bindingResult);

                // 폼오류
                if (bindingResult.hasErrors()) {

                    ComDefaultCodeVO codeVO = new ComDefaultCodeVO();
                    List<CmmnDetailCode> clCodeList = cmmUseService.selectClCodeDetail(codeVO);

                    model.addAttribute("clCodeList", clCodeList);

                    return "egovframework/ec4/cmm/cbase/cmt/EC4CmmCodeReg";
                }

                cmmCodeVO.setFrstRegisterId(loginVO.getUniqId());

                cmmCodeService.insertCmmCode(cmmCodeVO);

                model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
            }
        }

        return "forward:/ec4/cmm/cbase/cmt/cmmCodeMng.do";
    }


    /**
     * 공통코드 수정
     *
     * @param cmmCodeVO
     * @param bindingResult
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/cmm/cbase/cmt/updateCmmCode.do")
    public String updateCmmCode(@ModelAttribute("cmmCodeVO") CmmCodeVO cmmCodeVO, BindingResult bindingResult, ModelMap model) throws Exception {

        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            if (EgovDoubleSubmitHelper.checkAndSaveToken()) {

                beanValidator.validate(cmmCodeVO, bindingResult);

                // 폼오류
                if (bindingResult.hasErrors()) {

                    ComDefaultCodeVO codeVO = new ComDefaultCodeVO();
                    List<CmmnDetailCode> clCodeList = cmmUseService.selectClCodeDetail(codeVO);

                    model.addAttribute("clCodeList", clCodeList);

                    return "egovframework/ec4/cmm/cbase/cmt/EC4CmmCodeMod";
                }

                cmmCodeVO.setLastUpdusrId(loginVO.getUniqId());

                cmmCodeService.updateCmmCode(cmmCodeVO);

                model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
            }
        }

        return "forward:/ec4/cmm/cbase/cmt/cmmCodeMng.do";
    }


    /**
     * 공통코드 삭제
     *
     * @param cmmCodeVO
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/cmm/cbase/cmt/deleteCmmCode.do")
    public @ResponseBody String deleteCmmCode(@ModelAttribute("cmmCodeVO") CmmCodeVO cmmCodeVO) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

        if (isAuthenticated) {

            cmmCodeService.deleteCmmCode(cmmCodeVO);

            wrapperVO.setSuccess(true);
            wrapperVO.setMessage(egovMessageSource.getMessage("success.common.delete"));
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }

}
