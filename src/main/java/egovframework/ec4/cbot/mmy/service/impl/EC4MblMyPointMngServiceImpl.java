package egovframework.ec4.cbot.mmy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.cbot.mmy.service.EC4MblMyPointMngService;
import egovframework.ec4.cbot.mmy.service.MblMyPointMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 모바일 Auto포인트화면에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("mblMyPointMngService")
public class EC4MblMyPointMngServiceImpl extends EgovAbstractServiceImpl implements EC4MblMyPointMngService {

	@Resource(name="mblMyPointMngDAO")
    private MblMyPointMngDAO mblMyPointMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param MblMyPointMngVO mblMyPointMngVO
	 * @return List<mblMyPointMngVO>
	 * @exception Exception
	 */
    public List<MblMyPointMngVO> selectMblMyPointMng(MblMyPointMngVO mblMyPointMngVO) throws Exception {
        return mblMyPointMngDAO.selectMblMyPointMng(mblMyPointMngVO);
    }


}
