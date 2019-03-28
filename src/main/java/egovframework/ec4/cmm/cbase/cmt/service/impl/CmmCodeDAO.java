package egovframework.ec4.cmm.cbase.cmt.service.impl;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.cmm.cbase.cmt.service.CmmCodeDefaultVO;
import egovframework.ec4.cmm.cbase.cmt.service.CmmCodeVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 공통코드 관리
 *
 * @author harry
 * @since 2018.05.15
 */
@Repository("cmmCodeDAO")
public class CmmCodeDAO extends EgovComAbstractDAO {

    /**
     * 공통코드 목록 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectCmmCodeList(CmmCodeDefaultVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("cmmCodeDAO.selectCmmCodeList", searchVO);
    }


    /**
     * 공통코드 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCmmCodeListCnt(CmmCodeDefaultVO searchVO) throws Exception {

        return (int)select("cmmCodeDAO.selectCmmCodeListCnt", searchVO);
    }


    /**
     * 공통코드 삭제
     *
     * @param cmmCodeVO
     * @throws Exception
     */
    public void deleteCmmCode(CmmCodeVO cmmCodeVO) throws Exception {

        delete("cmmCodeDAO.deleteCmmCode", cmmCodeVO);
    }


    /**
     * 공통코드 등록
     *
     * @param cmmCodeVO
     * @throws Exception
     */
    public void insertCmmCode(CmmCodeVO cmmCodeVO) throws Exception {

        insert("cmmCodeDAO.insertCmmCode", cmmCodeVO);
    }


    /**
     * 공통코드 상세 (1건)
     *
     * @param cmmCodeVO
     * @return
     * @throws Exception
     */
    public EgovMap selectCmmCode(CmmCodeVO cmmCodeVO) throws Exception {

        return (EgovMap)select("cmmCodeDAO.selectCmmCode", cmmCodeVO);
    }


    /**
     * 공통코드 수정
     *
     * @param cmmCodeVO
     * @throws Exception
     */
    public void updateCmmCode(CmmCodeVO cmmCodeVO) throws Exception {

        update("cmmCodeDAO.updateCmmCode", cmmCodeVO);
    }

}
