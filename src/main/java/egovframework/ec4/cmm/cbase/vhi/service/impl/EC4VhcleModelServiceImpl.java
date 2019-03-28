package egovframework.ec4.cmm.cbase.vhi.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.ec4.cmm.cbase.vhi.service.EC4VhcleModelService;
import egovframework.ec4.cmm.cbase.vhi.service.VhcleDetailModelVO;
import egovframework.ec4.cmm.cbase.vhi.service.VhcleModelDefaultVO;
import egovframework.ec4.cmm.cbase.vhi.service.VhcleModelVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 차량모델 관리 ServiceImpl
 *
 * @author harry
 * @since 2018.04.16
 */
@Service("vhcleModelService")
public class EC4VhcleModelServiceImpl extends EgovAbstractServiceImpl implements EC4VhcleModelService {

    private static final Logger LOGGER = LoggerFactory.getLogger(EC4VhcleModelServiceImpl.class);

    @Resource(name = "vhcleModelDAO")
    private VhcleModelDAO vhcleModelDAO;

    /** ID Generation */
    @Resource(name = "ec4VhcleIdGnrService")
    private EgovIdGnrService vhcleIdGnrService;

    /** ID Generation */
    @Resource(name = "ec4VhcleDetailIdGnrService")
    private EgovIdGnrService vhcleDetailIdGnrService;


    /**
     * 모델 등록
     *
     * @param vo
     * @return 등록 결과
     * @exception Exception
     */
    @Override
    public String insertVhcleModel(VhcleModelVO vo) throws Exception {

        LOGGER.debug(vo.toString());

        /** ID Generation Service */
        String vhcleModelId = vhcleIdGnrService.getNextStringId();

        vo.setVhcleModelId(vhcleModelId);

        LOGGER.debug(vo.toString());

        vhcleModelDAO.insertVhcleModel(vo);

        return null;
    }


    /**
     * 모델 수정
     *
     * @param vo
     * @return void형
     * @exception Exception
     */
    @Override
    public void updateVhcleModel(VhcleModelVO vo) throws Exception {

        LOGGER.debug(vo.toString());

        vhcleModelDAO.updateVhcleModel(vo);
    }


    /**
     * 모델 삭제
     *
     * @param vo
     * @return void형
     * @exception Exception
     */
    @Override
    public void deleteVhcleModel(VhcleModelVO vo) throws Exception {

        vhcleModelDAO.deleteVhcleModel(vo);
    }


    /*
     * 모델 목록 조회
     *
     * @see egovframework.ec4.cmm.cbase.vhi.service.VhcleModelService#selectVhcleModelList(egovframework.ec4.cmm.cbase.vhi.service.VhcleModelDefaultVO)
     */
    @Override
    public List<EgovMap> selectVhcleModelList(VhcleModelDefaultVO searchVO) throws Exception {

        return vhcleModelDAO.selectVhcleModelList(searchVO);
    }


    /*
     * 모델 총 갯수 조회
     *
     * @see egovframework.ec4.cmm.cbase.vhi.service.EC4VhcleModelService#selectVhcleModelListCnt(egovframework.ec4.cmm.cbase.vhi.service.VhcleModelDefaultVO)
     */
    @Override
    public int selectVhcleModelListCnt(VhcleModelDefaultVO searchVO) throws Exception {

        return vhcleModelDAO.selectVhcleModelListCnt(searchVO);
    }


    /*
     * 세부모델 목록 조회
     *
     * @see egovframework.ec4.cmm.cbase.vhi.service.EC4VhcleModelService#selectVhcleDetailModelList(egovframework.ec4.cmm.cbase.vhi.service.VhcleModelDefaultVO)
     */
    @Override
    public ArrayList<EgovMap> selectVhcleDetailModelList(VhcleModelDefaultVO searchVO) throws Exception {

        return vhcleModelDAO.selectVhcleDetailModelList(searchVO);
    }


