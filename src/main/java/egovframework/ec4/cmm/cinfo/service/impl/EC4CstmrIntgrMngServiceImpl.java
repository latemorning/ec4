package egovframework.ec4.cmm.cinfo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.cmm.cinfo.service.EC4CstmrIntgrMngService;
import egovframework.ec4.cmm.service.PopupTestDefaultVO;
import egovframework.ec4.cmm.cinfo.service.CstmrIntgrMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 상담원에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("cstmrIntgrMngService")
public class EC4CstmrIntgrMngServiceImpl extends EgovAbstractServiceImpl implements EC4CstmrIntgrMngService {

	@Resource(name="cstmrIntgrMngDAO")
    private CstmrIntgrMngDAO cstmrIntgrMngDAO;

    /** ID Generation */
    @Resource(name = "ec4CallCustIdGnrService")
    private EgovIdGnrService callCustIdGnrService;

    /** ID Generation */
    @Resource(name = "ec4CstmrEsntlIdGnrService")
    private EgovIdGnrService cstmrEsntlIdGnrService;
    
    
    
    


    /**
	 * 목록을 조회한다.
	 * @param cstmrIntgrMngVO cstmrIntgrMngVO
	 * @return List<cstmrIntgrMngVO>
	 * @exception Exception
	 */
    @Override
    public List<EgovMap> selectCstmrIntgrMngList(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
        return cstmrIntgrMngDAO.selectCstmrIntgrMngList(cstmrIntgrMngVO);
    }


    @Override
    public int selectCstmrIntgrMngListCnt(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
        return cstmrIntgrMngDAO.selectCstmrIntgrMngListCnt(cstmrIntgrMngVO);
    }

    /**
	 * 목록을 조회한다.
	 * @param cstmrIntgrMngVO cstmrIntgrMngVO
	 * @return List<cstmrIntgrMngVO>
	 * @exception Exception
	 */
    @Override
    public List<EgovMap> selectCstmrCarList(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
        return cstmrIntgrMngDAO.selectCstmrCarList(cstmrIntgrMngVO);
    }


    @Override
    public int selectCstmrCarListCnt(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
        return cstmrIntgrMngDAO.selectCstmrCarListCnt(cstmrIntgrMngVO);
    }

    /**
	 * 기존고객목록을 조회한다.
	 * @param cstmrIntgrMngVO cstmrIntgrMngVO
	 * @return List<cstmrIntgrMngVO>
	 * @exception Exception
	 */
    @Override
    public List<EgovMap> existCstmrSearchList(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
        return cstmrIntgrMngDAO.existCstmrSearchList(cstmrIntgrMngVO);
    }


    @Override
    public int existCstmrSearchListCnt(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
        return cstmrIntgrMngDAO.existCstmrSearchListCnt(cstmrIntgrMngVO);
    }



    /*
     * 고객 등록
     */
    @Override
    public void insertCstmrIntgrMng(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
    	//String strCstmrCd = callCustIdGnrService.getNextStringId();
    	String strCstmrCd = cstmrEsntlIdGnrService.getNextStringId();
    	cstmrIntgrMngVO.setCstmrCd(strCstmrCd);
    	
    	cstmrIntgrMngDAO.insertCstmrIntgrMng(cstmrIntgrMngVO);
    }



