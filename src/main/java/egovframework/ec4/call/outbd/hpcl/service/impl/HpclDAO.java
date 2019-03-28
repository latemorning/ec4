package egovframework.ec4.call.outbd.hpcl.service.impl;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.call.outbd.hpcl.service.CnslrDefaultVO;
import egovframework.ec4.call.outbd.hpcl.service.HpclDefaultVO;
import egovframework.ec4.call.outbd.hpcl.service.HpclVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 해피콜
 *
 * @author harry
 * @since 2018.07.26
 */
@Repository("hpclDAO")
public class HpclDAO extends EgovComAbstractDAO {

    /**
     * 해피콜 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectHpclList(HpclDefaultVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("hpclDAO.selectHpclList", searchVO);
    }


    /**
     * 해피콜 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectHpclListCnt(HpclDefaultVO searchVO) throws Exception {

        return (int)select("hpclDAO.selectHpclListCnt", searchVO);
    }


    /**
     * 해피콜 - 캠페인 분배
     *
     * @param hpclVO
     * @throws Exception
     */
    public void dstbHpcl(HpclVO hpclVO) throws Exception {

        insert("hpclDAO.dstbHpcl", hpclVO);
    }


    /**
     * 해피콜 - 캠페인 기존 분배 제거
     *
     * @param hpclVO
     * @throws Exception
     */
    public void removeHpcl(HpclVO hpclVO) throws Exception {

        delete("hpclDAO.removeHpcl", hpclVO);
    }


    /**
     * 임시메서드
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectCnslrList(CnslrDefaultVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("hpclDAO.selectCnslrList", searchVO);
    }


    /**
     * 임시메서드
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCnslrListCnt(CnslrDefaultVO searchVO) throws Exception {

        return (int)select("hpclDAO.selectCnslrListCnt", searchVO);
    }


    /**
     * 상담원 분배 update
     *
     * @param hpclVO
     * @throws Exception
     */
    public void dstbCnslrUpdate(HpclVO hpclVO) throws Exception {

        update("hpclDAO.dstbCnslrUpdate", hpclVO);
    }


    /**
     * 상담원 분배 insert
     *
     * @param hpclVO
     * @throws Exception
     */
    public void dstbCnslrInsert(HpclVO hpclVO) throws Exception {

        insert("hpclDAO.dstbCnslrInsert", hpclVO);
    }


    /**
     * 해피콜 상세
     *
     * @param hpclVO
     * @return
     * @throws Exception
     */
    public EgovMap selectHpcl(HpclVO hpclVO) throws Exception {

        return (EgovMap)select("hpclDAO.selectHpcl", hpclVO);
    }


    /**
     * 해피콜 필드 목록
     *
     * @param hpclVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectHpclFieldList(HpclVO hpclVO) throws Exception {

        return (ArrayList<EgovMap>)list("hpclDAO.selectHpclFieldList", hpclVO);
    }


    /**
     * 콜상담 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectCallCnsltList(HpclDefaultVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("hpclDAO.selectCallCnsltList", searchVO);
    }


    /**
     * 콜상담 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCallCnsltListCnt(HpclDefaultVO searchVO) throws Exception {

        return (int)select("hpclDAO.selectCallCnsltListCnt", searchVO);
    }


    /**
     * 상담원에 분배된 해피콜 카운트 (분배됐으면 1, 아니면 0)
     *
     * @param hpclVO
     * @return
     * @throws Exception
     */
    public int selectDstbCnt(HpclDefaultVO searchVO) throws Exception {

        return (int)select("hpclDAO.selectDstbCnt", searchVO);
    }


    /**
     * 해피콜 마감
     *
     * @param hpclVO
     * @throws Exception
     */
    public void closHpcl(HpclVO hpclVO) throws Exception {

        update("hpclDAO.closHpcl", hpclVO);
    }

}
