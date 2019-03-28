package egovframework.ec4.call.outbd.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.call.outbd.service.CnsltOutBoundTargetCustVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 아웃바운드콜상담 대상고객정보 상담에 대한 DAO 클래스를 정의한다.
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

@Repository("cnsltOutBoundTargetCustDAO")
public class CnsltOutBoundTargetCustDAO extends EgovComAbstractDAO {



    /**
     * Excel리스트 고객DB Load 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectCnsltTargetCustDBLoad(CnsltOutBoundTargetCustVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("cnsltOutBoundTargetCustDAO.selectCnsltTargetCustDBLoad", searchVO);
    }
	
	



    /**
     * Excel리스트 대상고객정보 등록 액션
     *
     * @param cnsltOutBoundTargetCustVO
     * @throws Exception
     */
    public void insertCnsltTargetCust(CnsltOutBoundTargetCustVO cnsltOutBoundTargetCustVO) throws Exception {

        insert("cnsltOutBoundTargetCustDAO.insertCnsltTargetCust", cnsltOutBoundTargetCustVO);
    }
    
    
	
	

    /**
	 * 목록을 조회한다.
	 * @param cnsltOutBoundTargetCustVO cnsltOutBoundTargetCustVO
	 * @return List<cnsltOutBoundTargetCustVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<CnsltOutBoundTargetCustVO> selectCnsltOutBoundTargetCust(CnsltOutBoundTargetCustVO cnsltOutBoundTargetCustVO) throws Exception {
        return (List<CnsltOutBoundTargetCustVO>) list("cnsltOutBoundTargetCustDAO.selectCnsltOutBoundTargetCust", cnsltOutBoundTargetCustVO);
    }


    /**
     * 대상고객 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> searchCnsltOutBoundTargetCustList(CnsltOutBoundTargetCustVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("cnsltOutBoundTargetCustDAO.searchCnsltOutBoundTargetCustList", searchVO);
    }


    /**
     * 대상고객 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int searchCnsltOutBoundTargetCustListCnt(CnsltOutBoundTargetCustVO searchVO) throws Exception {

        return (int)select("cnsltOutBoundTargetCustDAO.searchCnsltOutBoundTargetCustListCnt", searchVO);
    }


}
