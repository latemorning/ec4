package egovframework.ec4.call.outbd.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.ec4.call.outbd.service.EC4CnsltDistribMngService;
import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.ec4.call.outbd.service.CnsltDistribMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 아웃바운드콜상담 대상고객정보 상담에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("cnsltDistribMngService")
public class EC4CnsltDistribMngServiceImpl extends EgovAbstractServiceImpl implements EC4CnsltDistribMngService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EC4CnsltDistribMngServiceImpl.class);

	@Resource(name="cnsltDistribMngDAO")
    private CnsltDistribMngDAO cnsltDistribMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param cnsltDistribMngVO cnsltDistribMngVO
	 * @return List<cnsltDistribMngVO>
	 * @exception Exception
	 */
    public List<CnsltDistribMngVO> selectCnsltDistribMng(CnsltDistribMngVO cnsltDistribMngVO) throws Exception {
        return cnsltDistribMngDAO.selectCnsltDistribMng(cnsltDistribMngVO);
    }


    /*
     * 대상고객 목록
     */
    @Override
    public ArrayList<EgovMap> searchCnsltDistribList(CnsltDistribMngVO searchVO) throws Exception {
    	return cnsltDistribMngDAO.searchCnsltDistribList(searchVO);
    }


    /*
     * 대상고객 목록 카운트
     */
    @Override
    public int searchCnsltDistribListCnt(CnsltDistribMngVO searchVO) throws Exception {
    	return cnsltDistribMngDAO.searchCnsltDistribListCnt(searchVO);
    }
    



    /*
     * 리스트 대상고객정보 등록 액션
     */
    @Override
    public void insertCnsltDistrib(CnsltDistribMngVO cnsltDistribMngVO) throws Exception {
        LOGGER.debug(cnsltDistribMngVO.toString());
        
	    String today = EgovDateUtil.getToday();
        String toYy = today.substring(0,4);
        String toMm = today.substring(4,6);
        String toDt = today.substring(6,8);   
        String strDate = toYy+"-"+toMm+"-"+toDt;
        
        
    	int i = 0;
    	for(CnsltDistribMngVO vo : cnsltDistribMngVO.getListCnsltDistribTable()){
    		
    		i++;
			EgovMap rtnVo = new EgovMap();
			CnsltDistribMngVO inputVO = new CnsltDistribMngVO();
    		System.out.println("00000000000000000000000000000000["+vo.getChk());
			if("1".equals(vo.getChk())){
				inputVO.setChk(vo.getChk()==null?"":vo.getChk());//선택
				inputVO.setMakrCd(vo.getMakrCd()==null?"":vo.getMakrCd());//브랜드
				inputVO.setCallCd(cnsltDistribMngVO.getCallCd());
				inputVO.setCallColectGbCd(cnsltDistribMngVO.getCallColectGbCd());
				inputVO.setCstmrCd(vo.getCstmrCd()==null?"":vo.getCstmrCd());//고객코드
				inputVO.setCallCstmrCdSeq(vo.getCallCstmrCdSeq()==null?"":vo.getCallCstmrCdSeq());//고객코드순번
				inputVO.setAsignCnsltUserId(cnsltDistribMngVO.getAsignCnsltUserId());
				inputVO.setAsignDt(cnsltDistribMngVO.getAsignDt()==null?strDate:cnsltDistribMngVO.getAsignDt());
				
	            cnsltDistribMngDAO.insertCnsltDistrib(inputVO);
			}
		}
		
	}     
    



    /*
     * 리스트 대상고객정보 배분 등록 액션
     */
    @Override
    public void updateCnsltAsign(CnsltDistribMngVO cnsltDistribMngVO) throws Exception {
        LOGGER.debug(cnsltDistribMngVO.toString());
        
	    String today = EgovDateUtil.getToday();
        String toYy = today.substring(0,4);
        String toMm = today.substring(4,6);
        String toDt = today.substring(6,8);   
        String strDate = toYy+"-"+toMm+"-"+toDt;
        
        
    	int i = 0;
    	for(CnsltDistribMngVO vo : cnsltDistribMngVO.getListCnsltDistribTable()){
    		
    		i++;
			EgovMap rtnVo = new EgovMap();
			CnsltDistribMngVO inputVO = new CnsltDistribMngVO();
    		
			if("1".equals(vo.getChk())){
				inputVO.setChk(vo.getChk()==null?"":vo.getChk());//선택
				inputVO.setMakrCd(vo.getMakrCd()==null?"":vo.getMakrCd());//브랜드
				inputVO.setCallCd(vo.getCallCd()==null?"":vo.getCallCd());
				inputVO.setCallColectGbCd(vo.getCallColectGbCd()==null?"":vo.getCallColectGbCd());
				inputVO.setCstmrCd(vo.getCstmrCd()==null?"":vo.getCstmrCd());//고객코드
				inputVO.setCallCstmrCdSeq(vo.getCallCstmrCdSeq()==null?"":vo.getCallCstmrCdSeq());//고객코드순번
				inputVO.setAsignCnsltUserId(vo.getAsignCnsltUserId()==null?"":vo.getAsignCnsltUserId());
				inputVO.setAsignDt(vo.getAsignDt()==null?strDate:vo.getAsignDt());
				
	            cnsltDistribMngDAO.updateCnsltAsign(inputVO);
			}
		}
		
	}     

}
