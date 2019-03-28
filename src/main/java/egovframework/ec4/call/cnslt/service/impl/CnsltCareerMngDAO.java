package egovframework.ec4.call.cnslt.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.call.cnslt.service.CnsltCareerMngVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 상담원에 대한 DAO 클래스를 정의한다.
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

@Repository("cnsltCareerMngDAO")
public class CnsltCareerMngDAO extends EgovComAbstractDAO {



    /**
	 * 목록을 조회한다.
	 * @param cnsltCareerMngVO cnsltCareerMngVO
	 * @return List<cnsltCareerMngVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<CnsltCareerMngVO> selectCnsltCareerMng(CnsltCareerMngVO cnsltCareerMngVO) throws Exception {
        return (List<CnsltCareerMngVO>) list("cnsltCareerMngDAO.selectCnsltCareerMng", cnsltCareerMngVO);
    }


    /**
     * 상담원근태 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectCnsltCareerRegList(CnsltCareerMngVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("cnsltCareerMngDAO.selectCnsltCareerRegList", searchVO);
    }


    /**
     * 상담원근태 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCnsltCareerRegListCnt(CnsltCareerMngVO searchVO) throws Exception {

        return (int)select("cnsltCareerMngDAO.selectCnsltCareerRegListCnt", searchVO);
    }


    /**
     * 상담원근태 등록 액션
     *
     * @param cnsltCareerMngVO
     * @throws Exception
     */
    public void insertCnsltCareer(CnsltCareerMngVO cnsltCareerMngVO) throws Exception {

        insert("cnsltCareerMngDAO.insertCnsltCareer", cnsltCareerMngVO);
    }


    /**
     * 상담원근태 수정모드 select
     *
     * @param cnsltCareerMngVO
     * @return
     * @throws Exception
     */
    public EgovMap selectCnsltCareerMod(CnsltCareerMngVO cnsltCareerMngVO) throws Exception {

        return (EgovMap)select("cnsltCareerMngDAO.selectCnsltCareerMod", cnsltCareerMngVO);
    }


    /**
     * 상담원근태 수정 액션
     *
     * @param cnsltCareerMngVO
     * @throws Exception
     */
    public void updateCnsltCareer(CnsltCareerMngVO cnsltCareerMngVO) throws Exception {

        update("cnsltCareerMngDAO.updateCnsltCareer", cnsltCareerMngVO);
    }


    /**
     * 상담원근태 삭제 액션
     *
     * @param cnsltCareerMngVO
     * @throws Exception
     */
    public void deleteCnsltCareer(CnsltCareerMngVO cnsltCareerMngVO) throws Exception {

        delete("cnsltCareerMngDAO.deleteCnsltCareer", cnsltCareerMngVO);
    }


}
