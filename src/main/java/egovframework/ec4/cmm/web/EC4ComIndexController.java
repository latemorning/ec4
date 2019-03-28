package egovframework.ec4.cmm.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.sym.mnu.mpm.service.EgovMenuManageService;
import egovframework.com.sym.mnu.mpm.service.MenuManageVO;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.EC4CmmUseService;
import egovframework.ec4.cmm.service.EC4DefaultVO;
import egovframework.ec4.cmm.service.LeftMenuVO;
import egovframework.ec4.cmm.service.PopupTestDefaultVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;

/**
 * ec4 화면 구조 관련
 * <p>
 * <b>NOTE:</b>
 *
 * @author WIZVIL harry
 * @since 2018.04.02
 * @version 1.0
 * @see
 *
 *      <pre>
 * == 개정이력(Modification Information) ==
 *
 * 수정일        수정자      수정내용
 * ----------    --------    ---------------------------
 * 2018.04.02    harry       최초 생성
 *
 *      </pre>
 */
@Controller
@SessionAttributes("leftMenuVO")
public class EC4ComIndexController {

    private static final Logger LOGGER = LoggerFactory.getLogger(EC4ComIndexController.class);

    //private ArrayList<EgovMap> mainLeftMenu;

    /** EgovMenuManageService */
    @Resource(name = "meunManageService")
    private EgovMenuManageService menuManageService;


    @Resource(name = "ec4CmmUseService")
    private EC4CmmUseService ec4CmmUseService;


    // @SessionAttributes 설정과 관련
    @ModelAttribute("leftMenuVO")
    public LeftMenuVO setLeftMenu() {

        LOGGER.info("EC4CalIndexController default setLeftMenu is called ");
        return new LeftMenuVO();
    }


    /**
     * ec4메인, 권한 없을 때 이동하는 페이지 권한이 있을 때 호출되면 메인페이지로 이동
     *
     * @param model
     * @return
     */
    //    @RequestMapping("/ec4Index.do")
    //    public String ec4Index(ModelMap model) {
    //
    //        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    //        model.addAttribute("loginVO", loginVO);
    //
    //        return "egovframework/ec4/cmm/EC4UnitMain";
    //    }

    /**
     * popup test
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/cmm/ec4PopupTest.do")
    public String popupTest(@ModelAttribute("searchVO") EC4DefaultVO searchVO, ModelMap model) throws Exception {

        LOGGER.debug("EC4ComIndexController popupTest is called ");

        //model.addAttribute("callbackClass", searchVO.getCallbackClass());

        return "egovframework/ec4/cmm/EC4PopupTest";
    }


    /**
     * popup test datatable server-side
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4/cmm/ec4PopupTestList.do")
    public @ResponseBody String ec4PopupTestList(@ModelAttribute("searchVO") PopupTestDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {

        // 정렬할 필드명 셋팅
        searchVO.setSortColNm(UnderscoreUtil.convert2Underscore(StringUtils.defaultString(request.getParameter("mDataProp_" + searchVO.getiSortCol_0()))));

        List<EgovMap> popupTestList = ec4CmmUseService.selectPopupTestlList(searchVO);
        int totalCount = ec4CmmUseService.selectPopupTestlListCnt(searchVO);

        DataTableWrapperVO wrapperVO = new DataTableWrapperVO();
        wrapperVO.setAaData(popupTestList);
        wrapperVO.setiTotalRecords(totalCount);         // 전체 레코드 카운트
        wrapperVO.setiTotalDisplayRecords(totalCount);  // 필터링 된 전체 레코드 카운트
        wrapperVO.setsEcho(searchVO.getsEcho());

        return wrapperVO.toJson();
    }


    /**
     * ec4 top
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4Top.do")
    public String setTopMenu(ModelMap model) throws Exception {

        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

        if (isAuthenticated) {

        }

        LOGGER.debug("EC4CalIndexController index is called ");

        return "egovframework/ec4/cmm/EC4UnitTop";
    }


    /**
     * ec4 footer
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4Footer.do")
    public String setFooter(ModelMap model) throws Exception {

        //        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        //        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

        return "egovframework/ec4/cmm/EC4UnitFooter";
    }


    /**
     * <pre>
     * 메인 화면 이동
     * ec4 메인화면으로 변경
     * ec4 메인, 로그인 후 기본 페이지
     * </pre>
     *
     * @param model
     * @return
     */
    @RequestMapping("/EC4Content.do")
    public String setContent(ModelMap model) {

        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        model.addAttribute("loginVO", loginVO);

        return "egovframework/ec4/cmm/EC4UnitMain";
    }


    /**
     * ec4 left
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4Left.do")
    public String setLeftMenu(ModelMap model, @ModelAttribute LeftMenuVO leftMenuVO) throws Exception {

        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

        /* 최초 한 번만 실행하여 map에 저장해 놓는다. */
        if (isAuthenticated) {

            if (leftMenuVO == null || leftMenuVO.getLeftMenus() == null || leftMenuVO.getLeftMenus().size() < 1) {

                // 메뉴 저장
                // 2018-04-02 harry
                MenuManageVO menuManageVO = new MenuManageVO();
                menuManageVO.setTmpUniqId(loginVO.getUniqId());
                leftMenuVO.setLeftMenus((ArrayList<EgovMap>)menuManageService.selectMainMenuLeft(menuManageVO));

                // model.addAttribute("leftMenuVO", leftMenuVO);
            }

        } else {

            //leftMenuVO = new ArrayList<EgovMap>();
        }

        //model.addAttribute("leftMenuVO", leftMenuVO);

        LOGGER.debug("EC4CalIndexController index is called ");

        return "egovframework/ec4/cmm/EC4UnitLeft";
    }


    /**
     * ec4 left JSON
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/ec4LeftJson.do")
    public @ResponseBody LeftMenuVO setLeftMenuJson(ModelMap model, @ModelAttribute LeftMenuVO leftMenuVO) throws Exception {

        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

        /* 최초 한 번만 실행하여 map에 저장해 놓는다. */
        if (isAuthenticated) {
            if (leftMenuVO == null || leftMenuVO.getLeftMenus() == null || leftMenuVO.getLeftMenus().size() < 1) {

                // 메뉴 저장
                // 2018-04-02 harry
                MenuManageVO menuManageVO = new MenuManageVO();
                menuManageVO.setTmpUniqId(loginVO.getUniqId());
                leftMenuVO.setLeftMenus((ArrayList<EgovMap>)menuManageService.selectMainMenuLeft(menuManageVO));
            }
        }

        LOGGER.debug("EC4CalIndexController index is called");

        return leftMenuVO;
    }

}
