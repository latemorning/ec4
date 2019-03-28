package egovframework.ec4.cbot.mmy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.cbot.mmy.service.EC4MblMyRecallMngService;
import egovframework.ec4.cbot.mmy.service.MblMyRecallMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 모바일 리콜확인화면에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("mblMyRecallMngService")
public class EC4MblMyRecallMngServiceImpl extends EgovAbstractServiceImpl implements EC4MblMyRecallMngService {

	@Resource(name="mblMyRecallMngDAO")
    private MblMyRecallMngDAO mblMyRecallMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param MblSalesInfoMngVO mblMyRecallMngVO
	 * @return List<mblMyRecallMngVO>
	 * @exception Exception
	 */
    public List<MblMyRecallMngVO> selectMblMyRecallMng(MblMyRecallMngVO mblMyRecallMngVO) throws Exception {
        return mblMyRecallMngDAO.selectMblMyRecallMng(mblMyRecallMngVO);
    }


}
