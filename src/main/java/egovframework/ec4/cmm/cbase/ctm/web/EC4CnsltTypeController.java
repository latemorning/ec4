package egovframework.ec4.cmm.cbase.ctm.web;

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
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.ec4.cmm.cbase.ctm.service.CnsltTypeDefaultVO;
import egovframework.ec4.cmm.cbase.ctm.service.CnsltTypeVO;
import egovframework.ec4.cmm.cbase.ctm.service.EC4CnsltTypeService;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.EC4WebUtil;
import egovframework.ec4.cmm.service.ResponseWrapperVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 상담유형 관리
 *
 * @author harry
 * @since 2018.05.18
 */
@Controller
public class EC4CnsltTypeController {

    @Autowired
    private DefaultBeanValidator beanValidator;

    /** EgovMessageSource */
    @Resource(name = "egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

    @Resource(name = "cnsltTypeService")
    private EC4CnsltTypeService cnsltTypeService;

    @Resource(name = "ec4WebUtil")
    private EC4WebUtil ec4WebUtil;


    /**
     * 상담유형 관리 이동
     *
     * @param searchVO
     * @param cnsltTypeVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/ctm/cnsltTypeMng.do")
    public String cnsltTypeMng(@ModelAttribute("searchVO") CnsltTypeDefaultVO searchVO, @ModelAttribute("cnsltTypeVO") CnsltTypeVO cnsltTypeVO, ModelMap model)
            throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        // 상담구분
        codeVO.setCodeId("CNSE");
        List<CmmnDetailCode> cnsltSeList = cmmUseService.selectCmmCodeDetail(codeVO);

        model.addAttribute("cnsltSeList", cnsltSeList);

        model.addAttribute("parntsCodeIdText", egovMessageSource.getMessage("cnsltType.parntsCodeId"));
        model.addAttribute("codeIdText", egovMessageSource.getMessage("cnsltType.codeId"));
        model.addAttribute("cnsltSeCodeText", egovMessageSource.getMessage("cnsltType.cnsltSeCode"));

        return "egovframework/ec4/cmm/cbase/ctm/EC4CnsltTypeMng";
    }


    /**
     * 상담코드 등록 팝업
     *
     * @param searchVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/ctm/cnsltTypeRegPopup.do")
    public String cnsltTypeRegPopup(@ModelAttribute("searchVO") CnsltTypeDefaultVO searchVO, @ModelAttribute("cnsltTypeVO") CnsltTypeVO cnsltTypeVO,
            ModelMap model) throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        // 상담구분
        codeVO.setCodeId("CNSE");

        List<CmmnDetailCode> cnsltSe = new ArrayList<CmmnDetailCode>();                 // 현재 선택된 상담구분 코드만 남기고 나머지 제거
        List<CmmnDetailCode> cnsltSeList = cmmUseService.selectCmmCodeDetail(codeVO);

        for (CmmnDetailCode detailCode : cnsltSeList) {

            if (StringUtils.equals(detailCode.getCode(), searchVO.getSearchCnsltSeCode())) {

                cnsltSe.add(detailCode);
                break;
            }
        }

        cnsltTypeVO.setCnsltSeCode(searchVO.getSearchCnsltSeCode());

        model.addAttribute("cnsltSeList", cnsltSe);

        return "egovframework/ec4/cmm/cbase/ctm/EC4CnsltTypeRegPopup";
    }


    /**
     * 상담코드 수정 팝업
     *
     * @param searchVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/ctm/cnsltTypeModPopup.do")
    public String cnsltTypeModPopup(@ModelAttribute("cnsltTypeVO") CnsltTypeVO cnsltTypeVO, ModelMap model) throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        // 상담구분
        codeVO.setCodeId("CNSE");
        List<CmmnDetailCode> cnsltSeList = cmmUseService.selectCmmCodeDetail(codeVO);

        // 상담코드 상세
        cnsltTypeVO.setValuesFromEgovMap(cnsltTypeService.selectCnsltType(cnsltTypeVO));

        model.addAttribute("cnsltSeList", cnsltSeList);

        return "egovframework/ec4/cmm/cbase/ctm/EC4CnsltTypeModPopup";
    }


    /**
     *
     * 상담유형 목록 조회 grid server-side
     *
     * @param searchVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/ctm/selectCnsltTypeList.do")
    public @ResponseBody String selectCnsltTypeList(@ModelAttribute("searchVO") CnsltTypeDefaultVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        // 정렬할 필드명 셋팅
        //searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));

        int totalCount = 0;
        ArrayList<EgovMap> cnsltTypeList = new ArrayList<EgovMap>();

        if (StringUtils.isNotBlank(searchVO.getSearchParntsCodeId()) && StringUtils.isNotBlank(searchVO.getSearchCnsltSeCode())) {

            cnsltTypeList = (ArrayList<EgovMap>)cnsltTypeService.selectCnsltTypeList(searchVO);
            totalCount = cnsltTypeService.selectCnsltTypeListCnt(searchVO);
        }

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(cnsltTypeList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }


    /**
     *
     * 콜 상담유형 목록 조회 grid server-side
     *
     * @param searchVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/ctm/selectCallCnsltTypeList.do")
    public @ResponseBody String selectCallCnsltTypeList(@ModelAttribute("searchVO") CnsltTypeDefaultVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        // 정렬할 필드명 셋팅
        //searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));

        int totalCount = 0;
        ArrayList<EgovMap> cnsltTypeList = new ArrayList<EgovMap>();

        if (StringUtils.isNotBlank(searchVO.getSearchParntsCodeId()) && StringUtils.isNotBlank(searchVO.getSearchCnsltSeCode())) {

            cnsltTypeList = (ArrayList<EgovMap>)cnsltTypeService.selectCallCnsltTypeList(searchVO);
            totalCount = cnsltTypeService.selectCallCnsltTypeListCnt(searchVO);
        }

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(cnsltTypeList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }


    /**
     * 상담유형 등록 액션
     *
     * @param cnsltTypeVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/ctm/insertCnsltType.do")
    public @ResponseBody String insertCnsltType(@ModelAttribute("cnsltTypeVO") CnsltTypeVO cnsltTypeVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            beanValidator.validate(cnsltTypeVO, bindingResult);

            if (bindingResult.hasErrors()) {

                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {

                cnsltTypeVO.setFrstRegisterId(loginVO.getUniqId());
                cnsltTypeVO.setLastUpdusrId(loginVO.getUniqId());

                cnsltTypeService.insertCnsltType(cnsltTypeVO);

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
     * 상담유형 수정 액션
     *
     * @param cnsltTypeVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/ctm/updateCnsltType.do")
    public @ResponseBody String updateCnsltType(@ModelAttribute("cnsltTypeVO") CnsltTypeVO cnsltTypeVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            beanValidator.validate(cnsltTypeVO, bindingResult);

            if (bindingResult.hasErrors()) {

                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {

                cnsltTypeVO.setFrstRegisterId(loginVO.getUniqId());
                cnsltTypeVO.setLastUpdusrId(loginVO.getUniqId());

                cnsltTypeService.updateCnsltType(cnsltTypeVO);

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
     * 상담유형 삭제 액션
     *
     * @param cnsltTypeVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/ctm/deleteCnsltType.do")
    public @ResponseBody String deleteCnsltType(@ModelAttribute("cnsltTypeVO") CnsltTypeVO cnsltTypeVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

        if (isAuthenticated) {

            cnsltTypeService.deleteCnsltType(cnsltTypeVO);

            wrapperVO.setSuccess(true);
            wrapperVO.setMessage(egovMessageSource.getMessage("success.common.delete"));
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }

}
