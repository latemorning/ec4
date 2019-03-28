package egovframework.ec4.call.outbd.hpcl.service;

import java.util.ArrayList;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EC4HpclService {

    /**
     * 해피콜 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    ArrayList<EgovMap> selectHpclList(HpclDefaultVO searchVO) throws Exception;


    /**
     * 해피콜 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    int selectHpclListCnt(HpclDefaultVO searchVO) throws Exception;


    /**
     * 해피콜 - 캠페인 분배
     *
     * @param hpclVO
     * @throws Exception
     */
    void dstbHpcl(HpclVO hpclVO) throws Exception;


    /**
     * 상담원 목록 임시 메서드
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    ArrayList<EgovMap> selectCnslrList(CnslrDefaultVO searchVO) throws Exception;


    /**
     * 상담원 목록 카운트 임시 메서드
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    int selectCnslrListCnt(CnslrDefaultVO searchVO) throws Exception;


    /**
     * 해피콜 - 상담원 분배 insert
     *
     * @param hpclVO
     * @throws Exception
     */
    void dstbCnslr(HpclVO hpclVO) throws Exception;


    /**
     * 해피콜 - 상세
     *
     * @param hpclVO
     * @return
     * @throws Exception
     */
    EgovMap selectHpcl(HpclVO hpclVO) throws Exception;


    /**
     * 해피콜 필드 목록
     *
     * @param hpclVO
     * @return
     * @throws Exception
     */
    ArrayList<EgovMap> selectHpclFieldList(HpclVO hpclVO) throws Exception;


    /**
     * 콜상담 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    ArrayList<EgovMap> selectCallCnsltList(HpclDefaultVO searchVO) throws Exception;


    /**
     * 콜상담 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    int selectCallCnsltListCnt(HpclDefaultVO searchVO) throws Exception;


    /**
     * 상담원에 분배된 해피콜 카운트 (분배됐으면 1, 아니면 0)
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    int selectDstbCnt(HpclDefaultVO searchVO) throws Exception;


    /**
     * 해피콜 마감
     *
     * @param hpclVO
     * @throws Exception
     */
    void closHpcl(HpclVO hpclVO) throws Exception;

}
