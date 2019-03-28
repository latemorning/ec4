package egovframework.ec4.call.outbd.smt.prm.web;

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
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.ec4.call.outbd.smt.prm.service.EC4ReplcManageService;
import egovframework.ec4.call.outbd.smt.prm.service.ReplcManageDefaultVO;
import egovframework.ec4.call.outbd.smt.prm.service.ReplcManageVO;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.EC4WebUtil;
import egovframework.ec4.cmm.service.ResponseWrapperVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;

/**
 * @author harry
 * place of replc manage
 */
@Controller
public class EC4ReplcManageController {

    // 정비소관리
    @Resource(name = "replcManageService")
    private EC4ReplcManageService replcManageService;

    @Resource(name = "EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

    @Autowired
    private DefaultBeanValidator beanValidator;

    /** EgovMessageSource */
    @Resource(name = "egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "ec4WebUtil")
    private EC4WebUtil ec4WebUtil;


    public EC4ReplcManageController() {
    }


    /**
     * 정비소 관리 목록 이동
     *
     * @param searchVO
     * @param replcManageVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/smt/prm/replcManageMng.do")
    public String replcManageMng(@ModelAttribute("searchVO") ReplcManageDefaultVO searchVO, @ModelAttribute("replcManageVO") ReplcManageVO replcManageVO,
            ModelMap model) throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        // 정비소유형
        codeVO.setCodeId("REPLCSE");
        List<CmmnDetailCode> replcTyList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("replcTyList", replcTyList);

        model.addAttribute("replcCodeText", egovMessageSource.getMessage("replcManage.replcCode"));

        return "egovframework/ec4/call/outbd/smt/prm/EC4ReplcManageMng";
    }


    /**
     * 정비소 관리 목록
     *
     * @param searchVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/smt/prm/selectReplcManageList.do")
    public @ResponseBody String selectReplcManageList(@ModelAttribute("searchVO") ReplcManageDefaultVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));

        ArrayList<EgovMap> replcManageList = replcManageService.selectReplcManageList(searchVO);
        int totalCount = replcManageService.selectReplcManageListCnt(searchVO);

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(replcManageList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }


    /**
     * 정비소 등록 팝업
     *
     * @param searchVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/smt/prm/replcManageRegPopup.do")
    public String replcManageRegPopup(@ModelAttribute("searchVO") ReplcManageDefaultVO searchVO, @ModelAttribute("replcManageVO") ReplcManageVO replcManageVO,
            ModelMap model) throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        // 정비소유형
        codeVO.setCodeId("REPLCSE");
        List<CmmnDetailCode> replcTyList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("replcTyList", replcTyList);

        // alert 출력용 text
        //StringBuffer cmpgnDateTextSB = new StringBuffer();
        //cmpgnDateTextSB.append(egovMessageSource.getMessage("cmpgn.beginDe")).append(",").append(egovMessageSource.getMessage("cmpgn.endDe"));
        //model.addAttribute("cmpgnDateText", cmpgnDateTextSB.toString());

        return "egovframework/ec4/call/outbd/smt/prm/EC4ReplcManageRegPopup";
    }


    /**
     * 정비소 등록 액션
     *
     * @param replcManageVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/smt/prm/insertReplcManage.do")
    public @ResponseBody String insertReplcManage(@ModelAttribute("replcManageVO") ReplcManageVO replcManageVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            beanValidator.validate(replcManageVO, bindingResult);

            if (bindingResult.hasErrors()) {

                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {

                replcManageVO.setFrstRegisterId(loginVO.getUniqId());
                replcManageVO.setLastUpdusrId(loginVO.getUniqId());

                replcManageService.insertReplcManage(replcManageVO);

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
     * 정비소 ajax 상세
     */
    @RequestMapping(value = "/ec4/call/outbd/smt/prm/selectReplcManage.do")
    public @ResponseBody String selectReplcManage(@ModelAttribute("replcManageVO") ReplcManageVO replcManageVO) throws Exception {

        ReplcManageVO resultVO = new ReplcManageVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        //LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            // detail select
            BeanUtils.populate(resultVO, replcManageService.selectReplcManage(replcManageVO));

            resultVO.setSuccess(true);
            resultVO.setMessage(egovMessageSource.getMessage("success.common.insert"));
        } else {

            resultVO.setSuccess(false);
            resultVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return resultVO.toJson();
    }


    /**
     * 정비소 수정 팝업
     *
     * @param replcManageVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/smt/prm/replcManageModPopup.do")
    public String replcManageModPopup(@ModelAttribute("replcManageVO") ReplcManageVO replcManageVO, ModelMap model) throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        // 정비소유형
        codeVO.setCodeId("REPLCSE");
        List<CmmnDetailCode> replcTyList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("replcTyList", replcTyList);

        // detail select
        BeanUtils.populate(replcManageVO, replcManageService.selectReplcManage(replcManageVO));

        return "egovframework/ec4/call/outbd/smt/prm/EC4ReplcManageModPopup";
    }


    /**
     * 정비소 수정 액션
     *
     * @param replcManageVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/smt/prm/updateReplcManage.do")
    public @ResponseBody String updateReplcManage(@ModelAttribute("replcManageVO") ReplcManageVO replcManageVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            beanValidator.validate(replcManageVO, bindingResult);

            if (bindingResult.hasErrors()) {

                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {

                replcManageVO.setFrstRegisterId(loginVO.getUniqId());
                replcManageVO.setLastUpdusrId(loginVO.getUniqId());

                replcManageService.updateReplcManage(replcManageVO);

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
     * 정비소 삭제
     *
     * @param replcManageVO
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/call/outbd/smt/prm/deleteReplcManage.do")
    public @ResponseBody String deleteReplcManage(@ModelAttribute("replcManageVO") ReplcManageVO replcManageVO) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

        if (isAuthenticated) {

            replcManageService.deleteReplcManage(replcManageVO);

            wrapperVO.setSuccess(true);
            wrapperVO.setMessage(egovMessageSource.getMessage("success.common.delete"));
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }

}
