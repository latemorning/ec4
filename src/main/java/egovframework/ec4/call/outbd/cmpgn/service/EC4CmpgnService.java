package egovframework.ec4.call.outbd.cmpgn.service;

import java.util.ArrayList;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 캠페인 관리
 *
 * @author harry
 * @since 2018.06.25
 */
public interface EC4CmpgnService {

    /**
     * 캠페인 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    ArrayList<EgovMap> selectCmpgnList(CmpgnDefaultVO searchVO) throws Exception;


    /**
     * 캠페인 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    int selectCmpgnListCnt(CmpgnDefaultVO searchVO) throws Exception;


    /**
     * 캠페인 등록 액션
     *
     * @param cmpgnVO
     * @throws Exception
     */
    void insertCmpgn(CmpgnVO cmpgnVO) throws Exception;


    /**
     * 캠페인 detail
     *
     * @param cmpgnVO
     * @return
     * @throws Exception
     */
    EgovMap selectCmpgn(CmpgnVO cmpgnVO) throws Exception;


    /**
     * 캠페인 수정 액션
     *
     * @param cmpgnVO
     * @throws Exception
     */
    void updateCmpgn(CmpgnVO cmpgnVO) throws Exception;


    /**
     * 캠페인 삭제 액션
     *
     * @param cmpgnVO
     * @throws Exception
     */
    void deleteCmpgn(CmpgnVO cmpgnVO) throws Exception;

}
