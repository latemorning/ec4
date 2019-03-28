package egovframework.ec4.cbot.msales.web;


import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.SessionVO;
import egovframework.ec4.cbot.msales.service.EC4MblSalesShowRoomMngService;
import egovframework.ec4.cbot.msales.service.MblSalesShowRoomMngVO;
import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 모바일 가까운전시장확인화면에 관한 controller 클래스를 정의한다.
 * @author 최재중
 * @since 2018.04.26
 * @version 1.0
 * @see
 *
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2018.04.26  최재중          최초 생성
 *
 * </pre>
 */


@Controller
@SessionAttributes(types=SessionVO.class)
public class EC4MblSalesShowRoomMngController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "mblSalesShowRoomMngService")
    private EC4MblSalesShowRoomMngService mblSalesShowRoomMngService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Autowired
	private DefaultBeanValidator beanValidator;

    

    /**
	 * 모바일 가까운전시장확인화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/cbot/msales/mblSalesShowRoom.do")
    public String openEC4MblSalesShowRoomInfo()
            throws Exception {
        return "egovframework/ec4/cbot/msales/EC4MblSalesShowRoomInfo";
    }





    /**
	 * 목록을 조회한다
	 * @param MblSalesShowRoomMngVO mblSalesShowRoomMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cnslt/selectMblSalesShowRoomMng.do")
    public String selectEC4MblSalesShowRoomMng(@ModelAttribute("mblSalesShowRoomMngVO") MblSalesShowRoomMngVO mblSalesShowRoomMngVO,
    		                        ModelMap model)
            throws Exception {

    	System.out.println("2222222222222222222222222222222222222222222222222222222222");
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
    	System.out.println("11111111111111111111111111111111111111111111111111111111111");

        return "egovframework/ec4/call/cnslt/EC4MblSalesShowRoomMng";
    }

}
