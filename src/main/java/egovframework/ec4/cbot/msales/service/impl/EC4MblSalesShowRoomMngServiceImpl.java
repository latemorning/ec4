package egovframework.ec4.cbot.msales.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.cbot.msales.service.EC4MblSalesShowRoomMngService;
import egovframework.ec4.cbot.msales.service.MblSalesShowRoomMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * 모바일 가까운전시장확인화면에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("mblSalesShowRoomMngService")
public class EC4MblSalesShowRoomMngServiceImpl extends EgovAbstractServiceImpl implements EC4MblSalesShowRoomMngService {

	@Resource(name="mblSalesShowRoomMngDAO")
    private MblSalesShowRoomMngDAO mblSalesShowRoomMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param MblSalesShowRoomMngVO mblSalesShowRoomMngVO
	 * @return List<mblSalesShowRoomMngVO>
	 * @exception Exception
	 */
    public List<MblSalesShowRoomMngVO> selectMblSalesShowRoomMng(MblSalesShowRoomMngVO mblSalesShowRoomMngVO) throws Exception {
        return mblSalesShowRoomMngDAO.selectMblSalesShowRoomMng(mblSalesShowRoomMngVO);
    }


}
