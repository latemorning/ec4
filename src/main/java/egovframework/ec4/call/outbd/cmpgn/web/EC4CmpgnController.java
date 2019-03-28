package egovframework.ec4.call.outbd.cmpgn.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
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
import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.uss.olp.qmc.service.EgovQustnrManageService;
import egovframework.ec4.call.outbd.cmpgn.service.CmpgnDefaultVO;
import egovframework.ec4.call.outbd.cmpgn.service.CmpgnVO;
import egovframework.ec4.call.outbd.cmpgn.service.EC4CmpgnService;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.EC4WebUtil;
import egovframework.ec4.cmm.service.ResponseWrapperVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;

/**
 * 캠페인 관리
 *
 * @author harry
 * @since 2018.06.25
 */
@Controller
public class EC4CmpgnController {

    @Resource(name = "cmpgnService")
    private EC4CmpgnService cmpgnService;

    @Resource(name = "egovQustnrManageService")
    private EgovQustnrManageService qustnrManageService;

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
     * 캠페인 관리 이동
     *
     * @param searchVO
     * @param cmpgnVO
     * @param status
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/cmpgn/cmpgnMng.do")
    public String cmpgnMng(@ModelAttribute("searchVO") CmpgnDefaultVO searchVO, @ModelAttribute("cmpgnVO") CmpgnVO cmpgnVO, SessionStatus status,
            ModelMap model) throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        // 진행상태코드
        codeVO.setCodeId("CMPST");
        List<CmmnDetailCode> sttusCodeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("sttusCodeList", sttusCodeList);

        model.addAttribute("cmpgnIdText", egovMessageSource.getMessage("cmpgn.cmpgnId"));

        return "egovframework/ec4/call/outbd/cmpgn/EC4CmpgnMng";
    }


    /**
     * 캠페인 목록
     *
     * @param searchVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/cmpgn/selectCmpgnList.do")
    public @ResponseBody String selectCmpgnList(@ModelAttribute("searchVO") CmpgnDefaultVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));

        ArrayList<EgovMap> cmpgnList = cmpgnService.selectCmpgnList(searchVO);
        int totalCount = cmpgnService.selectCmpgnListCnt(searchVO);

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(cmpgnList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }


    /**
     * 캠페인 등록 팝업
     *
     * @param searchVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/cmpgn/cmpgnRegPopup.do")
    public String cmpgnRegPopup(@ModelAttribute("searchVO") CmpgnDefaultVO searchVO, @ModelAttribute("cmpgnVO") CmpgnVO cmpgnVO, ModelMap model)
            throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        // 진행상태코드
        codeVO.setCodeId("CMPST");
        List<CmmnDetailCode> sttusCodeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("sttusCodeList", sttusCodeList);


        // 설문지 목록 콤보
        ComDefaultVO comDefaultVO = new ComDefaultVO();
        List<CmmnDetailCode> qustnrCombo = qustnrManageService.selectQustnrCombo(comDefaultVO);
        model.addAttribute("qustnrCombo", qustnrCombo);


        // alert 출력용 text
        StringBuffer cmpgnDateTextSB = new StringBuffer();
        cmpgnDateTextSB.append(egovMessageSource.getMessage("cmpgn.beginDe")).append(",").append(egovMessageSource.getMessage("cmpgn.endDe"));
        model.addAttribute("cmpgnDateText", cmpgnDateTextSB.toString());

        return "egovframework/ec4/call/outbd/cmpgn/EC4CmpgnRegPopup";
    }


    /**
     * 캠페인 등록 액션
     *
     * @param cmpgnVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/cmpgn/insertCmpgn.do")
    public @ResponseBody String insertCmpgn(@ModelAttribute("cmpgnVO") CmpgnVO cmpgnVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            beanValidator.validate(cmpgnVO, bindingResult);

            if (bindingResult.hasErrors()) {

                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {

                cmpgnVO.setRegisterId(loginVO.getUniqId());
                cmpgnVO.setUpdusrId(loginVO.getUniqId());

                cmpgnService.insertCmpgn(cmpgnVO);

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
     * 캠페인 수정 팝업
     *
     * @param cmpgnVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/cmpgn/cmpgnModPopup.do")
    public String cmpgnModPopup(@ModelAttribute("cmpgnVO") CmpgnVO cmpgnVO, ModelMap model) throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        // 진행상태코드
        codeVO.setCodeId("CMPST");
        List<CmmnDetailCode> sttusCodeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("sttusCodeList", sttusCodeList);


        // 설문지 목록 콤보
        ComDefaultVO comDefaultVO = new ComDefaultVO();
        List<CmmnDetailCode> qustnrCombo = qustnrManageService.selectQustnrCombo(comDefaultVO);
        model.addAttribute("qustnrCombo", qustnrCombo);


        // detail select
        BeanUtils.populate(cmpgnVO, cmpgnService.selectCmpgn(cmpgnVO));

        return "egovframework/ec4/call/outbd/cmpgn/EC4CmpgnModPopup";
    }


    /**
     * 캠페인 수정 액션
     *
     * @param cmpgnVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/cmpgn/updateCmpgn.do")
    public @ResponseBody String updateCmpgn(@ModelAttribute("cmpgnVO") CmpgnVO cmpgnVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            beanValidator.validate(cmpgnVO, bindingResult);

            if (bindingResult.hasErrors()) {

                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {

                cmpgnVO.setRegisterId(loginVO.getUniqId());
                cmpgnVO.setUpdusrId(loginVO.getUniqId());

                cmpgnService.updateCmpgn(cmpgnVO);

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
     * 캠페인 삭제
     *
     * @param cmpgnVO
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/call/outbd/cmpgn/deleteCmpgn.do")
    public @ResponseBody String deleteCmpgn(@ModelAttribute("cmpgnVO") CmpgnVO cmpgnVO) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

        if (isAuthenticated) {

            cmpgnService.deleteCmpgn(cmpgnVO);

            wrapperVO.setSuccess(true);
            wrapperVO.setMessage(egovMessageSource.getMessage("success.common.delete"));
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }

}
