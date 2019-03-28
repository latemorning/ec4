package egovframework.ec4.cbot.mmy.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.cbot.mmy.service.MblMyReceiveMngVO;

/**
 * 모바일 수신함화면에 대한 DAO 클래스를 정의한다.
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

@Repository("mblMyReceiveMngDAO")
public class MblMyReceiveMngDAO extends EgovComAbstractDAO {



    /**
	 * 목록을 조회한다.
	 * @param MblMyReceiveMngVO mblMyReceiveMngVO
	 * @return List<mblMyReceiveMngVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<MblMyReceiveMngVO> selectMblMyReceiveMng(MblMyReceiveMngVO mblMyReceiveMngVO) throws Exception {
        return (List<MblMyReceiveMngVO>) list("mblMyReceiveMngDAO.selectMblMyReceiveMng", mblMyReceiveMngVO);
    }


}
