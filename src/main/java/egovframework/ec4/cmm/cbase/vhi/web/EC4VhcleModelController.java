package egovframework.ec4.cmm.cbase.vhi.web;

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
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.ec4.cmm.cbase.vhi.service.EC4VhcleModelService;
import egovframework.ec4.cmm.cbase.vhi.service.VhcleDetailModelVO;
import egovframework.ec4.cmm.cbase.vhi.service.VhcleModelDefaultVO;
import egovframework.ec4.cmm.cbase.vhi.service.VhcleModelVO;
import egovframework.ec4.cmm.service.ComboWrapperVO;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.EC4WebUtil;
import egovframework.ec4.cmm.service.ResponseWrapperVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;

/**
 * @author harry
 * @since 2018.04.16
 */
@Controller
//@SessionAttributes(types = VhcleModelVO.class)
//@SessionAttributes("vhcleModelVO")
public class EC4VhcleModelController {

    @Resource(name = "vhcleModelService")
    private EC4VhcleModelService vhcleModelService;

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
     * 차량 정보 팝업
     *
     * @param searchVO
     * @return
     * @exception Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/vhi/vhcleModelPopup.do")
    public String vhcleModelPopup(@ModelAttribute("searchVO") VhcleModelDefaultVO searchVO, ModelMap model) throws Exception {

        return "egovframework/ec4/cmm/cbase/vhi/EC4VhcleModelPopup";
    }



