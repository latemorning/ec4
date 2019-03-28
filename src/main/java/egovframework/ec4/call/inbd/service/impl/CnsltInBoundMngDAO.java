package egovframework.ec4.call.inbd.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.call.inbd.service.CnsltInBoundMngVO;
import egovframework.ec4.cmm.cbase.cmt.service.DetailCodeVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 인바운드콜 상담에 대한 DAO 클래스를 정의한다.
 * @author 최재중
 * @since 2018.04.16
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2018.04.16  최재중          최초 생성
 *
 * </pre>
 */

@Repository("cnsltInBoundMngDAO")
public class CnsltInBoundMngDAO extends EgovComAbstractDAO {



    /**
	 * 목록을 조회한다.
	 * @param cnsltInBoundMngVO cnsltInBoundMngVO
	 * @return List<cnsltInBoundMngVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<CnsltInBoundMngVO> selectEC4CnsltInBound(CnsltInBoundMngVO cnsltInBoundMngVO) throws Exception {
        return (List<CnsltInBoundMngVO>) list("cnsltInBoundMngDAO.selectEC4CnsltInBound", cnsltInBoundMngVO);
    }


    /**
     * 콜상담 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectCallCnsltHistList(CnsltInBoundMngVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("cnsltInBoundMngDAO.selectCallCnsltHistList", searchVO);
    }


    /**
     * 콜상담 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCallCnsltHistListCnt(CnsltInBoundMngVO searchVO) throws Exception {

        return (int)select("cnsltInBoundMngDAO.selectCallCnsltHistListCnt", searchVO);
    }


    /**
     * 계약/판매이력 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectCallContSalesList(CnsltInBoundMngVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("cnsltInBoundMngDAO.selectCallContSalesList", searchVO);
    }


    /**
     * 계약/판매이력 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCallContSalesListCnt(CnsltInBoundMngVO searchVO) throws Exception {

        return (int)select("cnsltInBoundMngDAO.selectCallContSalesListCnt", searchVO);
    }
    
    
    

    /**
     * 상담유형 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<EgovMap> selectInCallCnsltTypeList(CnsltInBoundMngVO searchVO) throws Exception {

        return (List<EgovMap>)list("cnsltInBoundMngDAO.selectInCallCnsltTypeList", searchVO);
    }


    /**
     * 상담유형 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectInCallCnsltTypeListCnt(CnsltInBoundMngVO searchVO) throws Exception {

        return (int)select("cnsltInBoundMngDAO.selectInCallCnsltTypeListCnt", searchVO);
    }



    /**
     * 인바운드상담내용 등록
     *
     * @param detailCodeVO
     * @throws Exception
     */
    public void insertCnsltInBoundReg(CnsltInBoundMngVO cnsltInBoundMngVO) throws Exception {

        insert("cnsltInBoundMngDAO.insertCnsltInBoundReg", cnsltInBoundMngVO);
    }



    /**
     * 인바운드상담내용 수정
     *
     * @param detailCodeVO
     * @throws Exception
     */
    public void updateCnsltInBoundReg(CnsltInBoundMngVO cnsltInBoundMngVO) throws Exception {

        update("cnsltInBoundMngDAO.updateCnsltInBoundReg", cnsltInBoundMngVO);
    }



    /**
     * 인바운드상담분류 등록
     *
     * @param detailCodeVO
     * @throws Exception
     */
    public void insertCnsltTypeReg(CnsltInBoundMngVO cnsltInBoundMngVO) throws Exception {

        insert("cnsltInBoundMngDAO.insertCnsltTypeReg", cnsltInBoundMngVO);
    }
    
    

    /**
     * 상담유형 목록 LOAD
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<EgovMap> selectCnsltTypeLoad(CnsltInBoundMngVO searchVO) throws Exception {

        return (List<EgovMap>)list("cnsltInBoundMngDAO.selectCnsltTypeLoad", searchVO);
    }


    /**
     * 고객상담내역조회 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectCallCnsltInBoundList(CnsltInBoundMngVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("cnsltInBoundMngDAO.selectCallCnsltInBoundList", searchVO);
    }


    /**
     * 고객상담내역조회 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCallCnsltInBoundListCnt(CnsltInBoundMngVO searchVO) throws Exception {

        return (int)select("cnsltInBoundMngDAO.selectCallCnsltInBoundListCnt", searchVO);
    }


    /**
     * 고객상담현황 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectCallCnsltInBoundStatList(CnsltInBoundMngVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("cnsltInBoundMngDAO.selectCallCnsltInBoundStatList", searchVO);
    }


    /**
     * 고객상담현황 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCallCnsltInBoundStatListCnt(CnsltInBoundMngVO searchVO) throws Exception {

        return (int)select("cnsltInBoundMngDAO.selectCallCnsltInBoundStatListCnt", searchVO);
    }


    /**
     * 의뢰현황 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectCallCnsltReqList(CnsltInBoundMngVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("cnsltInBoundMngDAO.selectCallCnsltReqList", searchVO);
    }


    /**
     * 의뢰현황 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCallCnsltReqListCnt(CnsltInBoundMngVO searchVO) throws Exception {

        return (int)select("cnsltInBoundMngDAO.selectCallCnsltReqListCnt", searchVO);
    }


    /**
     * 매니저처리 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectCnsltInBoundMgrProcList(CnsltInBoundMngVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("cnsltInBoundMngDAO.selectCnsltInBoundMgrProcList", searchVO);
    }


    /**
     * 매니저처리 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCnsltInBoundMgrProcListCnt(CnsltInBoundMngVO searchVO) throws Exception {

        return (int)select("cnsltInBoundMngDAO.selectCnsltInBoundMgrProcListCnt", searchVO);
    }


    /**
     * 상담내용 매니저처리
     *
     * @param cnsltInBoundMngVO
     * @return
     * @throws Exception
     */
    public EgovMap selectCnsltInBoundMgrProcLoad(CnsltInBoundMngVO cnsltInBoundMngVO) throws Exception {

        return (EgovMap)select("cnsltInBoundMngDAO.selectCnsltInBoundMgrProcLoad", cnsltInBoundMngVO);
    }


    /**
     * 고객정보 load select
     *
     * @param cnsltInBoundMngVO
     * @return
     * @throws Exception
     */
    public EgovMap loadCstmrLastInfo(CnsltInBoundMngVO cnsltInBoundMngVO) throws Exception {

        return (EgovMap)select("cnsltInBoundMngDAO.loadCstmrLastInfo", cnsltInBoundMngVO);
    }


    /**
     * 리콜내역 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectCallCarRecallList(CnsltInBoundMngVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("cnsltInBoundMngDAO.selectCallCarRecallList", searchVO);
    }


    /**
     * 리콜내역 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCallCarRecallListCnt(CnsltInBoundMngVO searchVO) throws Exception {

        return (int)select("cnsltInBoundMngDAO.selectCallCarRecallListCnt", searchVO);
    }


    /**
     * 개인소모품교환 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectCallCarPeriodList(CnsltInBoundMngVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("cnsltInBoundMngDAO.selectCallCarPeriodList", searchVO);
    }


    /**
     * 개인소모품교환 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCallCarPeriodListCnt(CnsltInBoundMngVO searchVO) throws Exception {

        return (int)select("cnsltInBoundMngDAO.selectCallCarPeriodListCnt", searchVO);
    }

}
