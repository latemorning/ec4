package egovframework.ec4.cmm.cbase.cmt.service.impl;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.cmm.cbase.cmt.service.DetailCodeDefaultVO;
import egovframework.ec4.cmm.cbase.cmt.service.DetailCodeVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 상세코드 관리
 *
 * @author harry
 * @since 2018.05.17
 */
@Repository("detailCodeDAO")
public class DetailCodeDAO extends EgovComAbstractDAO {

    /**
     * 상세코드 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectDetailCodeList(DetailCodeDefaultVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("detailCodeDAO.selectDetailCodeList", searchVO);
    }


    /**
     * 상세코드 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectDetailCodeListCnt(DetailCodeDefaultVO searchVO) throws Exception {

        return (int)select("detailCodeDAO.selectDetailCodeListCnt", searchVO);
    }


    /**
     * 상세코드 등록
     *
     * @param detailCodeVO
     * @throws Exception
     */
    public void insertDetailCode(DetailCodeVO detailCodeVO) throws Exception {

        insert("detailCodeDAO.insertDetailCode", detailCodeVO);
    }


    /**
     * 상세코드 수정
     *
     * @param detailCodeVO
     * @throws Exception
     */
    public void updateDetailCode(DetailCodeVO detailCodeVO) throws Exception {

        update("detailCodeDAO.updateDetailCode", detailCodeVO);
    }


    /**
     * 상세코드 상세 (1건)
     *
     * @param detailCodeVO
     * @return
     * @throws Exception
     */
    public EgovMap selectDetailCode(DetailCodeVO detailCodeVO) throws Exception {

        return (EgovMap)select("detailCodeDAO.selectDetailCode", detailCodeVO);
    }


    /**
     * 상세코드 삭제
     *
     * @param detailCodeVO
     * @throws Exception
     */
    public void deleteDetailCode(DetailCodeVO detailCodeVO) throws Exception {

        delete("detailCodeDAO.deleteDetailCode", detailCodeVO);
    }

}
