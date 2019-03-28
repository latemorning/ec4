package egovframework.ec4.call.inbd.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.call.inbd.service.SalesLeadRegMngVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * SALES리드 판매정보 상담에 대한 DAO 클래스를 정의한다.
 * @author 최재중
 * @since 2018.04.23
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2018.04.23  최재중          최초 생성
 *
 * </pre>
 */

@Repository("salesLeadRegMngDAO")
public class SalesLeadRegMngDAO extends EgovComAbstractDAO {



    /**
	 * 목록을 조회한다.
	 * @param salesLeadRegMngVO salesLeadRegMngVO
	 * @return List<salesLeadRegMngVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<SalesLeadRegMngVO> selectEC4CnsltInBound(SalesLeadRegMngVO salesLeadRegMngVO) throws Exception {
        return (List<SalesLeadRegMngVO>) list("salesLeadRegMngDAO.selectEC4CnsltInBound", salesLeadRegMngVO);
    }


    /**
     * SALES판매 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectSalesLeadRegList(SalesLeadRegMngVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("salesLeadRegMngDAO.selectSalesLeadRegList", searchVO);
    }


    /**
     * SALES판매 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectSalesLeadRegListCnt(SalesLeadRegMngVO searchVO) throws Exception {

        return (int)select("salesLeadRegMngDAO.selectSalesLeadRegListCnt", searchVO);
    }


    /**
     * SALES리드 판매정보 등록 액션
     *
     * @param salesLeadRegMngVO
     * @throws Exception
     */
    public void insertSalesLead(SalesLeadRegMngVO salesLeadRegMngVO) throws Exception {

        insert("salesLeadRegMngDAO.insertSalesLead", salesLeadRegMngVO);
    }


    /**
     * SALES리드 판매정보 PK순번
     *
     * @param salesLeadRegMngVO
     * @return
     * @throws Exception
     */
    public EgovMap selectLeadSeqChk(SalesLeadRegMngVO salesLeadRegMngVO) throws Exception {

        return (EgovMap)select("salesLeadRegMngDAO.selectLeadSeqChk", salesLeadRegMngVO);
    }


    /**
     * SALES리드 판매정보 수정모드 select
     *
     * @param salesLeadRegMngVO
     * @return
     * @throws Exception
     */
    public EgovMap selectSalesLeadMod(SalesLeadRegMngVO salesLeadRegMngVO) throws Exception {

        return (EgovMap)select("salesLeadRegMngDAO.selectSalesLeadMod", salesLeadRegMngVO);
    }


    /**
     * SALES리드 판매정보 수정 액션
     *
     * @param salesLeadRegMngVO
     * @throws Exception
     */
    public void updateSalesLead(SalesLeadRegMngVO salesLeadRegMngVO) throws Exception {

        update("salesLeadRegMngDAO.updateSalesLead", salesLeadRegMngVO);
    }


    /**
     * SALES리드 판매정보 삭제 액션
     *
     * @param salesLeadRegMngVO
     * @throws Exception
     */
    public void deleteSalesLead(SalesLeadRegMngVO salesLeadRegMngVO) throws Exception {

        delete("salesLeadRegMngDAO.deleteSalesLead", salesLeadRegMngVO);
    }


}
