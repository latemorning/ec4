package egovframework.ec4.cmm.cbase.vhi.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.cmm.cbase.vhi.service.VhcleDetailModelVO;
import egovframework.ec4.cmm.cbase.vhi.service.VhcleModelDefaultVO;
import egovframework.ec4.cmm.cbase.vhi.service.VhcleModelVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.com.cmm.service.CmmnDetailCode;

/**
 * @author harry
 * @since 2018.04.16
 */
@Repository("vhcleModelDAO")
public class VhcleModelDAO extends EgovComAbstractDAO {

    /**
     * 등록
     *
     * @param vo
     * @return 등록 결과
     * @exception Exception
     */
    public String insertVhcleModel(VhcleModelVO vo) throws Exception {

        return (String)insert("vhcleModelDAO.insertVhcleModel", vo);
    }


    /**
     * 수정
     *
     * @param vo
     * @return void형
     * @exception Exception
     */
    public void updateVhcleModel(VhcleModelVO vo) throws Exception {

        update("vhcleModelDAO.updateVhcleModel", vo);
    }


    /**
     * 삭제
     *
     * @param vo
     * @return void형
     * @exception Exception
     */
    public void deleteVhcleModel(VhcleModelVO vo) throws Exception {

        delete("vhcleModelDAO.deleteVhcleModel", vo);
    }


    /**
     * 조회
     *
     * @param vo
     * @return
     * @exception Exception
     */
    //    public VhcleModelVO selectVhcleModel(VhcleModelVO vo) throws Exception {
    //
    //        return (VhcleModelVO)select("vhcleModelDAO.selectVhcleModel", vo);
    //    }

    /**
     * 모델 목록 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<EgovMap> selectVhcleModelList(VhcleModelDefaultVO searchVO) throws Exception {

        return (List<EgovMap>)list("vhcleModelDAO.selectVhcleModelList", searchVO);
    }


    /**
     * 모델 총 갯수 조회
     *
     * @param searchVO
     * @return
     */
    public int selectVhcleModelListCnt(VhcleModelDefaultVO searchVO) throws Exception {

        return (int)select("vhcleModelDAO.selectVhcleModelListCnt", searchVO);
    }


    /**
     * 세부모델 조회
     *
     * @param searchVO
     * @return
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectVhcleDetailModelList(VhcleModelDefaultVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("vhcleModelDAO.selectVhcleDetailModelList", searchVO);
    }


    /**
     * 세부모델 총 갯수 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectVhcleDetailModelListCnt(VhcleModelDefaultVO searchVO) throws Exception {

        return (int)select("vhcleModelDAO.selectVhcleDetailModelListCnt", searchVO);
    }


    /**
     * 세부모델 등록
     *
     * @param vo
     */
    public void insertVhcleDetailModel(VhcleDetailModelVO vo) throws Exception {

        insert("vhcleModelDAO.insertVhcleDetailModel", vo);
    }


    /**
     * 세부모델 수정
     *
     * @param vhcleDetailModelVO
     * @throws Exception
     */
    public void updateVhcleDetailModel(VhcleDetailModelVO vhcleDetailModelVO) throws Exception {

        update("vhcleModelDAO.updateVhcleDetailModel", vhcleDetailModelVO);

    }


    /**
     * 세부모델 삭제
     *
     * @param vhcleDetailModelVO
     * @throws Exception
     */
    public void deleteVhcleDetailModel(VhcleDetailModelVO vhcleDetailModelVO) throws Exception {

        delete("vhcleModelDAO.deleteVhcleDetailModel", vhcleDetailModelVO);
    }


    /**
     * 차량모델 콤보  egovMap형태로 return하지 않는다
     *
     * @param vhcleDetailModelVO
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<CmmnDetailCode> selectVhclMdlComboDfList(CmmnDetailCode searchVO) throws Exception {

    	return (List<CmmnDetailCode>) list("vhcleModelDAO.selectVhclMdlComboDfList", searchVO);
    }


    /**
     * 차량모델 콤보
     *
     * @param vhcleDetailModelVO
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<CmmnDetailCode> selectVhclMdlComboList(CmmnDetailCode searchVO) throws Exception {

    	return (List<CmmnDetailCode>) list("vhcleModelDAO.selectVhclMdlComboList", searchVO);
    }


    /**
     * 차량세부모델 콤보
     *
     * @param vhcleDetailModelVO
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<CmmnDetailCode> selectVhclDetlMdlComboList(CmmnDetailCode searchVO) throws Exception {

    	return (List<CmmnDetailCode>) list("vhcleModelDAO.selectVhclDetlMdlComboList", searchVO);
    }
    
    
    /**
     * 상세모델 수정모드 select
     *
     * @param vhcleDetailModelVO
     * @return
     * @throws Exception
     */
    public EgovMap selectDetailVhcleModelMod(VhcleDetailModelVO vhcleDetailModelVO) throws Exception {

        return (EgovMap)select("vhcleModelDAO.selectDetailVhcleModelMod", vhcleDetailModelVO);
    }


    /**
     * 인터페이스 세부모델 조회
     *
     * @param searchVO
     * @return
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectLinkVhcleDetailModelList(VhcleModelDefaultVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("vhcleModelDAO.selectLinkVhcleDetailModelList", searchVO);
    }


    /**
     * 인터페이스 세부모델 총 갯수 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectLinkVhcleDetailModelListCnt(VhcleModelDefaultVO searchVO) throws Exception {

        return (int)select("vhcleModelDAO.selectLinkVhcleDetailModelListCnt", searchVO);
    }


    /**
     * 모델코드 중복체크 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectDupVhctyCodeVhcleModelCnt(VhcleModelVO vo) throws Exception {

        return (int)select("vhcleModelDAO.selectDupVhctyCodeVhcleModelCnt", vo);
    }

}
