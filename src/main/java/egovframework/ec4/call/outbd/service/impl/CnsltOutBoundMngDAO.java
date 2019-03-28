package egovframework.ec4.call.outbd.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.call.outbd.service.CnsltOutBoundMngVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 아웃바운드콜상담현황에 대한 DAO 클래스를 정의한다.
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

@Repository("cnsltOutBoundMngDAO")
public class CnsltOutBoundMngDAO extends EgovComAbstractDAO {



    /**
	 * 목록을 조회한다.
	 * @param cnsltOutBoundMngVO cnsltOutBoundMngVO
	 * @return List<cnsltOutBoundMngVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<CnsltOutBoundMngVO> selectCnsltOutBoundMng(CnsltOutBoundMngVO cnsltOutBoundMngVO) throws Exception {
        return (List<CnsltOutBoundMngVO>) list("cnsltOutBoundMngDAO.selectCnsltOutBoundMng", cnsltOutBoundMngVO);
    }


    /**
     * 대상고객 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> searchCnsltOutBoundList(CnsltOutBoundMngVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("cnsltOutBoundMngDAO.searchCnsltOutBoundList", searchVO);
    }


    /**
     * 대상고객 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int searchCnsltOutBoundListCnt(CnsltOutBoundMngVO searchVO) throws Exception {

        return (int)select("cnsltOutBoundMngDAO.searchCnsltOutBoundListCnt", searchVO);
    }
    
    

    /**
     * 콜대상고객 목록 LOAD
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<EgovMap> selectCnsltOutBoundMngLoad(CnsltOutBoundMngVO searchVO) throws Exception {

        return (List<EgovMap>)list("cnsltOutBoundMngDAO.selectCnsltOutBoundMngLoad", searchVO);
    }


}
