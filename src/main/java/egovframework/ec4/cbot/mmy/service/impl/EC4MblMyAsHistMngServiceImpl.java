package egovframework.ec4.cbot.mmy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.cbot.mmy.service.EC4MblMyAsHistMngService;
import egovframework.ec4.cbot.mmy.service.MblMyAsHistMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 모바일 정비이력화면에 관한 ServiceImpl 클래스를 정의한다.
 * @author 최재중
 * @since 2018.04.26
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2018.04.26  최재중          최초 생성
 *
 * </pre>
 */

@Service("mblMyAsHistMngService")
public class EC4MblMyAsHistMngServiceImpl extends EgovAbstractServiceImpl implements EC4MblMyAsHistMngService {

	@Resource(name="mblMyAsHistMngDAO")
    private MblMyAsHistMngDAO mblMyAsHistMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param MblMyAsHistMngVO mblMyAsHistMngVO
	 * @return List<mblMyAsHistMngVO>
	 * @exception Exception
	 */
    public List<MblMyAsHistMngVO> selectMblMyAsHistMng(MblMyAsHistMngVO mblMyAsHistMngVO) throws Exception {
        return mblMyAsHistMngDAO.selectMblMyAsHistMng(mblMyAsHistMngVO);
    }


}
