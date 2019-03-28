package egovframework.ec4.cmm.cinfo.ccm.service.impl;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.cmm.cinfo.ccm.service.CstmrCarDefaultVO;
import egovframework.ec4.cmm.cinfo.ccm.service.CstmrCarVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("cstmrCarDAO")
public class CstmrCarDAO extends EgovComAbstractDAO {

    /**
     * 고객 차량 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectCstmrCarList(CstmrCarDefaultVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("cstmrCarDAO.selectCstmrCarList", searchVO);
    }


    /**
     * 고객 차량 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCstmrCarListCnt(CstmrCarDefaultVO searchVO) throws Exception {

        return (int)select("cstmrCarDAO.selectCstmrCarListCnt", searchVO);
    }


    /**
     * 고객차량 상세
     *
     * @param cstmrCarVO
     * @return
     * @throws Exception
     */
    public EgovMap selectCstmrCar(CstmrCarVO cstmrCarVO) throws Exception {

        return (EgovMap)select("cstmrCarDAO.selectCstmrCar", cstmrCarVO);
    }

}
