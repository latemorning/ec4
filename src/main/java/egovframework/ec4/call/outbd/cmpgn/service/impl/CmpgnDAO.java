package egovframework.ec4.call.outbd.cmpgn.service.impl;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.call.outbd.cmpgn.service.CmpgnDefaultVO;
import egovframework.ec4.call.outbd.cmpgn.service.CmpgnVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 캠페인 관리
 *
 * @author harry
 * @since 2018.06.25
 */
@Repository("cmpgnDAO")
public class CmpgnDAO extends EgovComAbstractDAO {

    /**
     * 캠페인 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectCmpgnList(CmpgnDefaultVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("cmpgnDAO.selectCmpgnList", searchVO);
    }


    /**
     * 캠페인 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCmpgnListCnt(CmpgnDefaultVO searchVO) throws Exception {

        return (int)select("cmpgnDAO.selectCmpgnListCnt", searchVO);
    }


    /**
     * 캠페인 등록 액션
     *
     * @param cmpgnVO
     * @throws Exception
     */
    public void insertCmpgn(CmpgnVO cmpgnVO) throws Exception {

        insert("cmpgnDAO.insertCmpgn", cmpgnVO);
    }


    /**
     * 캠페인 detail
     *
     * @param cmpgnVO
     * @return
     * @throws Exception
     */
    public EgovMap selectCmpgn(CmpgnVO cmpgnVO) throws Exception {

        return (EgovMap)select("cmpgnDAO.selectCmpgn", cmpgnVO);
    }


    /**
     * 캠페인 수정 액션
     *
     * @param cmpgnVO
     * @throws Exception
     */
    public void updateCmpgn(CmpgnVO cmpgnVO) throws Exception {

        update("cmpgnDAO.updateCmpgn", cmpgnVO);
    }


    /**
     * 캠페인 삭제 액션
     *
     * @param cmpgnVO
     * @throws Exception
     */
    public void deleteCmpgn(CmpgnVO cmpgnVO) throws Exception {

        delete("cmpgnDAO.deleteCmpgn", cmpgnVO);
    }

}