    /*
     * 신규고객 등록
     */
    @Override
    public void insertCstmrIntgrMngNew(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
    	//String strCstmrCd = callCustIdGnrService.getNextStringId();
    	String strCstmrCd = cstmrEsntlIdGnrService.getNextStringId();
    	cstmrIntgrMngVO.setCstmrCd(strCstmrCd);
    	cstmrIntgrMngDAO.insertCstmrIntgrMng(cstmrIntgrMngVO);
    	
    	//Link테이블에 고객코드값 없이 Insert 시 CA_ITGRT_CSTMR테이블에 자동생성된다. 이는 DBM_CUST(판매) 혹은  TB_ASM413(정비) 데이터를 찾아서 생성시킨다
    	
    	
    	
        String strRelSeq = cstmrIntgrMngDAO.getNextRelSeq(cstmrIntgrMngVO);
        cstmrIntgrMngVO.setRelSeq(strRelSeq);
        
        
        cstmrIntgrMngVO.setCustNm(cstmrIntgrMngVO.getCstmrNm());
        cstmrIntgrMngVO.setHandPhoneNo(cstmrIntgrMngVO.getHpno());
        cstmrIntgrMngVO.setBirthSex(cstmrIntgrMngVO.getSexKnd());
        if(null != cstmrIntgrMngVO.getVin() && "" != cstmrIntgrMngVO.getVin()){
        	cstmrIntgrMngVO.setVinComp(cstmrIntgrMngVO.getVin().substring(0, 3)); //KLA BA76B D J B 583953
        	cstmrIntgrMngVO.setVinType(cstmrIntgrMngVO.getVin().substring(4, 8)); //KLA BA76B D J B 583953
        	cstmrIntgrMngVO.setVinCheck(cstmrIntgrMngVO.getVin().substring(8, 9)); //KLA BA76B D J B 583953
        	cstmrIntgrMngVO.setVinMdlYear(cstmrIntgrMngVO.getVin().substring(9, 10)); //KLA BA76B D J B 583953
        	cstmrIntgrMngVO.setVinPlan(cstmrIntgrMngVO.getVin().substring(10, 11)); //KLA BA76B D J B 583953
        	cstmrIntgrMngVO.setVinBodyNo(cstmrIntgrMngVO.getVin().substring(11)); //KLA BA76B D J B 583953
            cstmrIntgrMngDAO.insertCstmrLinkCarAcqs(cstmrIntgrMngVO);
        }
        
        
        //고객링크테이블 등록
        cstmrIntgrMngDAO.insertCstmrInfoLinkMng(cstmrIntgrMngVO);
        
        //고객링크테이블 최종정보
        cstmrIntgrMngDAO.updateCstmrFinalYn(cstmrIntgrMngVO);

        //고객링크테이블 수정 (상담원 수정용 일부컬럼)
        //cstmrIntgrMngDAO.updateCstmrIntgrLinkMng(cstmrIntgrMngVO);
    }

