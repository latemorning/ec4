package egovframework.ec4.call.outbd.smt.ctm.web;

import java.util.ArrayList;

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

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.ec4.call.outbd.smt.ctm.service.CallTypeManageDefaultVO;
import egovframework.ec4.call.outbd.smt.ctm.service.CallTypeManageVO;
import egovframework.ec4.call.outbd.smt.ctm.service.EC4CallTypeManageService;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.EC4WebUtil;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;

@Controller
public class EC4CallTypeManageController {

    @Resource(name = "callTypeManageService")
    private EC4CallTypeManageService callTypeManageService;

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


    @RequestMapping(value = "/ec4/call/outbd/smt/ctm/callTypeManageMng.do")
    public String callTypeManageMng(@ModelAttribute("searchVO") CallTypeManageDefaultVO searchVO, @ModelAttribute("callTypeVO") CallTypeManageVO callTypeVO,
            ModelMap model) throws Exception {

        //ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        // 진행상태코드
        //codeVO.setCodeId("CMPST");
        //List<CmmnDetailCode> sttusCodeList = cmmUseService.selectCmmCodeDetail(codeVO);
        //model.addAttribute("sttusCodeList", sttusCodeList);

        //model.addAttribute("cmpgnIdText", egovMessageSource.getMessage("cmpgn.cmpgnId"));

        return "egovframework/ec4/call/outbd/smt/ctm/EC4CallTypeManageMng";
    }


    @RequestMapping(value = "/ec4/call/outbd/smt/ctm/selectCallTypeManageList.do")
    public @ResponseBody String selectCallTypeManageList(@ModelAttribute("searchVO") CallTypeManageDefaultVO searchVO, ModelMap model,
            HttpServletRequest request) throws Exception {

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));

        ArrayList<EgovMap> callTypeManageList = callTypeManageService.selectCallTypeManageList(searchVO);
        int totalCount = callTypeManageService.selectCallTypeManageListCnt(searchVO);

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(callTypeManageList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }


    @RequestMapping(value = "/ec4/call/outbd/smt/ctm/callTypeManageRegPopup.do")
    public String callTypeManageRegPopup(@ModelAttribute("searchVO") CallTypeManageDefaultVO searchVO, @ModelAttribute("callTypeManageVO") CallTypeManageVO callTypeManageVO, ModelMap model)
            throws Exception {

        return "egovframework/ec4/call/outbd/smt/ctm/EC4CallTypeManageRegPopup";
    }

}
