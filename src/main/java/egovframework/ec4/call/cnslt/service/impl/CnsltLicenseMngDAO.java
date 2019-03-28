package egovframework.ec4.call.cnslt.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.call.cnslt.service.CnsltLicenseMngVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 상담원에 대한 DAO 클래스를 정의한다.
 * @author 최재중
 * @since 2018.04.26
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2018.04.26  최재중          최초 생성
 *
 * </pre>
 */

@Repository("cnsltLicenseMngDAO")
public class CnsltLicenseMngDAO extends EgovComAbstractDAO {



    /**
	 * 목록을 조회한다.
	 * @param cnsltLicenseMngVO cnsltLicenseMngVO
	 * @return List<cnsltLicenseMngVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<CnsltLicenseMngVO> selectCnsltLicenseMng(CnsltLicenseMngVO cnsltLicenseMngVO) throws Exception {
        return (List<CnsltLicenseMngVO>) list("cnsltLicenseMngDAO.selectCnsltLicenseMng", cnsltLicenseMngVO);
    }


    /**
     * 상담원근태 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectCnsltLicenseRegList(CnsltLicenseMngVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("cnsltLicenseMngDAO.selectCnsltLicenseRegList", searchVO);
    }


    /**
     * 상담원근태 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCnsltLicenseRegListCnt(CnsltLicenseMngVO searchVO) throws Exception {

        return (int)select("cnsltLicenseMngDAO.selectCnsltLicenseRegListCnt", searchVO);
    }


    /**
     * 상담원근태 등록 액션
     *
     * @param cnsltLicenseMngVO
     * @throws Exception
     */
    public void insertCnsltLicense(CnsltLicenseMngVO cnsltLicenseMngVO) throws Exception {

        insert("cnsltLicenseMngDAO.insertCnsltLicense", cnsltLicenseMngVO);
    }


    /**
     * 상담원근태 수정모드 select
     *
     * @param cnsltLicenseMngVO
     * @return
     * @throws Exception
     */
    public EgovMap selectCnsltLicenseMod(CnsltLicenseMngVO cnsltLicenseMngVO) throws Exception {

        return (EgovMap)select("cnsltLicenseMngDAO.selectCnsltLicenseMod", cnsltLicenseMngVO);
    }


    /**
     * 상담원근태 수정 액션
     *
     * @param cnsltLicenseMngVO
     * @throws Exception
     */
    public void updateCnsltLicense(CnsltLicenseMngVO cnsltLicenseMngVO) throws Exception {

        update("cnsltLicenseMngDAO.updateCnsltLicense", cnsltLicenseMngVO);
    }


    /**
     * 상담원근태 삭제 액션
     *
     * @param cnsltLicenseMngVO
     * @throws Exception
     */
    public void deleteCnsltLicense(CnsltLicenseMngVO cnsltLicenseMngVO) throws Exception {

        delete("cnsltLicenseMngDAO.deleteCnsltLicense", cnsltLicenseMngVO);
    }


}