    /*
     * 고객통합정보 수정모드 select
     */
    @Override
    public EgovMap selectCstmrIntgrMngMod(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {

        return cstmrIntgrMngDAO.selectCstmrIntgrMngMod(cstmrIntgrMngVO);
    }



    /*
     * 고객링크테이블 RelSeq
     */
    @Override
    public String getNextRelSeq(CstmrIntgrMngVO searchVO) throws Exception {
    return cstmrIntgrMngDAO.getNextRelSeq(searchVO);
    }



    /*
     * 고객차량취득테이블 등록
     */
    @Override
    public void insertCstmrLinkCarAcqs(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
    	
    	cstmrIntgrMngDAO.insertCstmrLinkCarAcqs(cstmrIntgrMngVO);
    }



    /*
     * 고객링크테이블 등록
     */
    @Override
    public void insertCstmrInfoLinkMng(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
    	
    	cstmrIntgrMngDAO.insertCstmrInfoLinkMng(cstmrIntgrMngVO);
    }



    /*
     * 고객정보수정
     */
    @Override
    public void updateCstmrIntgrLinkMng(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
    	
    	cstmrIntgrMngDAO.updateCstmrIntgrLinkMng(cstmrIntgrMngVO);
    }



    /*
     * 고객통합정보수정
     */
    @Override
    public void updateCstmrIntgrMng(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
    	
    	cstmrIntgrMngDAO.updateCstmrIntgrMng(cstmrIntgrMngVO);
    	
        //고객링크테이블 수정
        cstmrIntgrMngVO.setCustNm(cstmrIntgrMngVO.getCstmrNm());
        cstmrIntgrMngVO.setHandPhoneNo(cstmrIntgrMngVO.getHpno());
        cstmrIntgrMngVO.setBirthSex(cstmrIntgrMngVO.getSexKnd());
        if(null != cstmrIntgrMngVO.getEmailDomain() && "" != cstmrIntgrMngVO.getEmailDomain()){
        	cstmrIntgrMngVO.seteMail(cstmrIntgrMngVO.getEmailAdres()+"@"+cstmrIntgrMngVO.getEmailDomain());
        }
        
        if(null != cstmrIntgrMngVO.getVin() && "" != cstmrIntgrMngVO.getVin()){
        	cstmrIntgrMngVO.setVinComp(cstmrIntgrMngVO.getVin().substring(0, 3)); //KLA BA76B D J B 583953
        	cstmrIntgrMngVO.setVinType(cstmrIntgrMngVO.getVin().substring(4, 8)); //KLA BA76B D J B 583953
        	cstmrIntgrMngVO.setVinCheck(cstmrIntgrMngVO.getVin().substring(8, 9)); //KLA BA76B D J B 583953
        	cstmrIntgrMngVO.setVinMdlYear(cstmrIntgrMngVO.getVin().substring(9, 10)); //KLA BA76B D J B 583953
        	cstmrIntgrMngVO.setVinPlan(cstmrIntgrMngVO.getVin().substring(10, 11)); //KLA BA76B D J B 583953
        	cstmrIntgrMngVO.setVinBodyNo(cstmrIntgrMngVO.getVin().substring(11)); //KLA BA76B D J B 583953
            //cstmrIntgrMngDAO.insertCstmrLinkCarAcqs(cstmrIntgrMngVO); 소유차량이 여러대인걸 감안해서 수정은 일단 없도록 하였다. 20180211CJJ
        }
    	cstmrIntgrMngDAO.updateCstmrInfoLinkMng(cstmrIntgrMngVO);    	
    }


    /*
     * 고객통합정보삭제 액션
     */
    @Override
    public void deleteCstmrIntgrMng(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
    	
    	int chkCnt = cstmrIntgrMngDAO.cstmrInfoUseChkCnt(cstmrIntgrMngVO);
    	String chkDscr = cstmrIntgrMngDAO.cstmrInfoUseChkList(cstmrIntgrMngVO);
        if(chkCnt == 0){
        	cstmrIntgrMngDAO.deleteCstmrCarAcqs(cstmrIntgrMngVO);
        	cstmrIntgrMngDAO.deleteCstmrInfoLink(cstmrIntgrMngVO);
        	cstmrIntgrMngDAO.deleteCstmrIntgrMng(cstmrIntgrMngVO);
        }else{
        	throw new egovframework.rte.fdl.cmmn.exception.EgovBizException("해당고객이 사용된 "+chkDscr+"정보가 있으므로 삭제불가합니다.");
        }
    }



    /*
     * 고객링크테이블 최종정보
     */
    @Override
    public void updateCstmrFinalYn(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
    	
    	cstmrIntgrMngDAO.updateCstmrFinalYn(cstmrIntgrMngVO);
    }

    /**
	 * 고객소유차량목록을 조회한다.
	 * @param cstmrIntgrMngVO cstmrIntgrMngVO
	 * @return List<cstmrIntgrMngVO>
	 * @exception Exception
	 */
    @Override
    public List<EgovMap> cstmrOwnerCarList(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
        return cstmrIntgrMngDAO.cstmrOwnerCarList(cstmrIntgrMngVO);
    }


    @Override
    public int cstmrOwnerCarListCnt(CstmrIntgrMngVO cstmrIntgrMngVO) throws Exception {
        return cstmrIntgrMngDAO.cstmrOwnerCarListCnt(cstmrIntgrMngVO);
    }


}
