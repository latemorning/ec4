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
import egovframework.ec4.cmm.cbase.cmt.service.DetailCodeDefaultVO;
import egovframework.ec4.cmm.cbase.cmt.service.DetailCodeVO;
import egovframework.ec4.cmm.cbase.cmt.service.EC4DetailCodeService;
import egovframework.ec4.cmm.service.ComboWrapperVO;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.ResponseWrapperVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;

/**
 * ec4 상세코드 관리
 *
 * @author harry
 * @since 2018.05.16
 */
@Controller
public class EC4DetailCodeController {

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

    @Resource(name = "detailCodeService")
    private EC4DetailCodeService detailCodeService;


    /**
     * 상세코드 관리 페이지 이동
     *
     * @param searchVO
     * @param cmmCodeVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/cmt/detailCodeMng.do")
    public String detailCodeMng(@ModelAttribute("searchVO") DetailCodeDefaultVO searchVO, @ModelAttribute("detailCodeVO") DetailCodeVO detailCodeVO,
            ModelMap model) throws Exception {

        return "egovframework/ec4/cmm/cbase/cmt/EC4DetailCodeMng";
    }


    /**
     * 상세코드 등록 페이지 이동
     *
     * @param detailCodeVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/cmt/registDetailCodeView.do")
    public String registDetailCodeView(@ModelAttribute("detailCodeVO") DetailCodeVO detailCodeVO, ModelMap model) throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();
        List<CmmnDetailCode> clCodeList = cmmUseService.selectClCodeDetail(codeVO);

        model.addAttribute("clCodeList", clCodeList);

        return "egovframework/ec4/cmm/cbase/cmt/EC4DetailCodeReg";
    }


    /**
     * 상세코드 수정 페이지 이동
     *
     * @param detailCodeVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/cmt/modifyDetailCodeView.do")
    public String modifyDetailCodeView(@ModelAttribute("detailCodeVO") DetailCodeVO detailCodeVO, ModelMap model) throws Exception {

        // 상세
        detailCodeVO.setValuesFromEgovMap(detailCodeService.selectDetailCode(detailCodeVO));

        return "egovframework/ec4/cmm/cbase/cmt/EC4DetailCodeMod";
    }


    /**
     * 상세코드 목록
     *
     * @param searchVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/cmt/selectDetailCodeList.do")
    public @ResponseBody String selectDetailCodeList(@ModelAttribute("searchVO") DetailCodeDefaultVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));

        ArrayList<EgovMap> detailCodeList = detailCodeService.selectDetailCodeList(searchVO);
        int totalCount = detailCodeService.selectDetailCodeListCnt(searchVO);

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(detailCodeList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }


    /**
     * <pre>
     * 공통코드 콤보
     * </pre>
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/cmt/selectCodeComboList.do")
    public @ResponseBody String selectCodeComboList(@ModelAttribute("searchVO") CmmCodeDefaultVO searchVO) throws Exception {

        ArrayList<CmmnDetailCode> codeList = new ArrayList<CmmnDetailCode>();

        if (StringUtils.isNotBlank(searchVO.getSearchClCode())) {

            ComDefaultCodeVO codeVO = new ComDefaultCodeVO();
            codeVO.setHaveDetailCondition("Y");
            codeVO.setDetailCondition(searchVO.getSearchClCode());
            codeVO.setCodeId(searchVO.getSearchCodeId());
            codeVO.setTableNm("comtccmmncode");

            codeList = (ArrayList<CmmnDetailCode>)cmmUseService.selectCodeDetail(codeVO);
        }

        ComboWrapperVO wrapperVO = new ComboWrapperVO();
        wrapperVO.setResults(codeList);

        return wrapperVO.toJson();
    }


    /**
     * <pre>
     * 공통상세코드 콤보
     * </pre>
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/cmt/selectDetailCodeComboList.do")
    public @ResponseBody String selectDetailCodeComboList(@ModelAttribute("searchVO") CmmCodeDefaultVO searchVO) throws Exception {

        ArrayList<CmmnDetailCode> codeList = new ArrayList<CmmnDetailCode>();

        if (StringUtils.isNotBlank(searchVO.getSearchUpCode())) {

            ComDefaultCodeVO codeVO = new ComDefaultCodeVO();
            codeVO.setHaveDetailCondition("Y");
            codeVO.setCode(searchVO.getSearchCode());
            codeVO.setCodeId(searchVO.getSearchCodeId());
            codeVO.setDetailCondition(searchVO.getSearchUpCode());
            codeVO.setTableNm("COMTCCMMNDETAILCODE");

            codeList = (ArrayList<CmmnDetailCode>)cmmUseService.selectDetailCode(codeVO);
        }

        ComboWrapperVO wrapperVO = new ComboWrapperVO();
        wrapperVO.setResults(codeList);

        return wrapperVO.toJson();
    }


    /**
     * 상세코드 등록
     *
     * @param detailCodeVO
     * @param bindingResult
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/cmm/cbase/cmt/insertDetailCode.do")
    public String insertDetailCode(@ModelAttribute("detailCodeVO") DetailCodeVO detailCodeVO, BindingResult bindingResult, ModelMap model) throws Exception {

        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            if (EgovDoubleSubmitHelper.checkAndSaveToken()) {

                beanValidator.validate(detailCodeVO, bindingResult);

                // 폼오류
                if (bindingResult.hasErrors()) {

                    // 공통코드 콤보
                    if (StringUtils.isNotBlank(detailCodeVO.getClCode())) {

                        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();
                        codeVO.setHaveDetailCondition("Y");
                        codeVO.setDetailCondition(detailCodeVO.getClCode());
                        codeVO.setCodeId(detailCodeVO.getCodeId());
                        codeVO.setTableNm("comtccmmncode");

                        List<CmmnDetailCode> codeList = cmmUseService.selectCodeDetail(codeVO);

                        model.addAttribute("codeList", codeList);
                    }

                    // 분류코드 콤보
                    ComDefaultCodeVO codeVO = new ComDefaultCodeVO();
                    List<CmmnDetailCode> clCodeList = cmmUseService.selectClCodeDetail(codeVO);

                    model.addAttribute("clCodeList", clCodeList);

                    return "egovframework/ec4/cmm/cbase/cmt/EC4DetailCodeReg";
                }

                detailCodeVO.setFrstRegisterId(loginVO.getUniqId());

                detailCodeService.insertDetailCode(detailCodeVO);

                model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
            }
        }

        return "forward:/ec4/cmm/cbase/cmt/detailCodeMng.do";
    }


    /**
     * 상세코드 수정
     *
     * @param detailCodeVO
     * @param bindingResult
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/cmm/cbase/cmt/updateDetailCode.do")
    public String updateDetailCode(@ModelAttribute("detailCodeVO") DetailCodeVO detailCodeVO, BindingResult bindingResult, ModelMap model) throws Exception {

        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            if (EgovDoubleSubmitHelper.checkAndSaveToken()) {

                beanValidator.validate(detailCodeVO, bindingResult);

                // 폼오류
                if (bindingResult.hasErrors()) {

                    // 상세
                    detailCodeVO.setValuesFromEgovMap(detailCodeService.selectDetailCode(detailCodeVO));

                    return "egovframework/ec4/cmm/cbase/cmt/EC4DetailCodeMod";
                }

                detailCodeVO.setLastUpdusrId(loginVO.getUniqId());

                detailCodeService.updateDetailCode(detailCodeVO);

                model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
            }
        }

        return "forward:/ec4/cmm/cbase/cmt/detailCodeMng.do";
    }


    /**
     * 상세코드 삭제
     *
     * @param cmmCodeVO
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/cmm/cbase/cmt/deleteDetailCode.do")
    public @ResponseBody String deleteDetailCode(@ModelAttribute("detailCodeVO") DetailCodeVO detailCodeVO) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

        if (isAuthenticated) {

            detailCodeService.deleteDetailCode(detailCodeVO);

            wrapperVO.setSuccess(true);
            wrapperVO.setMessage(egovMessageSource.getMessage("success.common.delete"));
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }

}
