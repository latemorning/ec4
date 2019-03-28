package egovframework.ec4.cbot.mmy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.cbot.mmy.service.EC4MblMyEventMngService;
import egovframework.ec4.cbot.mmy.service.MblMyEventMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 모바일 이벤트행사화면에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("mblMyEventMngService")
public class EC4MblMyEventMngServiceImpl extends EgovAbstractServiceImpl implements EC4MblMyEventMngService {

	@Resource(name="mblMyEventMngDAO")
    private MblMyEventMngDAO mblMyEventMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param MblMyEventMngVO mblMyEventMngVO
	 * @return List<mblMyEventMngVO>
	 * @exception Exception
	 */
    public List<MblMyEventMngVO> selectMblMyEventMng(MblMyEventMngVO mblMyEventMngVO) throws Exception {
        return mblMyEventMngDAO.selectMblMyEventMng(mblMyEventMngVO);
    }


}
