package egovframework.ec4.cbot.mmy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.cbot.mmy.service.EC4MblMyCarBookMngService;
import egovframework.ec4.cbot.mmy.service.MblMyCarBookMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 모바일 차계부화면에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("mblMyCarBookMngService")
public class EC4MblMyCarBookMngServiceImpl extends EgovAbstractServiceImpl implements EC4MblMyCarBookMngService {

	@Resource(name="mblMyCarBookMngDAO")
    private MblMyCarBookMngDAO mblMyCarBookMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param MblMyCarBookMngVO mblMyCarBookMngVO
	 * @return List<mblMyCarBookMngVO>
	 * @exception Exception
	 */
    public List<MblMyCarBookMngVO> selectMblMyCarBookMng(MblMyCarBookMngVO mblMyCarBookMngVO) throws Exception {
        return mblMyCarBookMngDAO.selectMblMyCarBookMng(mblMyCarBookMngVO);
    }


}
