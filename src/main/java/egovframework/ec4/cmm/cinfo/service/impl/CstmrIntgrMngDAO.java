package egovframework.ec4.cmm.cinfo.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.cmm.cinfo.service.CstmrIntgrMngVO;
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

@Repository("cstmrIntgrMngDAO")
public class CstmrIntgrMngDAO extends EgovComAbstractDAO {



    /**
	 * 목록을 조회한다.
	 * @param cstmrIntgrMngVO cstmrIntgrMngVO
	 * @return List<cstmrIntgrMngVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<EgovMap> selectCstmrIntgrMngList(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
        return (List<EgovMap>) list("EC4cstmrIntgrMngSQL.selectCstmrIntgrMngList", cstmrIntgrMngVO);
    }


    public int selectCstmrIntgrMngListCnt(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
        return (int)select("EC4cstmrIntgrMngSQL.selectCstmrIntgrMngListCnt", cstmrIntgrMngVO);
    }



    /**
	 * 목록을 조회한다.
	 * @param cstmrIntgrMngVO cstmrIntgrMngVO
	 * @return List<cstmrIntgrMngVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<EgovMap> selectCstmrCarList(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
        return (List<EgovMap>) list("EC4cstmrIntgrMngSQL.selectCstmrCarList", cstmrIntgrMngVO);
    }


    public int selectCstmrCarListCnt(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
        return (int)select("EC4cstmrIntgrMngSQL.selectCstmrCarListCnt", cstmrIntgrMngVO);
    }



    /**
	 * 기존고객목록을 조회한다.
	 * @param cstmrIntgrMngVO cstmrIntgrMngVO
	 * @return List<cstmrIntgrMngVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<EgovMap> existCstmrSearchList(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
        return (List<EgovMap>) list("EC4cstmrIntgrMngSQL.existCstmrSearchList", cstmrIntgrMngVO);
    }


    public int existCstmrSearchListCnt(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
        return (int)select("EC4cstmrIntgrMngSQL.existCstmrSearchListCnt", cstmrIntgrMngVO);
    }


    /**
     * 고객통합정보 수정모드 select
     *
     * @param cstmrIntgrMngVO
     * @return
     * @throws Exception
     */
    public EgovMap selectCstmrIntgrMngMod(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {

        return (EgovMap)select("EC4cstmrIntgrMngSQL.selectCstmrIntgrMngMod", cstmrIntgrMngVO);
    }



    /**
     * 고객 등록
     *
     * @param detailCodeVO
     * @throws Exception
     */
    public void insertCstmrIntgrMng(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
    	insert("EC4cstmrIntgrMngSQL.insertCstmrIntgrMng", cstmrIntgrMngVO);
    }

    
    /**
     * 고객링크테이블 RelSeq
     *
     * @param CstmrIntgrMngVO
     * @throws Exception
     */
    public String getNextRelSeq(CstmrIntgrMngVO searchVO) throws Exception {
    return (String)select("EC4cstmrIntgrMngSQL.getNextRelSeq", searchVO);
    }


    /**
     * 고객차량취득테이블 등록
     *
     * @param CstmrIntgrMngVO
     * @throws Exception
     */
    public void insertCstmrLinkCarAcqs(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
    	insert("EC4cstmrIntgrMngSQL.insertCstmrLinkCarAcqs", cstmrIntgrMngVO);
    }


    /**
     * 고객링크테이블 등록
     *
     * @param CstmrIntgrMngVO
     * @throws Exception
     */
    public void insertCstmrInfoLinkMng(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
    	insert("EC4cstmrIntgrMngSQL.insertCstmrInfoLinkMng", cstmrIntgrMngVO);
    }



    /**
     * 고객정보 수정
     *
     * @param detailCodeVO
     * @throws Exception
     */
    public void updateCstmrIntgrLinkMng(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
    	update("EC4cstmrIntgrMngSQL.updateCstmrIntgrLinkMng", cstmrIntgrMngVO);
    }



    /**
     * 고객통합정보 수정
     *
     * @param detailCodeVO
     * @throws Exception
     */
    public void updateCstmrIntgrMng(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
    	update("EC4cstmrIntgrMngSQL.updateCstmrIntgrMng", cstmrIntgrMngVO);
    }



    /**
     * 고객통합정보 링크테이블 수정
     *
     * @param detailCodeVO
     * @throws Exception
     */
    public void updateCstmrInfoLinkMng(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
    	update("EC4cstmrIntgrMngSQL.updateCstmrInfoLinkMng", cstmrIntgrMngVO);
    }



    /**
     * 고객차량정보 삭제
     *
     * @param detailCodeVO
     * @throws Exception
     */
    public void deleteCstmrCarAcqs(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
    	delete("EC4cstmrIntgrMngSQL.deleteCstmrCarAcqs", cstmrIntgrMngVO);
    }
    /**
     * 고객링크테이블정보 삭제
     *
     * @param detailCodeVO
     * @throws Exception
     */
    public void deleteCstmrInfoLink(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
    	delete("EC4cstmrIntgrMngSQL.deleteCstmrInfoLink", cstmrIntgrMngVO);
    }
    /**
     * 고객통합정보 삭제
     *
     * @param detailCodeVO
     * @throws Exception
     */
    public void deleteCstmrIntgrMng(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
    	delete("EC4cstmrIntgrMngSQL.deleteCstmrIntgrMng", cstmrIntgrMngVO);
    }

    /*
     * 고객통합정보 사용여부체크
     * */
    public int cstmrInfoUseChkCnt(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
        return (int)select("EC4cstmrIntgrMngSQL.cstmrInfoUseChkCnt", cstmrIntgrMngVO);
    }
    public String cstmrInfoUseChkList(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
        return (String)select("EC4cstmrIntgrMngSQL.cstmrInfoUseChkList", cstmrIntgrMngVO);
    }



    /**
     * 고객링크테이블 최종정보
     *
     * @param detailCodeVO
     * @throws Exception
     */
    public void updateCstmrFinalYn(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
    	update("EC4cstmrIntgrMngSQL.updateCstmrFinalYn", cstmrIntgrMngVO);
    }



    /**
	 * 고객소유차량목록을 조회한다.
	 * @param cstmrIntgrMngVO cstmrIntgrMngVO
	 * @return List<cstmrIntgrMngVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<EgovMap> cstmrOwnerCarList(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
        return (List<EgovMap>) list("EC4cstmrIntgrMngSQL.cstmrOwnerCarList", cstmrIntgrMngVO);
    }


    public int cstmrOwnerCarListCnt(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
        return (int)select("EC4cstmrIntgrMngSQL.cstmrOwnerCarListCnt", cstmrIntgrMngVO);
    }


}
