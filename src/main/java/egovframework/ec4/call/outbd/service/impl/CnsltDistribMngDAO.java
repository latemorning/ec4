package egovframework.ec4.call.outbd.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.call.outbd.service.CnsltDistribMngVO;
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

@Repository("cnsltDistribMngDAO")
public class CnsltDistribMngDAO extends EgovComAbstractDAO {



    /**
	 * 목록을 조회한다.
	 * @param cnsltDistribMngVO cnsltDistribMngVO
	 * @return List<cnsltDistribMngVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<CnsltDistribMngVO> selectCnsltDistribMng(CnsltDistribMngVO cnsltDistribMngVO) throws Exception {
        return (List<CnsltDistribMngVO>) list("cnsltDistribMngDAO.selectCnsltDistribMng", cnsltDistribMngVO);
    }


    /**
     * 대상고객 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> searchCnsltDistribList(CnsltDistribMngVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("cnsltDistribMngDAO.searchCnsltDistribList", searchVO);
    }


    /**
     * 대상고객 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int searchCnsltDistribListCnt(CnsltDistribMngVO searchVO) throws Exception {

        return (int)select("cnsltDistribMngDAO.searchCnsltDistribListCnt", searchVO);
    }
	
	



    /**
     * 리스트 대상고객정보 등록 액션
     *
     * @param cnsltDistribMngVO
     * @throws Exception
     */
    public void insertCnsltDistrib(CnsltDistribMngVO cnsltDistribMngVO) throws Exception {

        insert("cnsltDistribMngDAO.insertCnsltDistrib", cnsltDistribMngVO);
    }
	
	



    /**
     * 리스트 대상고객정보 배분등록 액션
     *
     * @param cnsltDistribMngVO
     * @throws Exception
     */
    public void updateCnsltAsign(CnsltDistribMngVO cnsltDistribMngVO) throws Exception {

        insert("cnsltDistribMngDAO.updateCnsltAsign", cnsltDistribMngVO);
    }


}
