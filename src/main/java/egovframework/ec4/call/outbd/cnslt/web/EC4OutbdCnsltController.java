package egovframework.ec4.call.outbd.cnslt.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovDoubleSubmitHelper;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.uss.olp.qri.service.EgovQustnrRespondInfoService;
import egovframework.ec4.call.outbd.cmpgn.service.CmpgnVO;
import egovframework.ec4.call.outbd.cmpgn.service.EC4CmpgnService;
import egovframework.ec4.call.outbd.cnslt.service.EC4OutbdCnsltService;
import egovframework.ec4.call.outbd.cnslt.service.OutbdCnsltDefaultVO;
import egovframework.ec4.call.outbd.cnslt.service.OutbdCnsltVO;
import egovframework.ec4.call.outbd.hpcl.service.EC4HpclService;
import egovframework.ec4.call.outbd.hpcl.service.HpclVO;
import egovframework.ec4.cmm.cinfo.ccm.service.CstmrCarVO;
import egovframework.ec4.cmm.cinfo.ccm.service.EC4CstmrCarService;
import egovframework.ec4.cmm.cinfo.cmt.service.EC4CstmrService;
import egovframework.ec4.cmm.cinfo.ctm.service.CstmrVO;
import egovframework.ec4.cmm.service.EC4WebUtil;
import egovframework.ec4.cmm.service.GlobalEC4Variables;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 아웃바운드 상담
 *
 * @author harry
 */
@Controller
public class EC4OutbdCnsltController {

    private static final Logger LOGGER = LoggerFactory.getLogger(EC4OutbdCnsltController.class);

    // 아웃바운드 상담
    @Resource(name = "outbdCnsltService")
    private EC4OutbdCnsltService outbdCnsltService;

    @Resource(name = "cmpgnService")
    private EC4CmpgnService cmpgnService;

    // 고객 정보
    @Resource(name = "cstmrService")
    private EC4CstmrService cstmrService;

    // 고객 차량 정보
    @Resource(name = "cstmrCarService")
    private EC4CstmrCarService cstmrCarService;

    // 해피콜
    @Resource(name = "hpclService")
    private EC4HpclService hpclService;

    // 설문관리
    @Resource(name = "egovQustnrRespondInfoService")
    private EgovQustnrRespondInfoService egovQustnrRespondInfoService;

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
     * 아웃바운드 상담
     *
     * @param searchVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/cnslt/outbdCnsltMng.do")
    public String outbdCnsltMng(@ModelAttribute("searchVO") OutbdCnsltDefaultVO searchVO, ModelMap model) throws Exception {

        //ComDefaultCodeVO codeVO = new ComDefaultCodeVO();

        // 진행상태코드
        //codeVO.setCodeId("CMPST");
        //List<CmmnDetailCode> sttusCodeList = cmmUseService.selectCmmCodeDetail(codeVO);
        //model.addAttribute("sttusCodeList", sttusCodeList);

        //model.addAttribute("cmpgnIdText", egovMessageSource.getMessage("cmpgn.cmpgnId"));

        // 고객 정보
        CstmrVO cstmrVO = new CstmrVO();
        cstmrVO.setCstmrEsntlId(searchVO.getSearchCstmrEsntlId());
        //        cstmrVO.setValuesFromEgovMap(cstmrService.selectCstmr(cstmrVO));
        BeanUtils.populate(cstmrVO, cstmrService.selectCstmr(cstmrVO));

        // 차량 정보는 cstmrCar 에서 관리

        // 해피콜 정보
        HpclVO hpclVO = new HpclVO();
        hpclVO.setHpclId(searchVO.getSearchHpclId());
        //hpclVO.setValuesFromEgovMap(hpclService.selectHpcl(hpclVO));
        BeanUtils.populate(hpclVO, hpclService.selectHpcl(hpclVO));

        // 해피콜 필드 목록
        ArrayList<EgovMap> hpclFieldList = hpclService.selectHpclFieldList(hpclVO);

        // 설문관련 param map
        EgovMap paramMap = new EgovMap();
        paramMap.put("qestnrTmplatId", hpclVO.getQustnrTmplatId());
        paramMap.put("qestnrId", hpclVO.getQestnrId());
        paramMap.put("cstmrEsntlId", hpclVO.getCstmrEsntlId());

        //        System.out.println("-- qestnrTmplatId --" + paramMap.get("qestnrTmplatId"));
        //        System.out.println("-- qestnrId --" + paramMap.get("qestnrId"));

        // 캠페인, 설문지 정보
        CmpgnVO cmpgnVO = new CmpgnVO();
        cmpgnVO.setCmpgnId(searchVO.getSearchCmpgnId());
        BeanUtils.populate(cmpgnVO, cmpgnService.selectCmpgn(cmpgnVO));

        // 설문 정보
        // 설문템플릿정보
        //        model.addAttribute("QustnrTmplatManage",  egovQustnrRespondInfoService.selectQustnrTmplatManage(paramMap));

        //설문지 정보
        //        model.addAttribute("Comtnqestnrinfo",  egovQustnrRespondInfoService.selectQustnrRespondInfoManageComtnqestnrinfo(paramMap));
        //문항정보
        model.addAttribute("Comtnqustnrqesitm", egovQustnrRespondInfoService.selectQustnrRespondInfoManageComtnqustnrqesitm(paramMap));
        //항목정보
        model.addAttribute("Comtnqustnriem", egovQustnrRespondInfoService.selectQustnrRespondInfoManageComtnqustnriem(paramMap));

        //설문템플릿ID 설정
        model.addAttribute("qestnrTmplatId", hpclVO.getQustnrTmplatId());
        //설문지정보ID 설정
        model.addAttribute("qestnrId", hpclVO.getQestnrId());

        model.addAttribute("hpclVO", hpclVO);
        model.addAttribute("cstmrVO", cstmrVO);
        model.addAttribute("cmpgnVO", cmpgnVO);
        model.addAttribute("hpclFieldList", hpclFieldList);

        return "egovframework/ec4/call/outbd/cnslt/EC4OutbdCnsltMng";
    }


