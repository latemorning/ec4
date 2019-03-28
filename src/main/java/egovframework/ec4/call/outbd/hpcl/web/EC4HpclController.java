package egovframework.ec4.call.outbd.hpcl.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
import egovframework.ec4.call.outbd.hpcl.service.CnslrDefaultVO;
import egovframework.ec4.call.outbd.hpcl.service.EC4HpclService;
import egovframework.ec4.call.outbd.hpcl.service.HpclDefaultVO;
import egovframework.ec4.call.outbd.hpcl.service.HpclVO;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.EC4WebUtil;
import egovframework.ec4.cmm.service.ResponseWrapperVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;

@Controller
public class EC4HpclController {

    @Resource(name = "hpclService")
    private EC4HpclService hpclService;

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
     * 해피콜 인터페이스 목록 이동
     *
     * @param searchVO
     * @param hpclVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/hpcl/hpclMng.do")
    public String hpclMng(@ModelAttribute("searchVO") HpclDefaultVO searchVO, @ModelAttribute("hpclVO") HpclVO hpclVO, ModelMap model) throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        // 진행상태코드
        codeVO.setCodeId("CMPST");
        List<CmmnDetailCode> progrsSttusCode = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("progrsSttusCode", progrsSttusCode);

        model.addAttribute("hpclText", egovMessageSource.getMessage("hpcl.hpcl"));

        return "egovframework/ec4/call/outbd/hpcl/EC4HpclMng";
    }


    /**
     * 상담콜 목록 화면 이동, 상담원별 화면
     *
     * @param searchVO
     * @param hpclVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/hpcl/callCnsltMng.do")
    public String callCnsltMng(@ModelAttribute("searchVO") HpclDefaultVO searchVO, @ModelAttribute("hpclVO") HpclVO hpclVO, ModelMap model) throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        // 진행상태코드
        codeVO.setCodeId("CLSTTCD");
        List<CmmnDetailCode> progrsSttusCode = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("progrsSttusCode", progrsSttusCode);

        model.addAttribute("hpclText", egovMessageSource.getMessage("hpcl.hpcl"));

        return "egovframework/ec4/call/outbd/hpcl/EC4CallCnsltMng";
    }


    /**
     * 해피콜 목록
     *
     * @param searchVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/hpcl/selectHpclList.do")
    public @ResponseBody String selectHpclList(@ModelAttribute("searchVO") HpclDefaultVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));

        ArrayList<EgovMap> hpclList = hpclService.selectHpclList(searchVO);
        int totalCount = hpclService.selectHpclListCnt(searchVO);

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(hpclList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }


    /**
     * 상담원별 상담콜 목록
     *
     * @param searchVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/hpcl/selectCallCnsltList.do")
    public @ResponseBody String selectCallCnsltList(@ModelAttribute("searchVO") HpclDefaultVO searchVO, ModelMap model, HttpServletRequest request)
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

        ArrayList<EgovMap> callCnsltList = hpclService.selectCallCnsltList(searchVO);
        int totalCount = hpclService.selectCallCnsltListCnt(searchVO);

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(callCnsltList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }


    /**
     * 캠페인 - 해피콜 분배 팝업
     *
     * @param searchVO
     * @param hpclVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/hpcl/hpclDstbPopup.do")
    public String hpclDstbPopup(@ModelAttribute("searchVO") HpclDefaultVO searchVO, @ModelAttribute("hpclVO") HpclVO hpclVO, ModelMap model) throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        // 진행상태코드
        codeVO.setCodeId("CMPST");
        List<CmmnDetailCode> sttusCodeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("sttusCodeList", sttusCodeList);

        model.addAttribute("hpclList", hpclVO.toListJson());
        model.addAttribute("hpclText", egovMessageSource.getMessage("hpcl.hpcl"));
        model.addAttribute("cmpgnText", egovMessageSource.getMessage("cmpgn.cmpgn"));

        return "egovframework/ec4/call/outbd/hpcl/EC4HpclDstbPopup";
    }


    /**
     * 캠페인 - 해피콜 분배
     *
     * @param hpclVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/hpcl/dstbHpcl.do")
    public @ResponseBody String dstbHpcl(@ModelAttribute("hpclVO") HpclVO hpclVO) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            hpclVO.setFrstRegisterId(loginVO.getUniqId());
            hpclVO.setLastUpdusrId(loginVO.getUniqId());

            hpclService.dstbHpcl(hpclVO);

            wrapperVO.setSuccess(true);
            wrapperVO.setMessage(egovMessageSource.getMessage("success.common.dstb"));
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }


    /**
     * 캠페인 - 해피콜 마감처리
     *
     * @param hpclVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/hpcl/closHpcl.do")
    public @ResponseBody String closHpcl(@ModelAttribute("hpclVO") HpclVO hpclVO) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            hpclVO.setUniqId(loginVO.getUniqId());

            hpclService.closHpcl(hpclVO);

            wrapperVO.setSuccess(true);
            wrapperVO.setMessage(egovMessageSource.getMessage("success.common.clos"));
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }


    /**
     * 해피콜 - 상담원 분배 팝업
     *
     * @param searchVO
     * @param hpclVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/hpcl/cnslrDstbPopup.do")
    public String cnslrDstbPopup(@ModelAttribute("searchVO") HpclDefaultVO searchVO, @ModelAttribute("hpclVO") HpclVO hpclVO, ModelMap model) throws Exception {

        model.addAttribute("hpclList", hpclVO.toListJson());
        model.addAttribute("hpclText", egovMessageSource.getMessage("hpcl.hpcl"));
        model.addAttribute("cnslrText", egovMessageSource.getMessage("hpcl.cnslr"));

        return "egovframework/ec4/call/outbd/hpcl/EC4CnslrDstbPopup";
    }


    /**
     * 상담원 분배
     *
     * @param hpclVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/hpcl/dstbCnslr.do")
    public @ResponseBody String dstbCnslr(@ModelAttribute("hpclVO") HpclVO hpclVO) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            hpclVO.setFrstRegisterId(loginVO.getUniqId());
            hpclVO.setLastUpdusrId(loginVO.getUniqId());

            hpclService.dstbCnslr(hpclVO);

            wrapperVO.setSuccess(true);
            wrapperVO.setMessage(egovMessageSource.getMessage("success.common.dstb"));
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }


    /**
     * 상담원 목록, 나중에 상담원 관련 패키지 생성후 변경해야함
     *
     * @param searchVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/hpcl/selectCnslrList.do")
    public @ResponseBody String selectCnslrList(@ModelAttribute("searchVO") CnslrDefaultVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));

        // 임시 생성 나중에 상담원 관련 package 생성후 변경해야함 2018-07-17
        ArrayList<EgovMap> cnslrList = hpclService.selectCnslrList(searchVO);
        int totalCount = hpclService.selectCnslrListCnt(searchVO);

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(cnslrList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }

}
