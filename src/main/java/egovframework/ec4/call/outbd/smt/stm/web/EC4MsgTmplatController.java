package egovframework.ec4.call.outbd.smt.stm.web;

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
import egovframework.ec4.call.outbd.smt.prm.service.ReplcManageVO;
import egovframework.ec4.call.outbd.smt.stm.service.EC4MsgTmplatService;
import egovframework.ec4.call.outbd.smt.stm.service.MsgTmplatDefaultVO;
import egovframework.ec4.call.outbd.smt.stm.service.MsgTmplatVO;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.EC4WebUtil;
import egovframework.ec4.cmm.service.ResponseWrapperVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;

/**
 * @author harry
 * sms tmplat manage
 */
@Controller
public class EC4MsgTmplatController {

    @Resource(name = "msgTmplatService")
    private EC4MsgTmplatService msgTmplatService;

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


    public EC4MsgTmplatController() {
    }


    /**
     * SMS메시지 템플릿 관리 이동
     *
     * @param searchVO
     * @param msgTmplatVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/smt/stm/msgTmplatMng.do")
    public String msgTmplatMng(@ModelAttribute("searchVO") MsgTmplatDefaultVO searchVO, @ModelAttribute("msgTmplatVO") MsgTmplatVO msgTmplatVO, ModelMap model)
            throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        // 템플릿구분
        codeVO.setCodeId("MTS");
        List<CmmnDetailCode> smsTmplatSeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("smsTmplatSeList", smsTmplatSeList);

        //model.addAttribute("cmpgnIdText", egovMessageSource.getMessage("cmpgn.cmpgnId"));

        return "egovframework/ec4/call/outbd/smt/stm/EC4MsgTmplatMng";
    }


    /**
     * SMS메시지 템플릿 (목록만 나옴) import용 화면
     *
     * @param searchVO
     * @param msgTmplatVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/smt/stm/msgTmplatList.do")
    public String msgTmplatList(@ModelAttribute("searchVO") MsgTmplatDefaultVO searchVO, @ModelAttribute("msgTmplatVO") MsgTmplatVO msgTmplatVO, ModelMap model)
            throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        // 템플릿구분
        codeVO.setCodeId("MTS");
        List<CmmnDetailCode> smsTmplatSeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("smsTmplatSeList", smsTmplatSeList);

        //model.addAttribute("cmpgnIdText", egovMessageSource.getMessage("cmpgn.cmpgnId"));

        return "egovframework/ec4/call/outbd/smt/stm/EC4MsgTmplatList";
    }


    /**
     * SMS메시지 템플릿 목록
     *
     * @param searchVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/smt/stm/selectMsgTmplatList.do")
    public @ResponseBody String selectMsgTmplatList(@ModelAttribute("searchVO") MsgTmplatDefaultVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));

        ArrayList<EgovMap> msgTmplatList = msgTmplatService.selectMsgTmplatList(searchVO);
        int totalCount = msgTmplatService.selectMsgTmplatListCnt(searchVO);

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(msgTmplatList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }


    /**
     * 템플릿 할당
     *
     * @param msgTmplatVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/smt/stm/asgnTmplat.do")
    public @ResponseBody String asgnTmplat(@ModelAttribute("msgTmplatVO") MsgTmplatVO msgTmplatVO) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            msgTmplatVO.setFrstRegisterId(loginVO.getUniqId());
            msgTmplatVO.setLastUpdusrId(loginVO.getUniqId());

            msgTmplatService.asgnTmplat(msgTmplatVO);

            wrapperVO.setSuccess(true);
            wrapperVO.setMessage(egovMessageSource.getMessage("success.common.insert"));
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }


    /**
     * 템플릿 해제
     *
     * @param msgTmplatVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/smt/stm/relisTmplat.do")
    public @ResponseBody String relisTmplat(@ModelAttribute("msgTmplatVO") MsgTmplatVO msgTmplatVO) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            msgTmplatVO.setFrstRegisterId(loginVO.getUniqId());
            msgTmplatVO.setLastUpdusrId(loginVO.getUniqId());

            msgTmplatService.relisTmplat(msgTmplatVO);

            wrapperVO.setSuccess(true);
            wrapperVO.setMessage(egovMessageSource.getMessage("success.common.insert"));
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }
}
