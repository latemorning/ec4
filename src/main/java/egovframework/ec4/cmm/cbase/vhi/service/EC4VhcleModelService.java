package egovframework.ec4.cmm.cbase.vhi.service;

import java.util.ArrayList;
import java.util.List;

import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 차량관리 service
 *
 * @author harry
 */
public interface EC4VhcleModelService {

    /**
     * 모델 등록
     *
     * @param vo
     * @return 등록 결과
     * @exception Exception
     */
    String insertVhcleModel(VhcleModelVO vo) throws Exception;


    /**
     * 모델 수정
     *
     * @param vo
     * @return void형
     * @exception Exception
     */
    void updateVhcleModel(VhcleModelVO vo) throws Exception;


    /**
     * 모델 삭제
     *
     * @param vo
     * @return void형
     * @exception Exception
     */
    void deleteVhcleModel(VhcleModelVO vo) throws Exception;


    /**
     * 모델 목록 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    List<EgovMap> selectVhcleModelList(VhcleModelDefaultVO searchVO) throws Exception;


    /**
     * 모델 총 갯수 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    int selectVhcleModelListCnt(VhcleModelDefaultVO searchVO) throws Exception;


    /**
     * 세부모델 목록 조회
     *
     * @param searchVO
     * @return
     */
    ArrayList<EgovMap> selectVhcleDetailModelList(VhcleModelDefaultVO searchVO) throws Exception;


    /**
     * 세부모델 총 갯수 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    int selectVhcleDetailModelListCnt(VhcleModelDefaultVO searchVO) throws Exception;


    /**
     * 세부모델 등록
     *
     * @param vhcleModelVO
     * @throws Exception
     */
    void insertVhcleDetailModel(VhcleDetailModelVO vo) throws Exception;


    /**
     * 세부모델 수정
     *
     * @param vhcleDetailModelVO
     * @throws Exception
     */
    void updateVhcleDetailModel(VhcleDetailModelVO vhcleDetailModelVO) throws Exception;


    /**
     * 세부모델 삭제
     *
     * @param vhcleDetailModelVO
     * @throws Exception
     */
    void deleteVhcleDetailModel(VhcleDetailModelVO vhcleDetailModelVO) throws Exception;


    /**
     * 차량모델 콤보 egovMap형태로 return하지 않는다
     *
     * @param vhcleDetailModelVO
     * @throws Exception
     */
    public List<CmmnDetailCode> selectVhclMdlComboDfList(CmmnDetailCode searchVO) throws Exception;


    /**
     * 차량모델 콤보
     *
     * @param vhcleDetailModelVO
     * @throws Exception
     */
    public List<CmmnDetailCode> selectVhclMdlComboList(CmmnDetailCode searchVO) throws Exception;


    /**
     * 차량상세모델 콤보
     *
     * @param vhcleDetailModelVO
     * @throws Exception
     */
    public List<CmmnDetailCode> selectVhclDetlMdlComboList(CmmnDetailCode searchVO) throws Exception;


    /**
     * 차량상세모델 수정 load
     *
     * @param vhcleDetailModelVO
     * @throws Exception
     */
    EgovMap selectDetailVhcleModelMod(VhcleDetailModelVO vhcleDetailModelVO) throws Exception;


    /**
     * 인터페이스 세부모델 목록 조회
     *
     * @param searchVO
     * @return
     */
    ArrayList<EgovMap> selectLinkVhcleDetailModelList(VhcleModelDefaultVO searchVO) throws Exception;


    /**
     * 인터페이스 세부모델 총 갯수 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    int selectLinkVhcleDetailModelListCnt(VhcleModelDefaultVO searchVO) throws Exception;


    /**
     * 모델 차종코드중복체크 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    int selectDupVhctyCodeVhcleModelCnt(VhcleModelVO vo) throws Exception;

}
