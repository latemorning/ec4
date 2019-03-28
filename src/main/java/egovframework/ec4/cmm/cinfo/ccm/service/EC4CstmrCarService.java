package egovframework.ec4.cmm.cinfo.ccm.service;

import java.util.ArrayList;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 고객 차량
 *
 * @author harry
 * @since 2018.07.27
 */
public interface EC4CstmrCarService {

    /**
     * 고객 차량 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    ArrayList<EgovMap> selectCstmrCarList(CstmrCarDefaultVO searchVO) throws Exception;


    /**
     * 고객 차량 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    int selectCstmrCarListCnt(CstmrCarDefaultVO searchVO) throws Exception;


    /**
     * 고객 차량 상세
     *
     * @param cstmrCarVO
     * @return
     * @throws Exception
     */
    EgovMap selectCstmrCar(CstmrCarVO cstmrCarVO) throws Exception;

}