    /**
     * 아웃바운드 상담화면2
     *
     * @param searchVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ec4/call/outbd/cnslt/outbdCallCnsltMng.do")
    public String outbdCallCnsltMng(@ModelAttribute("searchVO") OutbdCnsltDefaultVO searchVO, ModelMap model) throws Exception {

        // 고객 정보
        CstmrVO cstmrVO = new CstmrVO();
        cstmrVO.setCstmrEsntlId(searchVO.getSearchCstmrEsntlId());
        BeanUtils.populate(cstmrVO, cstmrService.selectCstmr(cstmrVO));
        // 수신동의 구분코드(모바일)
        cstmrVO.setRecptnAgreSeCode(GlobalEC4Variables.EC4_REPAGR_AGMBT);

        // 차량 정보는 cstmrCar 에서 관리
        CstmrCarVO cstmrCarVO = new CstmrCarVO();
        cstmrCarVO.setVhcleEsntlId(searchVO.getSearchVhcleEsntlId());
        //        cstmrCarVO.setValuesFromEgovMap(cstmrCarService.selectCstmrCar(cstmrCarVO));
        BeanUtils.populate(cstmrCarVO, cstmrCarService.selectCstmrCar(cstmrCarVO));

        // 해피콜 정보
        HpclVO hpclVO = new HpclVO();
        hpclVO.setHpclId(searchVO.getSearchHpclId());
        BeanUtils.populate(hpclVO, hpclService.selectHpcl(hpclVO));


        // 콜 횟수가 2회 미만
        // 코드가 없거나, 부재중일경우만 등록 가능
        ComDefaultCodeVO codeVO = new ComDefaultCodeVO();
        List<CmmnDetailCode> progrsResultCode = null;

        if (Integer.parseInt(hpclVO.getCallCnt()) < 2) {
            if (StringUtils.isBlank(hpclVO.getFrstCallResultCode()) || StringUtils.equals(hpclVO.getFrstCallResultCode(), GlobalEC4Variables.EC4_CLRSLT090)) {

                // 진행상태코드
                codeVO.setCodeId("CLRSLTCD");
                progrsResultCode = cmmUseService.selectCmmCodeDetail(codeVO);
            }
        }

        model.addAttribute("progrsResultCode", progrsResultCode);

        model.addAttribute("hpclVO", hpclVO);
        model.addAttribute("cstmrVO", cstmrVO);
        model.addAttribute("cstmrCarVO", cstmrCarVO);

        return "egovframework/ec4/call/outbd/cnslt/EC4OutbdCallCnsltMng";
    }


    /**
     * 아웃바운드 상담 저장 처리
     *
     * @param hpclVO
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/call/outbd/cnslt/insertCnsltResult.do")
    public String insertCnsltResult(@ModelAttribute("outbdCnsltVO") OutbdCnsltVO outbdCnsltVO, ModelMap model) throws Exception {

        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

        if (isAuthenticated) {

            if (EgovDoubleSubmitHelper.checkAndSaveToken()) {

                outbdCnsltVO.setFrstRegisterId(loginVO.getUniqId());
                outbdCnsltVO.setLastUpdusrId(loginVO.getUniqId());
                outbdCnsltVO.setCallOpetrEsntlId(loginVO.getUniqId());  // 콜처리자 고유ID
                outbdCnsltVO.setUniqId(loginVO.getUniqId());            // 로그인 사용자 고유ID

                // 해피콜 처리 이력 상담결과 등록
                outbdCnsltService.insertCnsltResult(outbdCnsltVO);

                model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
            }
        }

        return "forward:/ec4/call/outbd/cnslt/outbdCallCnsltMng.do";
    }

}
