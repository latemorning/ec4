package egovframework.ec4.call.outbd.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.ec4.call.outbd.service.EC4CnsltOutBoundTargetCustService;
import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.ec4.call.outbd.service.CnsltOutBoundTargetCustVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.ec4.cmm.cinfo.service.CstmrIntgrMngVO;
import egovframework.ec4.cmm.cinfo.service.EC4CstmrIntgrMngService;

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

@Service("cnsltOutBoundTargetCustService")
public class EC4CnsltOutBoundTargetCustServiceImpl extends EgovAbstractServiceImpl implements EC4CnsltOutBoundTargetCustService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EC4CnsltOutBoundTargetCustServiceImpl.class);

	@Resource(name="cnsltOutBoundTargetCustDAO")
    private CnsltOutBoundTargetCustDAO cnsltOutBoundTargetCustDAO;

    @Resource(name = "cstmrIntgrMngService")
    private EC4CstmrIntgrMngService cstmrIntgrMngService;



    /** ID Generation */
    @Resource(name = "ec4CallCustIdGnrService")
    private EgovIdGnrService callCustIdGnrService;

    /** ID Generation */
    @Resource(name = "ec4CallHpCallIdGnrService")
    private EgovIdGnrService callHpCallIdGnrService;

    /** ID Generation */
    @Resource(name = "ec4CallCpCallIdGnrService")
    private EgovIdGnrService callCpCallIdGnrService;
    
    
	
	

    /*
     * Excel 리스트 고객DB Load 목록
     */
    @Override
    public ArrayList<EgovMap> selectCnsltTargetCustDBLoad(CnsltOutBoundTargetCustVO searchVO) throws Exception {
    	ArrayList<EgovMap> excelDatas = new ArrayList<>();
    	
    	int i = 0;
    	for(CnsltOutBoundTargetCustVO vo : searchVO.getListCnsltTargetCustTable()){
    		
    		i++;
			EgovMap rtnVo = new EgovMap();
    		
			String aryEmailTxt[] = (vo.getEmailAdres()==null?"":vo.getEmailAdres()).split("@");
    		String strEmailAdres = "";
    		String strEmailDomain = "";
    		if(aryEmailTxt.length > 1){
    			strEmailAdres = aryEmailTxt[0];
    			strEmailDomain = aryEmailTxt[1]==null?"":aryEmailTxt[1];
    		}else{
    			strEmailAdres = vo.getEmailAdres()==null?"":vo.getEmailAdres();
    		}
    		System.out.println("###########strEmailAdres["+strEmailAdres+"] strEmailDomain["+strEmailDomain+"]");
    		vo.setEmailAdres(strEmailAdres);
    		
    		ArrayList<EgovMap> cnsltTargetCustList = cnsltOutBoundTargetCustDAO.selectCnsltTargetCustDBLoad(vo);
    		ArrayList<EgovMap> tempCnsltTargetCustList = new ArrayList<EgovMap>();
    		
    		if(0 == cnsltTargetCustList.size()){
    			rtnVo.put("chk", vo.getChk()==null?"":vo.getChk());//선택
    			rtnVo.put("makrCd", vo.getMakrCd()==null?"":vo.getMakrCd());//브랜드
    			rtnVo.put("cstmrCd", vo.getCstmrCd()==null?"":vo.getCstmrCd());//고객코드
    			rtnVo.put("cstmrNm", vo.getCstmrNm()==null?"":vo.getCstmrNm());//고객명
                rtnVo.put("hpno", vo.getHpno()==null?"":vo.getHpno());//핸드폰
                if(!"".equals(strEmailDomain) && null != strEmailDomain){
                	rtnVo.put("emailAdres", strEmailAdres+"@"+strEmailDomain);//이메일
                }else{
                	rtnVo.put("emailAdres", strEmailAdres);//이메일
                }
                rtnVo.put("adres", vo.getAdres()==null?"":vo.getAdres());//주소
                rtnVo.put("adresDetl", vo.getAdresDetl()==null?"":vo.getAdresDetl());//상세주소
                rtnVo.put("bussplcCode", vo.getBussplcCode()==null?"":vo.getBussplcCode());//사업소코드
                rtnVo.put("bussplcNm", vo.getBussplcNm()==null?"":vo.getBussplcNm());//사업소명
                rtnVo.put("bussplcKnd", vo.getBussplcKnd()==null?"":vo.getBussplcKnd());//구분
                rtnVo.put("appCnsltUserId", vo.getAppCnsltUserId()==null?"":vo.getAppCnsltUserId());//적용상담원Id
                rtnVo.put("appCnsltUserNm", vo.getAppCnsltUserNm()==null?"":vo.getAppCnsltUserNm());//적용상담원
                rtnVo.put("appBussplcCode", vo.getAppBussplcCode()==null?"":vo.getAppBussplcCode());//적용사업소코드
                rtnVo.put("appBussplcNm", vo.getAppBussplcNm()==null?"":vo.getAppBussplcNm()); //적용사업소명    			
                tempCnsltTargetCustList.add(rtnVo);
        		
    		}else{
    			rtnVo.put("chk", vo.getChk()==null?"":vo.getChk());//선택
    			rtnVo.put("makrCd", cnsltTargetCustList.get(0).get("makrCd"));//브랜드
    			rtnVo.put("cstmrCd", cnsltTargetCustList.get(0).get("cstmrCd"));//고객코드
    			rtnVo.put("cstmrNm", cnsltTargetCustList.get(0).get("cstmrNm"));//고객명
                rtnVo.put("hpno", cnsltTargetCustList.get(0).get("hpno"));//핸드폰
                if(null != cnsltTargetCustList.get(0).get("emailDomain") && !"".equals(cnsltTargetCustList.get(0).get("emailDomain"))){
                    rtnVo.put("emailAdres", cnsltTargetCustList.get(0).get("emailAdres")+"@"+cnsltTargetCustList.get(0).get("emailDomain"));//이메일
                }else{
                    rtnVo.put("emailAdres", cnsltTargetCustList.get(0).get("emailAdres"));//이메일
                }
                rtnVo.put("adres", cnsltTargetCustList.get(0).get("houseAdres"));//주소
                rtnVo.put("adresDetl", cnsltTargetCustList.get(0).get("houseAdresDetail"));//상세주소
                rtnVo.put("bussplcCode", vo.getBussplcCode()==null?"":vo.getBussplcCode());//사업소코드
                rtnVo.put("bussplcNm", vo.getBussplcNm()==null?"":vo.getBussplcNm());//사업소명
                rtnVo.put("bussplcKnd", vo.getBussplcKnd()==null?"":vo.getBussplcKnd());//구분
                rtnVo.put("appCnsltUserId", vo.getAppCnsltUserId()==null?"":vo.getAppCnsltUserId());//적용상담원Id
                rtnVo.put("appCnsltUserNm", cnsltTargetCustList.get(0).get("appCnsltUserNm"));//적용상담원
                rtnVo.put("appBussplcCode", vo.getAppBussplcCode()==null?"":vo.getAppBussplcCode());//적용사업소코드
                rtnVo.put("appBussplcNm", vo.getAppBussplcNm()==null?"":vo.getAppBussplcNm()); //적용사업소명    			
                tempCnsltTargetCustList.add(rtnVo);
                
    		}
    		excelDatas.addAll(tempCnsltTargetCustList);
    	}
    	//System.out.println("excelDatas["+excelDatas.toString()+"]");
    	
    	return excelDatas;
    }
    



    /*
     * Excel리스트 대상고객정보 등록 액션
     */
    @Override
    public void insertCnsltTargetCust(CnsltOutBoundTargetCustVO cnsltOutBoundTargetCustVO) throws Exception {
        LOGGER.debug(cnsltOutBoundTargetCustVO.toString());
        
	    String today = EgovDateUtil.getToday();
        String toYy = today.substring(0,4);
        String toMm = today.substring(4,6);
        String toDt = today.substring(6,8);   
        String strDate = toYy+"-"+toMm+"-"+toDt;
        
		String strCallCd = "";
        if("H".equals(cnsltOutBoundTargetCustVO.getCallColectGbCd())){
        	strCallCd = callHpCallIdGnrService.getNextStringId();
        }else if("C".equals(cnsltOutBoundTargetCustVO.getCallColectGbCd())){
        	strCallCd = callCpCallIdGnrService.getNextStringId();
        }
        
    	int i = 0;
    	for(CnsltOutBoundTargetCustVO vo : cnsltOutBoundTargetCustVO.getListCnsltTargetCustTable()){
    		
    		i++;
			EgovMap rtnVo = new EgovMap();
    		CnsltOutBoundTargetCustVO inputVO = new CnsltOutBoundTargetCustVO();
    		    		
			String aryEmailTxt[] = (vo.getEmailAdres()==null?"":vo.getEmailAdres()).split("@");
    		String strEmailAdres = "";
    		String strEmailDomain = "";
    		if(aryEmailTxt.length > 1){
    			strEmailAdres = aryEmailTxt[0];
    			strEmailDomain = aryEmailTxt[1]==null?"":aryEmailTxt[1];
    		}else{
    			strEmailAdres = vo.getEmailAdres()==null?"":vo.getEmailAdres();
    		}
    		System.out.println("00000000000000000strEmailAdres["+strEmailAdres+"] strEmailDomain["+strEmailDomain+"]");
    		vo.setEmailAdres(strEmailAdres);
    		
    		ArrayList<EgovMap> cnsltTargetCustList = cnsltOutBoundTargetCustDAO.selectCnsltTargetCustDBLoad(vo);
    		
    		inputVO.setCallCd(strCallCd);
    		inputVO.setCallColectGbCd(cnsltOutBoundTargetCustVO.getCallColectGbCd());
    		inputVO.setCallColectDt(strDate);
    		inputVO.setAsignCnsltUserId(cnsltOutBoundTargetCustVO.getAsignCnsltUserId());
    		if(null!=cnsltOutBoundTargetCustVO.getAsignCnsltUserId() && !"".equals(cnsltOutBoundTargetCustVO.getAsignCnsltUserId())){
    			inputVO.setAsignDt(strDate);
    		}
    		inputVO.setScriptKnd(cnsltOutBoundTargetCustVO.getScriptKnd());
    		inputVO.setScriptCd(cnsltOutBoundTargetCustVO.getScriptCd());
    		
    		
    		if(0 == cnsltTargetCustList.size()){
        		//String strCustId = callCustIdGnrService.getNextStringId();
        		CstmrIntgrMngVO cstmrIntgrMngVO = new CstmrIntgrMngVO();
				cstmrIntgrMngVO.setCstmrNm(vo.getCstmrNm()==null?"":vo.getCstmrNm());                        /* 콜고객명 */
				cstmrIntgrMngVO.setHpno(vo.getHpno()==null?"":vo.getHpno());                           /* 핸드폰번호 */
				cstmrIntgrMngVO.setTelno("");                          /* 전화번호 */
				cstmrIntgrMngVO.setBrthdy("");                         /* 생년월일 */
				cstmrIntgrMngVO.setEmailAdres(strEmailAdres);                     /* 이메일주소 */
				cstmrIntgrMngVO.setEmailDomain(strEmailDomain);                    /* 이메일도메인 */
				cstmrIntgrMngVO.setVhcleNo("");                        /* 차량번호 */
				cstmrIntgrMngVO.setVin("");                            /* 차대번호 */
				cstmrIntgrMngVO.setHouseZip("");                       /* 집우편번호 */
				cstmrIntgrMngVO.setHouseAdres(vo.getAdres()==null?"":vo.getAdres());                     /* 집주소 */
				cstmrIntgrMngVO.setHouseAdresDetail(vo.getAdresDetl()==null?"":vo.getAdresDetl());               /* 집주소상세 */
				cstmrIntgrMngVO.setOfficeZip("");                      /* 직장우편번호 */
				cstmrIntgrMngVO.setOfficeAdres("");                    /* 직장주소 */
				cstmrIntgrMngVO.setOfficeAdresDetail("");              /* 직장주소상세 */
				cstmrIntgrMngVO.setTelRecvYn("");                      /* 전화수신여부 */
				cstmrIntgrMngVO.setSmsRecvYn("");                      /* SMS수신여부 */
				cstmrIntgrMngVO.setEmailRecvYn("");                    /* 이메일수신여부 */
				cstmrIntgrMngVO.setFaxRecvYn("");                      /* FAX수신여부 */
				cstmrIntgrMngVO.setDmRecvYn("");                       /* DM수신여부 */
				cstmrIntgrMngVO.setMberGrad("");                       /* 회원등급 */
				cstmrIntgrMngVO.setChevMembYn("");                     /* 쉐보레멤버여부 */
				cstmrIntgrMngVO.setWebMembYn("");                      /* 웹멤버여부 */
				cstmrIntgrMngVO.setWutoMembYn("");                     /* 오토멤버여부 */
				cstmrIntgrMngVO.setCstmrMemo("");                      /* 고객메모 */
				if(
						(null != cstmrIntgrMngVO.getCstmrNm() && "" != cstmrIntgrMngVO.getHpno())
						||
						(null != cstmrIntgrMngVO.getCstmrNm() && "" != cstmrIntgrMngVO.getEmailAdres())
						||
						(null != cstmrIntgrMngVO.getCstmrNm() && "" != cstmrIntgrMngVO.getBrthdy())
						){

	        		cstmrIntgrMngService.insertCstmrIntgrMng(cstmrIntgrMngVO);	
				}
        		
        		
    			inputVO.setChk(vo.getChk()==null?"":vo.getChk());//선택
    			inputVO.setMakrCd(vo.getMakrCd()==null?"":vo.getMakrCd());//브랜드
    			inputVO.setCstmrCd(cstmrIntgrMngVO.getCstmrCd());//고객코드
    			inputVO.setCstmrNm(vo.getCstmrNm()==null?"":vo.getCstmrNm());//고객명
                inputVO.setHpno(vo.getHpno()==null?"":vo.getHpno());//핸드폰
                if(!"".equals(strEmailDomain) && null != strEmailDomain){
                    inputVO.setEmailAdres(strEmailAdres+"@"+strEmailDomain);//이메일
                }else{
                    inputVO.setEmailAdres(strEmailAdres);//이메일
                }
                inputVO.setAdres(vo.getAdres()==null?"":vo.getAdres());//주소
                inputVO.setAdresDetl(vo.getAdresDetl()==null?"":vo.getAdresDetl());//상세주소
                inputVO.setBussplcCode(vo.getBussplcCode()==null?"":vo.getBussplcCode());//사업소코드
                inputVO.setBussplcNm(vo.getBussplcNm()==null?"":vo.getBussplcNm());//사업소명
                inputVO.setBussplcKnd(vo.getBussplcKnd()==null?"":vo.getBussplcKnd());//구분
                inputVO.setAppCnsltUserId(vo.getAppCnsltUserId()==null?"":vo.getAppCnsltUserId());//적용상담원Id
                inputVO.setAppCnsltUserNm(vo.getAppCnsltUserNm()==null?"":vo.getAppCnsltUserNm());//적용상담원
                inputVO.setAppBussplcCode(vo.getAppBussplcCode()==null?"":vo.getAppBussplcCode());//적용사업소코드
                inputVO.setAppBussplcNm(vo.getAppBussplcNm()==null?"":vo.getAppBussplcNm()); //적용사업소명    			
                
        		
    		}else{
    			inputVO.setChk(vo.getChk()==null?"":vo.getChk());//선택
    			inputVO.setMakrCd(cnsltTargetCustList.get(0).get("makrCd").toString());//브랜드
    			inputVO.setCstmrCd(cnsltTargetCustList.get(0).get("cstmrCd").toString());//고객코드
    			inputVO.setCstmrNm(cnsltTargetCustList.get(0).get("cstmrNm").toString());//고객명
                inputVO.setHpno(cnsltTargetCustList.get(0).get("hpno").toString());//핸드폰
                if(null != cnsltTargetCustList.get(0).get("emailDomain") && !"".equals(cnsltTargetCustList.get(0).get("emailDomain"))){
                    inputVO.setEmailAdres(cnsltTargetCustList.get(0).get("emailAdres")+"@"+cnsltTargetCustList.get(0).get("emailDomain"));//이메일
                }else{
                    inputVO.setEmailAdres(cnsltTargetCustList.get(0).get("emailAdres").toString());//이메일
                }
                inputVO.setAdres(cnsltTargetCustList.get(0).get("houseAdres").toString());//주소
                inputVO.setAdresDetl(cnsltTargetCustList.get(0).get("houseAdresDetail").toString());//상세주소
                inputVO.setBussplcCode(vo.getBussplcCode()==null?"":vo.getBussplcCode());//사업소코드
                inputVO.setBussplcNm(vo.getBussplcNm()==null?"":vo.getBussplcNm());//사업소명
                inputVO.setBussplcKnd(vo.getBussplcKnd()==null?"":vo.getBussplcKnd());//구분
                inputVO.setAppCnsltUserId(vo.getAppCnsltUserId()==null?"":vo.getAppCnsltUserId());//적용상담원Id
                inputVO.setAppCnsltUserNm(vo.getAppCnsltUserNm()==null?"":vo.getAppCnsltUserNm());//적용상담원
                inputVO.setAppBussplcCode(vo.getAppBussplcCode()==null?"":vo.getAppBussplcCode());//적용사업소코드
                inputVO.setAppBussplcNm(vo.getAppBussplcNm()==null?"":vo.getAppBussplcNm()); //적용사업소명    			
                
    		}
    		if(null != inputVO.getCstmrCd() && "" != inputVO.getCstmrCd()){
    			cnsltOutBoundTargetCustDAO.insertCnsltTargetCust(inputVO);
    		}
    		
    	}        
    	
    }
	
	

    /**
	 * 목록을 조회한다.
	 * @param cnsltOutBoundTargetCustVO cnsltOutBoundTargetCustVO
	 * @return List<cnsltOutBoundTargetCustVO>
	 * @exception Exception
	 */
    public List<CnsltOutBoundTargetCustVO> selectCnsltOutBoundTargetCust(CnsltOutBoundTargetCustVO cnsltOutBoundTargetCustVO) throws Exception {
        return cnsltOutBoundTargetCustDAO.selectCnsltOutBoundTargetCust(cnsltOutBoundTargetCustVO);
    }


    /*
     * 대상고객 목록
     */
    @Override
    public ArrayList<EgovMap> searchCnsltOutBoundTargetCustList(CnsltOutBoundTargetCustVO searchVO) throws Exception {
    	return cnsltOutBoundTargetCustDAO.searchCnsltOutBoundTargetCustList(searchVO);
    }


    /*
     * 대상고객 목록 카운트
     */
    @Override
    public int searchCnsltOutBoundTargetCustListCnt(CnsltOutBoundTargetCustVO searchVO) throws Exception {
    	return cnsltOutBoundTargetCustDAO.searchCnsltOutBoundTargetCustListCnt(searchVO);
    }


}
