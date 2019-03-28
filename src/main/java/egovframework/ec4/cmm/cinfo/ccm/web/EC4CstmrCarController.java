package egovframework.ec4.cmm.cinfo.ccm.web;

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
import egovframework.ec4.cmm.cinfo.ccm.service.CstmrCarDefaultVO;
import egovframework.ec4.cmm.cinfo.ccm.service.EC4CstmrCarService;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.EC4WebUtil;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;

/**
 * 고객 차량 관리 controller
 *
 * @author harry
 * @since 2018.07.27
 */
@Controller
public class EC4CstmrCarController {

    @Resource(name = "cstmrCarService")
    private EC4CstmrCarService cstmrCarService;

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


    @RequestMapping(value = "/ec4/cmm/cinfo/ccm/selectCstmrCarList.do")
    public @ResponseBody String selectCstmrCarList(@ModelAttribute("searchVO") CstmrCarDefaultVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));

        ArrayList<EgovMap> cstmrCarList = cstmrCarService.selectCstmrCarList(searchVO);
        int totalCount = cstmrCarService.selectCstmrCarListCnt(searchVO);

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(cstmrCarList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }

}