    /**
     * 차량 정보 페이지 이동
     *
     * @param searchVO
     * @return
     * @exception Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/vhi/vhcleModelMng.do")
    public String vhcleModelMng(@ModelAttribute("searchVO") VhcleModelDefaultVO searchVO, @ModelAttribute("vhcleModelVO") VhcleModelVO vhcleModelVO,
            @ModelAttribute("vhcleDetailModelVO") VhcleDetailModelVO vhcleDetailModelVO, SessionStatus status, ModelMap model) throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        // 차종
        codeVO.setCodeId("VHCT");
        List<CmmnDetailCode> modelCodeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("modelCodeList", modelCodeList);

        // 제조사
        codeVO.setCodeId("VMCD");
        List<CmmnDetailCode> makrCodeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("makrCodeList", makrCodeList);


        model.addAttribute("vhcleModelVO", new VhcleModelVO());
        model.addAttribute("vhcleDetailModelVO", new VhcleDetailModelVO());
        
        model.addAttribute("vhcleModelId", "");

        //return "egovframework/ec4/cmm/cbase/vhi/EC4VhcleModelList";
        return "egovframework/ec4/cmm/cbase/vhi/EC4DetailVhcleModelMng";
    }



    /**
     * 차량 정보 상세모델등록 페이지 이동
     *
     * @param searchVO
     * @return
     * @exception Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/vhi/detailVhcleModelRegPopup.do")
    public String detailVhcleModelRegPopup(@ModelAttribute("searchVO") VhcleModelDefaultVO searchVO, @ModelAttribute("vhcleModelVO") VhcleModelVO vhcleModelVO,
            @ModelAttribute("popUpMngVO") VhcleDetailModelVO vhcleDetailModelVO, SessionStatus status, ModelMap model) throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        // 차종
        codeVO.setCodeId("VHCT");
        List<CmmnDetailCode> modelCodeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("modelCodeList", modelCodeList);

        // 제조사
        codeVO.setCodeId("VMCD");
        List<CmmnDetailCode> makrCodeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("makrCodeList", makrCodeList);


        model.addAttribute("vhcleModelVO", new VhcleModelVO());
        model.addAttribute("vhcleDetailModelVO", new VhcleDetailModelVO());

        //return "egovframework/ec4/cmm/cbase/vhi/EC4VhcleModelList";
        return "egovframework/ec4/cmm/cbase/vhi/EC4DetailVhcleModelMngRegPopup";
    }



    /**
     * 차량 정보 상세모델수정 페이지 이동
     *
     * @param searchVO
     * @return
     * @exception Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/vhi/detailVhcleModelModPopup.do")
    public String detailVhcleModelModPopup(@ModelAttribute("searchVO") VhcleModelDefaultVO searchVO, @ModelAttribute("vhcleModelVO") VhcleModelVO vhcleModelVO,
            @ModelAttribute("popUpMngVO") VhcleDetailModelVO vhcleDetailModelVO, SessionStatus status, ModelMap model) throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        // 차종
        codeVO.setCodeId("VHCT");
        List<CmmnDetailCode> modelCodeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("modelCodeList", modelCodeList);

        // 제조사
        codeVO.setCodeId("VMCD");
        List<CmmnDetailCode> makrCodeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("makrCodeList", makrCodeList);


        model.addAttribute("vhcleModelVO", new VhcleModelVO());
        model.addAttribute("vhcleDetailModelVO", new VhcleDetailModelVO());
        
        
        // select
        vhcleDetailModelVO.setValuesFromEgovMap(vhcleModelService.selectDetailVhcleModelMod(vhcleDetailModelVO));
        

        //return "egovframework/ec4/cmm/cbase/vhi/EC4VhcleModelList";
        return "egovframework/ec4/cmm/cbase/vhi/EC4DetailVhcleModelMngModPopup";
    }
    


    /**
     * 신규차량 모델정보 팝업
     *
     * @param searchVO
     * @return
     * @exception Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/vhi/newVhcleModelListPop.do")
    public String newVhcleModelListPop(@ModelAttribute("searchVO") VhcleModelDefaultVO searchVO, 
							    		@ModelAttribute("vhcleModelVO") VhcleModelVO vhcleModelVO, 
							    		@ModelAttribute("vhcleDetailModelVO") VhcleDetailModelVO vhcleDetailModelVO, 
							    		ModelMap model) throws Exception {

        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        // 차종
        codeVO.setCodeId("VHCT");
        List<CmmnDetailCode> modelCodeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("modelCodeList", modelCodeList);

        // 제조사
        codeVO.setCodeId("VMCD");
        List<CmmnDetailCode> makrCodeList = cmmUseService.selectCmmCodeDetail(codeVO);
        model.addAttribute("makrCodeList", makrCodeList);


        model.addAttribute("vhcleModelVO", new VhcleModelVO());
        model.addAttribute("vhcleDetailModelVO", new VhcleDetailModelVO());

        return "egovframework/ec4/cmm/cbase/vhi/EC4NewVhcleModelListPop";
    }
    
    
    
    
    
    
    
    
    
    
    
    


    /**
     * 모델 목록 조회 grid server-side
     *
     * @param searchVO
     * @return
     * @exception Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/vhi/selectVhcleModelList.do")
    public @ResponseBody String selectVhcleModelList(@ModelAttribute("searchVO") VhcleModelDefaultVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));

        List<EgovMap> vhcleModelList = vhcleModelService.selectVhcleModelList(searchVO);
        int totalCount = vhcleModelService.selectVhcleModelListCnt(searchVO);

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(vhcleModelList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }


    /**
     * 세부모델 목록 조회 grid server-side
     *
     * @param searchVO
     * @return
     * @exception Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/vhi/selectVhcleDetailModelList.do")
    public @ResponseBody String selectVhcleDetailModelList(@ModelAttribute("searchVO") VhcleModelDefaultVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));

        ArrayList<EgovMap> vhcleDetailModelList = new ArrayList<EgovMap>();
        int totalCount = 0;

        //if (StringUtils.isNotBlank(searchVO.getSearchVhcleModelId())) { EC4VhcleModelMng.jsp 상세리스트화면으로 변경하여 주석처리함  cjj190115

            vhcleDetailModelList = vhcleModelService.selectVhcleDetailModelList(searchVO);
            totalCount = vhcleModelService.selectVhcleDetailModelListCnt(searchVO);
        //}

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(vhcleDetailModelList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }


    /**
     * 인터페이스 세부모델 목록 조회 grid server-side
     *
     * @param searchVO
     * @return
     * @exception Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/vhi/selectLinkVhcleDetailModelList.do")
    public @ResponseBody String selectLinkVhcleDetailModelList(@ModelAttribute("searchVO") VhcleModelDefaultVO searchVO, ModelMap model, HttpServletRequest request)
            throws Exception {

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));

        ArrayList<EgovMap> vhcleDetailModelList = new ArrayList<EgovMap>();
        int totalCount = 0;

        //if (StringUtils.isNotBlank(searchVO.getSearchVhcleModelId())) { EC4VhcleModelMng.jsp 상세리스트화면으로 변경하여 주석처리함  cjj190115

            vhcleDetailModelList = vhcleModelService.selectLinkVhcleDetailModelList(searchVO);
            totalCount = vhcleModelService.selectLinkVhcleDetailModelListCnt(searchVO);
        //}

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(vhcleDetailModelList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }


    /**
     * 등록 액션
     *
     * @param vhcleModelVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/vhi/insertVhcleModel.do")
    public @ResponseBody String insertVhcleModel(@ModelAttribute("vhcleModelVO") VhcleModelVO vhcleModelVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            //beanValidator.validate(vhcleModelVO, bindingResult);  cjj190117- 제조사,차종코드를 사용하지않으므로 validate체크는 화면에서만 한다

            if (bindingResult.hasErrors()) {

                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {

                vhcleModelVO.setFrstRegisterId(loginVO.getUniqId());
                vhcleModelVO.setLastUpdusrId(loginVO.getUniqId());

                vhcleModelService.insertVhcleModel(vhcleModelVO);

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
     * 수정 액션
     *
     * @param vhcleModelVO
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/cmm/cbase/vhi/updateVhcleModel.do")
    public @ResponseBody String updateVhcleModel(@ModelAttribute("vhcleModelVO") VhcleModelVO vhcleModelVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            //beanValidator.validate(vhcleModelVO, bindingResult);  cjj190117- 제조사,차종코드를 사용하지않으므로 validate체크는 화면에서만 한다

            if (bindingResult.hasErrors()) {

                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {

            	//VHCTY_CODE 중복체크
            	int chkCnt = vhcleModelService.selectDupVhctyCodeVhcleModelCnt(vhcleModelVO);
            	if(chkCnt > 0){
                    wrapperVO.setSuccess(false);
                    wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.duplicate.code"));//중복된 코드가 존재합니다.
            	}else{
                    vhcleModelVO.setFrstRegisterId(loginVO.getUniqId());
                    vhcleModelVO.setLastUpdusrId(loginVO.getUniqId());

                    vhcleModelService.updateVhcleModel(vhcleModelVO);

                    wrapperVO.setSuccess(true);
                    wrapperVO.setMessage(egovMessageSource.getMessage("success.common.update"));
            	}
            }
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }


    /**
     * 모델 삭제 액션
     *
     * @param vhcleModelVO
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/cmm/cbase/vhi/deleteVhcleModel.do")
    public @ResponseBody String deleteVhcleModel(@ModelAttribute("vhcleModelVO") VhcleModelVO vhcleModelVO) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

        if (isAuthenticated) {

            vhcleModelService.deleteVhcleModel(vhcleModelVO);

            wrapperVO.setSuccess(true);
            wrapperVO.setMessage(egovMessageSource.getMessage("success.common.delete"));
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }


    /**
     * 세부 모델 등록 액션
     *
     * @param vhcleDetailModelVO
     * @param bindingResult
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/vhi/insertVhcleDetailModel.do")
    public @ResponseBody String insertVhcleDetailModel(@ModelAttribute("vhcleDetailModelVO") VhcleDetailModelVO vhcleDetailModelVO, BindingResult bindingResult)
            throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            //beanValidator.validate(vhcleDetailModelVO, bindingResult); cjj100116-필수항목체크는 화면내에서 has-warning 클래스체크한다. 주석이유는 필수가 아님에서 xml설정에따라 무조건 필수체크가되기에 필요없어서 주석처리한다 

            if (bindingResult.hasErrors()) {

                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {

                vhcleDetailModelVO.setFrstRegisterId(loginVO.getUniqId());
                vhcleDetailModelVO.setLastUpdusrId(loginVO.getUniqId());

                vhcleModelService.insertVhcleDetailModel(vhcleDetailModelVO);

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
     * 세부모델 수정 액션
     *
     * @param vhcleDetailModelVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/vhi/updateVhcleDetailModel.do")
    public @ResponseBody String updateVhcleDetailModel(@ModelAttribute("vhcleDetailModelVO") VhcleDetailModelVO vhcleDetailModelVO, BindingResult bindingResult) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            //beanValidator.validate(vhcleDetailModelVO, bindingResult); cjj100116-필수항목체크는 화면내에서 has-warning 클래스체크한다. 주석이유는 필수가 아님에서 xml설정에따라 무조건 필수체크가되기에 필요없어서 주석처리한다

            if (bindingResult.hasErrors()) {

                wrapperVO.setSuccess(false);
                wrapperVO.setErrors(bindingResult.getAllErrors());

                wrapperVO.setErrorMessages(ec4WebUtil.extractionErrorMessages(bindingResult.getAllErrors()));
            } else {

                vhcleDetailModelVO.setFrstRegisterId(loginVO.getUniqId());
                vhcleDetailModelVO.setLastUpdusrId(loginVO.getUniqId());

                vhcleModelService.updateVhcleDetailModel(vhcleDetailModelVO);

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
     * 세부모델 삭제 액션
     *
     * @param vhcleDetailModelVO
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/cmm/cbase/vhi/deleteVhcleDetailModel.do")
    public @ResponseBody String deleteVhcleDetailModel(@ModelAttribute("vhcleDetailModelVO") VhcleDetailModelVO vhcleDetailModelVO) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

        if (isAuthenticated) {

            vhcleModelService.deleteVhcleDetailModel(vhcleDetailModelVO);

            wrapperVO.setSuccess(true);
            wrapperVO.setMessage(egovMessageSource.getMessage("success.common.delete"));
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }


    /**
     * Link 세부모델 등록 액션
     *
     * @param vhcleDetailModelVO
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/cmm/cbase/vhi/insertLinkDetailVhcleModel.do")
    public @ResponseBody String insertLinkDetailVhcleModel(@ModelAttribute("vhcleDetailModelVO") VhcleDetailModelVO vhcleDetailModelVO) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            vhcleDetailModelVO.setFrstRegisterId(loginVO.getUniqId());
            vhcleDetailModelVO.setLastUpdusrId(loginVO.getUniqId());

            //System.out.println("==================  type 저장");
            int i = 0;
            int cnsltInBdLen = vhcleDetailModelVO.getDetailLinkVhcleModelTable().size();
            //System.out.println("==================  cnsltInBdLen["+cnsltInBdLen+"]");
            for(VhcleDetailModelVO vo : vhcleDetailModelVO.getDetailLinkVhcleModelTable()){
                i++;
                
                vo.setFrstRegisterId(loginVO.getUniqId());
                vo.setLastUpdusrId(loginVO.getUniqId());
                
                //System.out.println(vo.toString());
                if (StringUtils.isEmpty(vo.getVhcleModelId())) {
                    continue;
                }
                //System.out.println("==================  vo["+vo.toString()+"]");
                vhcleModelService.insertVhcleDetailModel(vo);
            }

            wrapperVO.setSuccess(true);
            wrapperVO.setMessage(egovMessageSource.getMessage("success.common.insert"));
        } else {

            wrapperVO.setSuccess(false);
            wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
        }

        return wrapperVO.toJson();
    }


    /**
     * <pre>
     * 차량모델 콤보
     * </pre>
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/vhi/selectVhclMdlComboList.do")
    public @ResponseBody String selectVhclMdlComboList(@ModelAttribute("searchVO") CmmnDetailCode searchVO) throws Exception {
    	
        ArrayList<CmmnDetailCode> codeList = new ArrayList<CmmnDetailCode>();
        
        //if (StringUtils.isNotBlank(searchVO.getUpCodeId())) {
        	codeList = (ArrayList<CmmnDetailCode>)vhcleModelService.selectVhclMdlComboList(searchVO);
        //}
        ComboWrapperVO wrapperVO = new ComboWrapperVO();
        wrapperVO.setResults(codeList);
        
        return wrapperVO.toJson();
    }


    /**
     * <pre>
     * 차량상세모델 콤보
     * </pre>
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/cmm/cbase/vhi/selectVhclDetlMdlComboList.do")
    public @ResponseBody String selectVhclDetlMdlComboList(@ModelAttribute("searchVO") CmmnDetailCode searchVO) throws Exception {
    	
        ArrayList<CmmnDetailCode> codeList = new ArrayList<CmmnDetailCode>();

        if (StringUtils.isNotBlank(searchVO.getUpCodeId())) {
        	codeList = (ArrayList<CmmnDetailCode>)vhcleModelService.selectVhclDetlMdlComboList(searchVO);
        }
        ComboWrapperVO wrapperVO = new ComboWrapperVO();
        wrapperVO.setResults(codeList);

        return wrapperVO.toJson();
    }

}
