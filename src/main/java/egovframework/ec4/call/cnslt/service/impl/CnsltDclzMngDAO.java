package egovframework.ec4.call.cnslt.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.call.cnslt.service.CnsltDclzMngVO;
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

@Repository("cnsltDclzMngDAO")
public class CnsltDclzMngDAO extends EgovComAbstractDAO {



    /**
	 * 목록을 조회한다.
	 * @param cnsltDclzMngVO cnsltDclzMngVO
	 * @return List<cnsltDclzMngVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<CnsltDclzMngVO> selectCnsltDclzMng(CnsltDclzMngVO cnsltDclzMngVO) throws Exception {
        return (List<CnsltDclzMngVO>) list("cnsltDclzMngDAO.selectCnsltDclzMng", cnsltDclzMngVO);
    }


    /**
     * 상담원근태 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectCnsltDclzRegList(CnsltDclzMngVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("cnsltDclzMngDAO.selectCnsltDclzRegList", searchVO);
    }


    /**
     * 상담원근태 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCnsltDclzRegListCnt(CnsltDclzMngVO searchVO) throws Exception {

        return (int)select("cnsltDclzMngDAO.selectCnsltDclzRegListCnt", searchVO);
    }


    /**
     * 상담원근태 등록 액션
     *
     * @param cnsltDclzMngVO
     * @throws Exception
     */
    public void insertCnsltDclz(CnsltDclzMngVO cnsltDclzMngVO) throws Exception {

        insert("cnsltDclzMngDAO.insertCnsltDclz", cnsltDclzMngVO);
    }


    /**
     * 상담원근태 수정모드 select
     *
     * @param cnsltDclzMngVO
     * @return
     * @throws Exception
     */
    public EgovMap selectCnsltDclzMod(CnsltDclzMngVO cnsltDclzMngVO) throws Exception {

        return (EgovMap)select("cnsltDclzMngDAO.selectCnsltDclzMod", cnsltDclzMngVO);
    }


    /**
     * 상담원근태 수정 액션
     *
     * @param cnsltDclzMngVO
     * @throws Exception
     */
    public void updateCnsltDclz(CnsltDclzMngVO cnsltDclzMngVO) throws Exception {

        update("cnsltDclzMngDAO.updateCnsltDclz", cnsltDclzMngVO);
    }


    /**
     * 상담원근태 삭제 액션
     *
     * @param cnsltDclzMngVO
     * @throws Exception
     */
    public void deleteCnsltDclz(CnsltDclzMngVO cnsltDclzMngVO) throws Exception {

        delete("cnsltDclzMngDAO.deleteCnsltDclz", cnsltDclzMngVO);
    }


}
