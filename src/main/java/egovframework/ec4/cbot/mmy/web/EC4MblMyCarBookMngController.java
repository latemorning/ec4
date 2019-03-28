package egovframework.ec4.cbot.mmy.web;


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
import egovframework.ec4.cbot.mmy.service.EC4MblMyCarBookMngService;
import egovframework.ec4.cbot.mmy.service.MblMyCarBookMngVO;
import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 모바일 차계부화면에 관한 controller 클래스를 정의한다.
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
public class EC4MblMyCarBookMngController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "mblMyCarBookMngService")
    private EC4MblMyCarBookMngService mblMyCarBookMngService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Autowired
	private DefaultBeanValidator beanValidator;

    

    /**
	 * 모바일 차계부화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/cbot/mmy/mblMyCarBook.do")
    public String openEC4MblMyCarBookInfo()
            throws Exception {
        return "egovframework/ec4/cbot/mmy/EC4MblMyCarBookInfo";
    }





    /**
	 * 목록을 조회한다
	 * @param MblMyCarBookMngVO mblMyCarBookMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/ec4/call/cnslt/selectMblMyCarBookMng.do")
    public String selectEC4MblMyCarBookMng(@ModelAttribute("mblMyCarBookMngVO") MblMyCarBookMngVO mblMyCarBookMngVO,
    		                        ModelMap model)
            throws Exception {

    	System.out.println("2222222222222222222222222222222222222222222222222222222222");
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
    	System.out.println("11111111111111111111111111111111111111111111111111111111111");

        return "egovframework/ec4/call/cnslt/EC4MblMyCarBookMng";
    }

}
