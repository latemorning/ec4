package egovframework.ec4.call.outbd.smt.cmt.web;

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
import egovframework.ec4.call.outbd.smt.cmt.service.CntrctManageDefaultVO;
import egovframework.ec4.call.outbd.smt.cmt.service.CntrctManageVO;
import egovframework.ec4.call.outbd.smt.cmt.service.EC4CntrctManageService;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.EC4WebUtil;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;

@Controller
public class EC4CntrctManageController {

    @Resource(name = "cntrctManageService")
    private EC4CntrctManageService cntrctManageService;

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


    public EC4CntrctManageController() {
    }


    /**
     * 화면이동 import용 화면 (정비소 계약 목록)
     *
     * @param searchVO
     * @param cntrctManageVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/smt/cmt/cntrctManageList.do")
    public String cntrctManageList(@ModelAttribute("searchVO") CntrctManageDefaultVO searchVO, @ModelAttribute("cntrctManageVO") CntrctManageVO cntrctManageVO,
            ModelMap model) throws Exception {

        //ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        // 진행상태코드
        //codeVO.setCodeId("CMPST");
        //List<CmmnDetailCode> sttusCodeList = cmmUseService.selectCmmCodeDetail(codeVO);
        //model.addAttribute("sttusCodeList", sttusCodeList);

        //model.addAttribute("cmpgnIdText", egovMessageSource.getMessage("cmpgn.cmpgnId"));

        model.addAttribute("searchReplcCode", searchVO.getSearchReplcCode());

        return "egovframework/ec4/call/outbd/smt/cmt/EC4CntrctManageList";
    }


    /**
     * 정비소 계약 목록 data table
     *
     * @param searchVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/smt/cmt/selectCntrctManageList.do")
    public @ResponseBody String selectCntrctManageList(@ModelAttribute("searchVO") CntrctManageDefaultVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));

        ArrayList<EgovMap> cntrctManageList = cntrctManageService.selectCntrctManageList(searchVO);
        int totalCount = cntrctManageService.selectCntrctManageListCnt(searchVO);

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(cntrctManageList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }

}
