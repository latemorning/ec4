package egovframework.ec4.cbot.mmy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.cbot.mmy.service.EC4MblMyCarDataMngService;
import egovframework.ec4.cbot.mmy.service.MblMyCarDataMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 모바일 내차차량제원화면에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("mblMyCarDataMngService")
public class EC4MblMyCarDataMngServiceImpl extends EgovAbstractServiceImpl implements EC4MblMyCarDataMngService {

	@Resource(name="mblMyCarDataMngDAO")
    private MblMyCarDataMngDAO mblMyCarDataMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param MblMyCarDataMngVO mblMyCarDataMngVO
	 * @return List<mblMyCarDataMngVO>
	 * @exception Exception
	 */
    public List<MblMyCarDataMngVO> selectMblMyCarDataMng(MblMyCarDataMngVO mblMyCarDataMngVO) throws Exception {
        return mblMyCarDataMngDAO.selectMblMyCarDataMng(mblMyCarDataMngVO);
    }


}