    /*
     * 세부모델 총 갯수 조회
     *
     * @see
     * egovframework.ec4.cmm.cbase.vhi.service.EC4VhcleModelService#selectVhcleDetailModelListCnt(egovframework.ec4.cmm.cbase.vhi.service.VhcleModelDefaultVO)
     */
    @Override
    public int selectVhcleDetailModelListCnt(VhcleModelDefaultVO searchVO) throws Exception {

        return vhcleModelDAO.selectVhcleDetailModelListCnt(searchVO);
    }


    /*
     * 세부모델 등록
     *
     * @see egovframework.ec4.cmm.cbase.vhi.service.EC4VhcleModelService#insertVhcleDetailModel(egovframework.ec4.cmm.cbase.vhi.service.VhcleModelVO)
     */
    @Override
    public void insertVhcleDetailModel(VhcleDetailModelVO vo) throws Exception {

        LOGGER.debug(vo.toString());

        /** ID Generation Service */
        String detailModelId = vhcleDetailIdGnrService.getNextStringId();

        vo.setDetailModelId(detailModelId);

        LOGGER.debug(vo.toString());

        vhcleModelDAO.insertVhcleDetailModel(vo);
    }


    /*
     * 세부모델 수정
     *
     * @see egovframework.ec4.cmm.cbase.vhi.service.EC4VhcleModelService#updateVhcleDetailModel(egovframework.ec4.cmm.cbase.vhi.service.VhcleDetailModelVO)
     */
    @Override
    public void updateVhcleDetailModel(VhcleDetailModelVO vhcleDetailModelVO) throws Exception {

        vhcleModelDAO.updateVhcleDetailModel(vhcleDetailModelVO);
    }


    /*
     * 세부모델 삭제
     *
     * @see egovframework.ec4.cmm.cbase.vhi.service.EC4VhcleModelService#deleteDetailModel(egovframework.ec4.cmm.cbase.vhi.service.VhcleDetailModelVO)
     */
    @Override
    public void deleteVhcleDetailModel(VhcleDetailModelVO vhcleDetailModelVO) throws Exception {

        vhcleModelDAO.deleteVhcleDetailModel(vhcleDetailModelVO);
    }

    
    /*
     * 차량모델 콤보박스
     */
    @Override
    public List<CmmnDetailCode> selectVhclMdlComboDfList(CmmnDetailCode searchVO) throws Exception {
    	return vhcleModelDAO.selectVhclMdlComboDfList(searchVO);
    }

    
    /*
     * 차량모델 콤보박스
     */
    @Override
    public List<CmmnDetailCode> selectVhclMdlComboList(CmmnDetailCode searchVO) throws Exception {
    	return vhcleModelDAO.selectVhclMdlComboList(searchVO);
    }

    
    /*
     * 차량상세모델 콤보박스
     */
    @Override
    public List<CmmnDetailCode> selectVhclDetlMdlComboList(CmmnDetailCode searchVO) throws Exception {
    	return vhcleModelDAO.selectVhclDetlMdlComboList(searchVO);
    }

    /*
     * 상세모델 수정모드 select
     */
    @Override
    public EgovMap selectDetailVhcleModelMod(VhcleDetailModelVO vhcleDetailModelVO) throws Exception {

        return vhcleModelDAO.selectDetailVhcleModelMod(vhcleDetailModelVO);
    }


    /*
     * 인터페이스 세부모델 목록 조회
     *
     */
    @Override
    public ArrayList<EgovMap> selectLinkVhcleDetailModelList(VhcleModelDefaultVO searchVO) throws Exception {

        return vhcleModelDAO.selectLinkVhcleDetailModelList(searchVO);
    }


    /*
     * 인터페이스 세부모델 총 갯수 조회
     *
     * @see
     */
    @Override
    public int selectLinkVhcleDetailModelListCnt(VhcleModelDefaultVO searchVO) throws Exception {

        return vhcleModelDAO.selectLinkVhcleDetailModelListCnt(searchVO);
    }


    /*
     * 모델코드 중복체크 조회
     *
     * @see
     */
    @Override
    public int selectDupVhctyCodeVhcleModelCnt(VhcleModelVO vo) throws Exception {

        return vhcleModelDAO.selectDupVhctyCodeVhcleModelCnt(vo);
    }

}
