package egovframework.ec4.cmm.cbase.ctm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.cmm.cbase.ctm.service.CnsltTypeDefaultVO;
import egovframework.ec4.cmm.cbase.ctm.service.CnsltTypeVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 상담유형 관리
 *
 * @author harry
 * @since 2018.05.18
 */
@Repository("cnsltTypeDAO")
public class CnsltTypeDAO extends EgovComAbstractDAO {

    /**
     * 상담유형 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<EgovMap> selectCnsltTypeList(CnsltTypeDefaultVO searchVO) throws Exception {

        return (List<EgovMap>)list("cnsltTypeDAO.selectCnsltTypeList", searchVO);
    }


    /**
     * 상담유형 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCnsltTypeListCnt(CnsltTypeDefaultVO searchVO) throws Exception {

        return (int)select("cnsltTypeDAO.selectCnsltTypeListCnt", searchVO);
    }

    /**
     * 상담유형 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<EgovMap> selectCallCnsltTypeList(CnsltTypeDefaultVO searchVO) throws Exception {

        return (List<EgovMap>)list("cnsltTypeDAO.selectCallCnsltTypeList", searchVO);
    }


    /**
     * 상담유형 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCallCnsltTypeListCnt(CnsltTypeDefaultVO searchVO) throws Exception {

        return (int)select("cnsltTypeDAO.selectCallCnsltTypeListCnt", searchVO);
    }


    /**
     * 상담유형 등록
     *
     * @param cnsltTypeVO
     * @throws Exception
     */
    public void insertCnsltType(CnsltTypeVO cnsltTypeVO) throws Exception {

        insert("cnsltTypeDAO.insertCnsltType", cnsltTypeVO);
    }


    /**
     * 상담유형 상세
     *
     * @param cnsltTypeVO
     * @return
     * @throws Exception
     */
    public EgovMap selectCnsltType(CnsltTypeVO cnsltTypeVO) throws Exception {

        return (EgovMap)select("cnsltTypeDAO.selectCnsltType", cnsltTypeVO);
    }


    /**
     * 상담유형 수정
     *
     * @param cnsltTypeVO
     * @throws Exception
     */
    public void updateCnsltType(CnsltTypeVO cnsltTypeVO) throws Exception {

        update("cnsltTypeDAO.updateCnsltType", cnsltTypeVO);
    }


    /**
     * 상담유형 삭제
     *
     * @param cnsltTypeVO
     * @throws Exception
     */
    public void deleteCnsltType(CnsltTypeVO cnsltTypeVO) throws Exception {

        delete("cnsltTypeDAO.deleteCnsltType", cnsltTypeVO);
    }

}
