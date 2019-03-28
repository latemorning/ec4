package egovframework.com.ec4.tmp.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.sec.drm.service.DeptAuthorVO;
import egovframework.com.sec.ram.service.AuthorManageVO;

/**
 * 임시 controller 클래스를 정의한다.
 *
 * @author WIZVIL harry
 * @since 2018.03.28
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2018.03.28  harry          최초 생성
 *
 *      </pre>
 */
@Controller
@SessionAttributes(types = SessionVO.class)
public class EgovTmpController {

	/**
	 * 임시 controller
	 *
	 * @param deptAuthorVO
	 * @param authorManageVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	//@IncludedInfo(name="임시컨트롤러",order = 4000 ,gid = 200)
	@RequestMapping(value = "/ec4/tmp/EgovTempList.do")
	public String selectTempList(@ModelAttribute("deptAuthorVO") DeptAuthorVO deptAuthorVO,
			@ModelAttribute("authorManageVO") AuthorManageVO authorManageVO, ModelMap model) throws Exception {

		System.out.println("============================================================================");

		return "egovframework/com/ec4/tmp/EgovTempList";
	}
}