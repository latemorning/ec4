package egovframework.ec4.cbot.mreg.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.cbot.mreg.service.EC4MblMembInfoMngService;
import egovframework.ec4.cbot.mreg.service.MblMembInfoMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 상담원에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("mblMembInfoMngService")
public class EC4MblMembInfoMngServiceImpl extends EgovAbstractServiceImpl implements EC4MblMembInfoMngService {

	@Resource(name="mblMembInfoMngDAO")
    private MblMembInfoMngDAO mblMembInfoMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param MblMyMngVO mblMembInfoMngVO
	 * @return List<mblMembInfoMngVO>
	 * @exception Exception
	 */
    public List<MblMembInfoMngVO> selectMblMembInfoMng(MblMembInfoMngVO mblMembInfoMngVO) throws Exception {
        return mblMembInfoMngDAO.selectMblMembInfoMng(mblMembInfoMngVO);
    }


}
