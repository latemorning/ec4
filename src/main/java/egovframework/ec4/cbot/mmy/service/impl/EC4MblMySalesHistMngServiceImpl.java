package egovframework.ec4.cbot.mmy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.cbot.mmy.service.EC4MblMySalesHistMngService;
import egovframework.ec4.cbot.mmy.service.MblMySalesHistMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 모바일 내차판매이력화면에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("mblMySalesHistMngService")
public class EC4MblMySalesHistMngServiceImpl extends EgovAbstractServiceImpl implements EC4MblMySalesHistMngService {

	@Resource(name="mblMySalesHistMngDAO")
    private MblMySalesHistMngDAO mblMySalesHistMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param MblMySalesHistMngVO mblMySalesHistMngVO
	 * @return List<mblMySalesHistMngVO>
	 * @exception Exception
	 */
    public List<MblMySalesHistMngVO> selectMblMySalesHistMng(MblMySalesHistMngVO mblMySalesHistMngVO) throws Exception {
        return mblMySalesHistMngDAO.selectMblMySalesHistMng(mblMySalesHistMngVO);
    }


}
