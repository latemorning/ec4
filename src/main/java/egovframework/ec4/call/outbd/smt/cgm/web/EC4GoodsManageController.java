package egovframework.ec4.call.outbd.smt.cgm.web;

import java.util.ArrayList;

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

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.ec4.call.outbd.smt.cgm.service.EC4GoodsManageService;
import egovframework.ec4.call.outbd.smt.cgm.service.GoodsManageDefaultVO;
import egovframework.ec4.call.outbd.smt.cgm.service.GoodsManageVO;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.EC4WebUtil;
import egovframework.ec4.cmm.service.ResponseWrapperVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;

@Controller
public class EC4GoodsManageController {

    @Resource(name = "goodsManageService")
    private EC4GoodsManageService goodsManageService;

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
     * 상품관리 목록 jsp forward
     *
     * @param searchVO
     * @param goodsManageVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/smt/cgm/goodsManageMng.do")
    public String goodsManageMng(@ModelAttribute("searchVO") GoodsManageDefaultVO searchVO, @ModelAttribute("goodsManageVO") GoodsManageVO goodsManageVO,
            ModelMap model) throws Exception {

        // 상품코드 text
        model.addAttribute("goodsCodeText", egovMessageSource.getMessage("goodsManage.goodsCode"));

        return "egovframework/ec4/call/outbd/smt/cgm/EC4GoodsManageMng";
    }


    /**
     * 상품관리 목록 grid server side
     *
     * @param searchVO
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/smt/cgm/selectGoodsManageList.do")
    public @ResponseBody String selectGoodsManageList(@ModelAttribute("searchVO") GoodsManageDefaultVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));

        ArrayList<EgovMap> goodsManageList = goodsManageService.selectGoodsManageList(searchVO);
        int totalCount = goodsManageService.selectGoodsManageListCnt(searchVO);

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(goodsManageList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }


    /**
     * 등록 팝업 jsp forward
     *
     * @param searchVO
     * @param goodsManageVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/smt/cgm/goodsManageRegPopup.do")
    public String goodsManageRegPopup(@ModelAttribute("searchVO") GoodsManageDefaultVO searchVO, @ModelAttribute("goodsManageVO") GoodsManageVO goodsManageVO,
            ModelMap model) throws Exception {

        return "egovframework/ec4/call/outbd/smt/cgm/EC4GoodsManageRegPopup";
    }


    /**
     * 등록 action
     *
     * @param goodsManageVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/smt/cgm/insertGoodsManage.do")
    public @ResponseBody String insertGoodsManage(@ModelAttribute("goodsManageVO") GoodsManageVO goodsManageVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            beanValidator.validate(goodsManageVO, bindingResult);

            if (bindingResult.hasErrors()) {

                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {

                goodsManageVO.setFrstRegisterId(loginVO.getUniqId());
                goodsManageVO.setLastUpdusrId(loginVO.getUniqId());

                goodsManageService.insertGoodsManage(goodsManageVO);

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
     * 수정 팝업 jsp forward
     *
     * @param searchVO
     * @param goodsManageVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/smt/cgm/goodsManageModPopup.do")
    public String goodsManageModPopup(@ModelAttribute("searchVO") GoodsManageDefaultVO searchVO, @ModelAttribute("goodsManageVO") GoodsManageVO goodsManageVO,
            ModelMap model) throws Exception {

        // detail select
        BeanUtils.populate(goodsManageVO, goodsManageService.selectGoodsManage(searchVO));

        // 상품코드 text
        model.addAttribute("goodsCodeText", egovMessageSource.getMessage("goodsManage.goodsCode"));

        return "egovframework/ec4/call/outbd/smt/cgm/EC4GoodsManageModPopup";
    }


    /**
     * 상품 수정 액션
     *
     * @param goodsManageVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/smt/cgm/updateGoodsManage.do")
    public @ResponseBody String updateGoodsManage(@ModelAttribute("goodsManageVO") GoodsManageVO goodsManageVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            beanValidator.validate(goodsManageVO, bindingResult);

            if (bindingResult.hasErrors()) {

                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {

                goodsManageVO.setFrstRegisterId(loginVO.getUniqId());
                goodsManageVO.setLastUpdusrId(loginVO.getUniqId());

                goodsManageService.updateGoodsManage(goodsManageVO);

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
     * 삭제 action
     *
     * @param goodsManageVO
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/call/outbd/smt/cgm/deleteGoodsManage.do")
    public @ResponseBody String deleteGoodsManage(@ModelAttribute("goodsManageVO") GoodsManageVO goodsManageVO) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

        if (isAuthenticated) {

            goodsManageService.deleteGoodsManage(goodsManageVO);

            wrapperVO.setSuccess(true);
            wrapperVO.setMessage(egovMessageSource.getMessage("success.common.delete"));
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }

}
