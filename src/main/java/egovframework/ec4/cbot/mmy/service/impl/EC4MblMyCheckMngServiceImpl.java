package egovframework.ec4.cbot.mmy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.cbot.mmy.service.EC4MblMyCheckMngService;
import egovframework.ec4.cbot.mmy.service.MblMyCheckMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 모바일 주기점검화면에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("mblMyCheckMngService")
public class EC4MblMyCheckMngServiceImpl extends EgovAbstractServiceImpl implements EC4MblMyCheckMngService {

	@Resource(name="mblMyCheckMngDAO")
    private MblMyCheckMngDAO mblMyCheckMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param MblMyCheckMngVO mblMyCheckMngVO
	 * @return List<mblMyCheckMngVO>
	 * @exception Exception
	 */
    public List<MblMyCheckMngVO> selectMblMyCheckMng(MblMyCheckMngVO mblMyCheckMngVO) throws Exception {
        return mblMyCheckMngDAO.selectMblMyCheckMng(mblMyCheckMngVO);
    }


}
