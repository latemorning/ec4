package egovframework.ec4.call.inbd.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import egovframework.ec4.call.inbd.service.EC4CnsltInBoundMngService;
import egovframework.ec4.call.inbd.service.EC4SalesLeadRegMngService;
import egovframework.ec4.call.inbd.service.SalesLeadRegMngVO;
import egovframework.ec4.cmm.cbase.cmt.service.DetailCodeVO;
import egovframework.ec4.cmm.cinfo.service.CstmrIntgrMngVO;
import egovframework.ec4.cmm.cinfo.service.EC4CstmrIntgrMngService;
import egovframework.ec4.cmm.csms.service.CSmsMngVO;
import egovframework.ec4.cmm.csms.service.EC4CSmsMngService;
import egovframework.ec4.call.inbd.service.CnsltInBoundMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.com.cmm.UrlShortener;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.ec4.call.cmpl.service.CstmrCmplMngVO;
import egovframework.ec4.call.cmpl.service.impl.CstmrCmplMngDAO;

/**
 * 인바운드콜 상담에 관한 ServiceImpl 클래스를 정의한다.
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

@Service("cnsltInBoundMngService")
public class EC4CnsltInBoundMngServiceImpl extends EgovAbstractServiceImpl implements EC4CnsltInBoundMngService {

	@Resource(name="cnsltInBoundMngDAO")
    private CnsltInBoundMngDAO cnsltInBoundMngDAO;

	@Resource(name="cstmrCmplMngDAO")
    private CstmrCmplMngDAO cstmrCmplMngDAO;
    
    
    @Resource(name = "cstmrIntgrMngService")
    private EC4CstmrIntgrMngService cstmrIntgrMngService;   

    @Resource(name = "salesLeadRegMngService")
    private EC4SalesLeadRegMngService salesLeadRegMngService;

    @Resource(name = "csmsMngService")
    private EC4CSmsMngService csmsMngService;
    
    /** ID Generation */
    @Resource(name = "ec4CnsltInBdIdGnrService")
    private EgovIdGnrService cnsltInBdIdGnrService;
    
    
    
    
    

	
    /**
	 * 목록을 조회한다.
	 * @param cnsltInBoundMngVO cnsltInBoundMngVO
	 * @return List<cnsltInBoundMngVO>
	 * @exception Exception
	 */
    public List<CnsltInBoundMngVO> selectEC4CnsltInBound(CnsltInBoundMngVO cnsltInBoundMngVO) throws Exception {
        return cnsltInBoundMngDAO.selectEC4CnsltInBound(cnsltInBoundMngVO);
    }


    /*
     * 콜상담이력 목록
     */
    @Override
    public ArrayList<EgovMap> selectCallCnsltHistList(CnsltInBoundMngVO searchVO) throws Exception {
    	return cnsltInBoundMngDAO.selectCallCnsltHistList(searchVO);
    }


    /*
     * 콜상담이력 목록 카운트
     */
    @Override
    public int selectCallCnsltHistListCnt(CnsltInBoundMngVO searchVO) throws Exception {
    	return cnsltInBoundMngDAO.selectCallCnsltHistListCnt(searchVO);
    }


    /*
     * 계약/판매이력 목록
     */
    @Override
    public ArrayList<EgovMap> selectCallContSalesList(CnsltInBoundMngVO searchVO) throws Exception {
    	return cnsltInBoundMngDAO.selectCallContSalesList(searchVO);
    }


    /*
     * 계약/판매이력 목록 카운트
     */
    @Override
    public int selectCallContSalesListCnt(CnsltInBoundMngVO searchVO) throws Exception {
    	return cnsltInBoundMngDAO.selectCallContSalesListCnt(searchVO);
    }



    /*
     * 인바운드상담내용 등록 (상담내용 + 유형 + 불만)
     */
    @Override
    public void insertCnsltInBoundRegAll(CnsltInBoundMngVO cnsltInBoundMngVO, CstmrCmplMngVO cstmrCmplMngVO) throws Exception {

    	CstmrIntgrMngVO cstmrIntgrMngVO = new CstmrIntgrMngVO();

	    
	    //신규고객일 경우 신규고객등록
	    if(null == cnsltInBoundMngVO.getCstmrCd() || "".equals(cnsltInBoundMngVO.getCstmrCd()) || "null".equals(cnsltInBoundMngVO.getCstmrCd()) || "single".equals(cnsltInBoundMngVO.getCstmrCd())){
    		//String strCustId = callCustIdGnrService.getNextStringId();
    		
			cstmrIntgrMngVO.setCstmrNm(cnsltInBoundMngVO.getCallerNm());                        /* 콜고객명 */
			cstmrIntgrMngVO.setHpno(cnsltInBoundMngVO.getCallerHpno());                           /* 핸드폰번호 */
			cstmrIntgrMngVO.setTelno("");                          /* 전화번호 */
			cstmrIntgrMngVO.setBrthdy("");                         /* 생년월일 */
			cstmrIntgrMngVO.setEmailAdres(cnsltInBoundMngVO.getEmailAdres());                     /* 이메일주소 */
			cstmrIntgrMngVO.setEmailDomain(cnsltInBoundMngVO.getEmailDomain());                    /* 이메일도메인 */
			cstmrIntgrMngVO.setVhcleNo("");                        /* 차량번호 */
			cstmrIntgrMngVO.setVin("");                            /* 차대번호 */
			cstmrIntgrMngVO.setHouseZip(cnsltInBoundMngVO.getSearchHomeZip());                       /* 집우편번호 */
			cstmrIntgrMngVO.setHouseAdres(cnsltInBoundMngVO.getSearchHomeAdres());                     /* 집주소 */
			cstmrIntgrMngVO.setHouseAdresDetail(cnsltInBoundMngVO.getSearchHomeAdresDetl());               /* 집주소상세 */
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
			cstmrIntgrMngVO.setRegister(cnsltInBoundMngVO.getRegister());
			cstmrIntgrMngVO.setUpdusr(cnsltInBoundMngVO.getUpdusr());
			if(
					(null != cstmrIntgrMngVO.getCstmrNm() && "" != cstmrIntgrMngVO.getHpno())
					||
					(null != cstmrIntgrMngVO.getCstmrNm() && "" != cstmrIntgrMngVO.getEmailAdres())
					||
					(null != cstmrIntgrMngVO.getCstmrNm() && "" != cstmrIntgrMngVO.getBrthdy())
					){

        		cstmrIntgrMngService.insertCstmrIntgrMng(cstmrIntgrMngVO);	
                cnsltInBoundMngVO.setCstmrCd(cstmrIntgrMngVO.getCstmrCd());
                cstmrCmplMngVO.setCstmrCd(cstmrIntgrMngVO.getCstmrCd());
			}
	    }                
        
        
	    
	    
        //고객정보내용 수정
	    if("Y".equals(cnsltInBoundMngVO.getNewCustMode()) 
	    		&& !"".equals(EgovStringUtil.nullConvert(cnsltInBoundMngVO.getCstmrCd()))  
	    		&& "01".equals(cnsltInBoundMngVO.getCstmrRel())  /* 고객관계 본인일 경우 수정하도록 한다 */
	    		){
    		
    		cstmrIntgrMngVO.setRelKnd("C");
			cstmrIntgrMngVO.setCstmrNm(cnsltInBoundMngVO.getCallerNm());                        /* 콜고객명 */
			cstmrIntgrMngVO.setCustNm(cnsltInBoundMngVO.getCallerNm());                        /* 콜고객명 */
			cstmrIntgrMngVO.setHpno(cnsltInBoundMngVO.getCallerHpno());                           /* 핸드폰번호 */
			cstmrIntgrMngVO.setHandPhoneNo(cnsltInBoundMngVO.getCallerHpno());                           /* 핸드폰번호 */
			cstmrIntgrMngVO.setTelno("");                          /* 전화번호 */
			cstmrIntgrMngVO.setBrthdy(cnsltInBoundMngVO.getBrthdy().replace("-", ""));                         /* 생년월일 */
			cstmrIntgrMngVO.setBirthSex(cnsltInBoundMngVO.getBrthdy().replace("-", ""));                         /* 생년월일 */
			cstmrIntgrMngVO.setEmailAdres(cnsltInBoundMngVO.getEmailAdres());                     /* 이메일주소 */
			cstmrIntgrMngVO.setEmailDomain(cnsltInBoundMngVO.getEmailDomain());                    /* 이메일도메인 */
			cstmrIntgrMngVO.setVhcleNo(cnsltInBoundMngVO.getVhcleNo());                        /* 차량번호 */
			cstmrIntgrMngVO.setVin("");                            /* 차대번호 */
			cstmrIntgrMngVO.setHouseZip(cnsltInBoundMngVO.getSearchHomeZip());                       /* 집우편번호 */
			cstmrIntgrMngVO.setHouseAdres(cnsltInBoundMngVO.getSearchHomeAdres());                     /* 집주소 */
			cstmrIntgrMngVO.setHouseAdresDetail(cnsltInBoundMngVO.getSearchHomeAdresDetl());               /* 집주소상세 */
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
			cstmrIntgrMngVO.setCstmrCd(cnsltInBoundMngVO.getCstmrCd());
			cstmrIntgrMngVO.setRegister(cnsltInBoundMngVO.getRegister());
			cstmrIntgrMngVO.setUpdusr(cnsltInBoundMngVO.getUpdusr());
			
			String strRelSeq = cstmrIntgrMngService.getNextRelSeq(cstmrIntgrMngVO);
			cstmrIntgrMngVO.setRelSeq(strRelSeq);
			
			//고객차량취득테이블 등록
			if(!"".equals(EgovStringUtil.nullConvert(cstmrIntgrMngVO.getVhcleNo()))){
				cstmrIntgrMngService.insertCstmrLinkCarAcqs(cstmrIntgrMngVO);
			}
			
			//고객링크테이블 등록
			cstmrIntgrMngService.insertCstmrInfoLinkMng(cstmrIntgrMngVO);
			
			//고객링크테이블 최종정보
			cstmrIntgrMngService.updateCstmrFinalYn(cstmrIntgrMngVO);
			
			//고객테이블 수정
			cstmrIntgrMngService.updateCstmrIntgrLinkMng(cstmrIntgrMngVO);
	    }
        

        //상담내용 저장
        String cnsltInbdId = cnsltInBdIdGnrService.getNextStringId();
        cnsltInBoundMngVO.setCnsltIncallNo(cnsltInbdId);

        //VOC고객불만 저장
        /*if("Y".equals(cnsltInBoundMngVO.getMgrProcModeYn())){  //상담구분 voc(불만)   기존에는 상담원 저장 시 생성하였으나  매니저 처리 시 생성하는걸로 변경하기에 주석처리한다CJJ 20181228
            String cstmrCmplId = cstmrCmplIdGnrService.getNextStringId();
            cstmrCmplMngVO.setCnsltUserId(loginVO.getUniqId());
            cstmrCmplMngVO.setCnsltIncallNo(cnsltInbdId);
            cstmrCmplMngVO.setRegister(loginVO.getUniqId());
            cstmrCmplMngVO.setMakrCd("GM");
            cstmrCmplMngVO.setCmplMngNo(cstmrCmplId);
    	    cstmrCmplMngVO.setRegistDe(toYy+"-"+toMm+"-"+toDt);
    	    cstmrCmplMngVO.setCmplRecptDt(toYy+"-"+toMm+"-"+toDt);
    	    cstmrCmplMngVO.setCmplRecptSeq("1");
    	    cstmrCmplMngVO.setCallBoundKnd("IN");  //인바운드:IN,  아웃바운드:OUT   인바운드콜 불만인지 아웃바운드콜 불만인지 구분을위함
        }*/    	
    	
    	
    	cnsltInBoundMngDAO.insertCnsltInBoundReg(cnsltInBoundMngVO);
    	
        //상담분류 선택저장
        //if(!"".equals(cnsltInBoundMngVO.getListCnsltTypeTable())){
    	insertCnsltTypeReg(cnsltInBoundMngVO);
        //}
        //VOC고객불만 저장
    	if(null != cstmrCmplMngVO.getCmplMngNo() && !"".equals(cstmrCmplMngVO.getCmplMngNo())){
    		cstmrCmplMngDAO.insertCstmrCmplReg(cstmrCmplMngVO);
    	}
    	
    	
    	
    	//고객핸드폰번호 재 확인
    	if(null==cstmrIntgrMngVO.getHpno() || ""==cstmrIntgrMngVO.getHpno()){
    		cstmrIntgrMngVO.setHpno(cnsltInBoundMngVO.getCallerHpno());
    	}
    	if(null==cstmrIntgrMngVO.getHpno() || ""==cstmrIntgrMngVO.getHpno()){
    		cstmrIntgrMngVO.setHpno(cnsltInBoundMngVO.getHpno());
    	}
    	//고객 우편번호 재 확인
    	if(null==cstmrIntgrMngVO.getHouseZip() || ""==cstmrIntgrMngVO.getHouseZip()){
    		cstmrIntgrMngVO.setHouseZip(cnsltInBoundMngVO.getHouseZip());
    	}
    	if(null==cstmrIntgrMngVO.getHouseZip() || ""==cstmrIntgrMngVO.getHouseZip()){
    		cstmrIntgrMngVO.setHouseZip(cnsltInBoundMngVO.getSearchHomeZip());
    	}
    	//고객 집주소 재 확인
    	if(null==cstmrIntgrMngVO.getHouseAdres() || ""==cstmrIntgrMngVO.getHouseAdres()){
    		cstmrIntgrMngVO.setHouseAdres(cnsltInBoundMngVO.getHouseAdres());
    	}
    	if(null==cstmrIntgrMngVO.getHouseAdres() || ""==cstmrIntgrMngVO.getHouseAdres()){
    		cstmrIntgrMngVO.setHouseAdres(cnsltInBoundMngVO.getSearchHomeAdres());
    	}
    	//고객 집상세주소 재 확인
    	if(null==cstmrIntgrMngVO.getHouseAdresDetail() || ""==cstmrIntgrMngVO.getHouseAdresDetail()){
    		cstmrIntgrMngVO.setHouseAdresDetail(cnsltInBoundMngVO.getHouseAdresDetail());
    	}
    	if(null==cstmrIntgrMngVO.getHouseAdresDetail() || ""==cstmrIntgrMngVO.getHouseAdresDetail()){
    		cstmrIntgrMngVO.setHouseAdresDetail(cnsltInBoundMngVO.getSearchHomeAdresDetl());
    	}
    	//고객명 재 확인
    	if(null==cstmrIntgrMngVO.getCstmrNm() || ""==cstmrIntgrMngVO.getCstmrNm()){
    		cstmrIntgrMngVO.setCstmrNm(cnsltInBoundMngVO.getCallerNm());
    		cstmrIntgrMngVO.setCustNm(cnsltInBoundMngVO.getCallerNm());
    	}
    	if(null==cstmrIntgrMngVO.getCstmrNm() || ""==cstmrIntgrMngVO.getCstmrNm()){
    		cstmrIntgrMngVO.setCstmrNm(cnsltInBoundMngVO.getCstmrNm());
    		cstmrIntgrMngVO.setCustNm(cnsltInBoundMngVO.getCstmrNm());
    	}
    	
    	
    	
    	
    	
    	if(null != cnsltInBoundMngVO.getSalesLeadFlag() && "Y".equals(cnsltInBoundMngVO.getSalesLeadFlag())){
    		SalesLeadRegMngVO salesLeadRegMngVO = new SalesLeadRegMngVO();
    		
        	salesLeadRegMngVO.setRegister(cnsltInBoundMngVO.getRegister());
        	salesLeadRegMngVO.setUpdusr(cnsltInBoundMngVO.getRegister());
        	
        	salesLeadRegMngVO.setCstmrCd(cnsltInBoundMngVO.getCstmrCd());
        	
        	EgovMap chkVo = null;
        	chkVo = salesLeadRegMngService.selectLeadSeqChk(salesLeadRegMngVO);
        	String chkCstmrCd = (String)chkVo.get("cstmrCd");
        	String chkLeadSeq = String.valueOf(chkVo.get("leadSeq"));
        	if(!"".equals(chkCstmrCd)){
        		salesLeadRegMngVO.setLeadSeq(chkLeadSeq);
        		salesLeadRegMngVO.setLeadType("01");//CALLTYPE : 01유선통화
        		salesLeadRegMngVO.setBrandCd("GM");
        		salesLeadRegMngVO.setModelCd(cnsltInBoundMngVO.getVhclMdl());
        		salesLeadRegMngVO.setColCd("");
        		salesLeadRegMngVO.setHpno(cstmrIntgrMngVO.getHpno());
        		salesLeadRegMngVO.setTelno(cstmrIntgrMngVO.getTelno());
        		salesLeadRegMngVO.setZip(cstmrIntgrMngVO.getHouseZip());
        		salesLeadRegMngVO.setAdres(cstmrIntgrMngVO.getHouseAdres());
        		salesLeadRegMngVO.setAdresDetail(cstmrIntgrMngVO.getHouseAdresDetail());
        		salesLeadRegMngVO.setShopNm("");
        		salesLeadRegMngVO.setDelvDt("");
        		salesLeadRegMngVO.setCstmrMemo(cnsltInBoundMngVO.getCnsltDscr());
        		salesLeadRegMngVO.setCnsltCallNo(cnsltInbdId);
        		salesLeadRegMngVO.setCnsltUserId(cnsltInBoundMngVO.getCnsltUserId());

        		salesLeadRegMngService.insertSalesLead(salesLeadRegMngVO);
        	}
    	}
    	
    	//고객이 SMS통해 파일첨부 하도록 고객SMS 핸드폰번호로  파일첨부등록화면 URL을 발송한다.
    	if(null != cnsltInBoundMngVO.getSmsFileAttachFlag() && "Y".equals(cnsltInBoundMngVO.getSmsFileAttachFlag())){
    		//String txtUrl = UrlShortener.shorter("http://10.83.1.119/ec4/cmm/cinfo/cstmrFileAttachMobile.do?CSTMR_CD="+cnsltInBoundMngVO.getCstmrCd()+"&CNSLT_INCALL_NO="+cnsltInbdId);
    		String txtUrl = UrlShortener.shorter("http://localhost:8080/ec4/cmm/cinfo/cstmrFileAttachMobile.do?CSTMR_CD="+cnsltInBoundMngVO.getCstmrCd()+"&CNSLT_INCALL_NO="+cnsltInbdId);
    		System.out.println("ShortUrl 변환결과:"+txtUrl);
    		
    		CSmsMngVO csmsMngVO = new CSmsMngVO();
            csmsMngVO.setUserId(cnsltInBoundMngVO.getRegister());
            csmsMngVO.setCstmrCd(cnsltInBoundMngVO.getCstmrCd());
            csmsMngVO.setMsgTypeH("SMS");
            csmsMngVO.setMsgType("SMS");
            csmsMngVO.setSendMode("I");
            csmsMngVO.setSender("080-5000-1111");
            csmsMngVO.setReceiver(cstmrIntgrMngVO.getHpno()==null?cnsltInBoundMngVO.getHpno():cstmrIntgrMngVO.getHpno());
            csmsMngVO.setMsgComment(txtUrl);
            //sms발송 단건등록
    		csmsMngService.smsSendAllNotMulti(csmsMngVO);    		
    	}
    	
    	//고객이 SMS통해 마케팅활용동의 하도록 고객SMS 핸드폰번호로  고객마케팅활용동의화면 URL을 발송한다.
    	if(null != cnsltInBoundMngVO.getCstmrMktAgreeFlag() && "Y".equals(cnsltInBoundMngVO.getCstmrMktAgreeFlag())){
    		//String txtUrl = UrlShortener.shorter("http://10.83.1.119/ec4/cmm/cinfo/cstmrMktAgreeMobile.do?CSTMR_CD="+cnsltInBoundMngVO.getCstmrCd()+"&CNSLT_INCALL_NO="+cnsltInbdId);
    		String txtUrl = UrlShortener.shorter("http://localhost:8080/ec4/cmm/cinfo/cstmrMktAgreeMobile.do?CSTMR_CD="+cnsltInBoundMngVO.getCstmrCd()+"&CNSLT_INCALL_NO="+cnsltInbdId);
    		System.out.println("ShortUrl 변환결과:"+txtUrl);
    		
    		CSmsMngVO csmsMngVO = new CSmsMngVO();
            csmsMngVO.setUserId(cnsltInBoundMngVO.getRegister());
            csmsMngVO.setCstmrCd(cnsltInBoundMngVO.getCstmrCd());
            csmsMngVO.setMsgTypeH("SMS");
            csmsMngVO.setMsgType("SMS");
            csmsMngVO.setSendMode("I");
            csmsMngVO.setSender("080-5000-1111");
            csmsMngVO.setReceiver(cstmrIntgrMngVO.getHpno()==null?cnsltInBoundMngVO.getHpno():cstmrIntgrMngVO.getHpno());
            csmsMngVO.setMsgComment(txtUrl);
            //sms발송 단건등록
    		csmsMngService.smsSendAllNotMulti(csmsMngVO);    		
    	}
    	
    	
    }



    /*
     * 인바운드상담내용 수정 (상담내용 + 유형 + 불만) - 매니저처리
     */
    @Override
    public void updateCnsltInBoundRegAll(CnsltInBoundMngVO cnsltInBoundMngVO, CstmrCmplMngVO cstmrCmplMngVO) throws Exception {

    	cnsltInBoundMngDAO.updateCnsltInBoundReg(cnsltInBoundMngVO);
    	
        //상담분류 선택저장
        //if(!"".equals(cnsltInBoundMngVO.getListCnsltTypeTable())){
    	//insertCnsltTypeReg(cnsltInBoundMngVO);
        //}
        //VOC고객불만 저장
    	//if(null != cstmrCmplMngVO.getCmplMngNo() && !"".equals(cstmrCmplMngVO.getCmplMngNo())){//기존에는 상담원 저장 시 생성하였으나  매니저 처리 시 생성하는걸로 변경하기에 주석처리한다CJJ 20181228
    	if("Y".equals(cnsltInBoundMngVO.getMgrProcModeYn()) ){
    		if("".equals(cstmrCmplMngVO.getCmplRecptSeq()) || "0".equals(cstmrCmplMngVO.getCmplRecptSeq()) || null == cstmrCmplMngVO.getCmplRecptSeq()  ){  //상담구분 voc(불만)
    			cstmrCmplMngDAO.insertCstmrCmplReg(cstmrCmplMngVO);
    		}else{
    			cstmrCmplMngDAO.updateCstmrCmplReg(cstmrCmplMngVO);
    		}
    	}
    }



    /*
     * 인바운드상담내용 등록
     */
    @Override
    public void insertCnsltInBoundReg(CnsltInBoundMngVO cnsltInBoundMngVO) throws Exception {

    	cnsltInBoundMngDAO.insertCnsltInBoundReg(cnsltInBoundMngVO);
    	
    }


    /*
     * 상담유형 목록 조회
     */
    @Override
    public List<EgovMap> selectInCallCnsltTypeList(CnsltInBoundMngVO searchVO) throws Exception {

        return cnsltInBoundMngDAO.selectInCallCnsltTypeList(searchVO);
    }


    /*
     * 상담유형 목록 카운트
     */
    @Override
    public int selectInCallCnsltTypeListCnt(CnsltInBoundMngVO searchVO) throws Exception {

        return cnsltInBoundMngDAO.selectInCallCnsltTypeListCnt(searchVO);
    }



    /*
     * 인바운드상담분류 등록
     */
    @Override
    public void insertCnsltTypeReg(CnsltInBoundMngVO cnsltInBoundMngVO) throws Exception {

    	//System.out.println("==================  type 저장");
    	int i = 0;
    	int cnsltInBdLen = cnsltInBoundMngVO.getListCnsltTypeTable().size();
    	//System.out.println("==================  cnsltInBdLen["+cnsltInBdLen+"]");
    	for(CnsltInBoundMngVO vo : cnsltInBoundMngVO.getListCnsltTypeTable()){
    		i++;
    		vo.setCnsltIncallNo(cnsltInBoundMngVO.getCnsltIncallNo());
    		vo.setCnsltUserId(cnsltInBoundMngVO.getCnsltUserId());
    		vo.setCstmrCd(cnsltInBoundMngVO.getCstmrCd());
    		vo.setCnsltTyKeySn(Integer.toString(i));
    		vo.setCnsltTyCd1(vo.getCodeId());
    		vo.setCnsltTyCd2(vo.getCodeIdLv2());
    		vo.setCnsltTyCd3(vo.getCodeIdLv3());
    		vo.setCnsltTyCd4(vo.getCodeIdLv4());
    		
    		
    		//System.out.println(vo.toString());
            if (StringUtils.isEmpty(vo.getCnsltIncallNo())) {

                continue;
            }
            //System.out.println("==================  vo["+vo.toString()+"]");
            cnsltInBoundMngDAO.insertCnsltTypeReg(vo);
    	}
    }



    /*
     * 상담유형 목록 LOAD
     */
    @Override
    public List<EgovMap> selectCnsltTypeLoad(CnsltInBoundMngVO searchVO) throws Exception {

        return cnsltInBoundMngDAO.selectCnsltTypeLoad(searchVO);
    }


    /*
     * 고객상담내역조회 목록
     */
    @Override
    public ArrayList<EgovMap> selectCallCnsltInBoundList(CnsltInBoundMngVO searchVO) throws Exception {
    	return cnsltInBoundMngDAO.selectCallCnsltInBoundList(searchVO);
    }


    /*
     * 고객상담내역조회 목록 카운트
     */
    @Override
    public int selectCallCnsltInBoundListCnt(CnsltInBoundMngVO searchVO) throws Exception {
    	return cnsltInBoundMngDAO.selectCallCnsltInBoundListCnt(searchVO);
    }


    /*
     * 고객상담현황 목록
     */
    @Override
    public ArrayList<EgovMap> selectCallCnsltInBoundStatList(CnsltInBoundMngVO searchVO) throws Exception {
    	return cnsltInBoundMngDAO.selectCallCnsltInBoundStatList(searchVO);
    }


    /*
     * 고객상담현황 목록 카운트
     */
    @Override
    public int selectCallCnsltInBoundStatListCnt(CnsltInBoundMngVO searchVO) throws Exception {
    	return cnsltInBoundMngDAO.selectCallCnsltInBoundStatListCnt(searchVO);
    }


    /*
     * 의뢰현황 목록
     */
    @Override
    public ArrayList<EgovMap> selectCallCnsltReqList(CnsltInBoundMngVO searchVO) throws Exception {
    	return cnsltInBoundMngDAO.selectCallCnsltReqList(searchVO);
    }


    /*
     * 의뢰현황 목록 카운트
     */
    @Override
    public int selectCallCnsltReqListCnt(CnsltInBoundMngVO searchVO) throws Exception {
    	return cnsltInBoundMngDAO.selectCallCnsltReqListCnt(searchVO);
    }


    /*
     * 매니저처리 목록
     */
    @Override
    public ArrayList<EgovMap> selectCnsltInBoundMgrProcList(CnsltInBoundMngVO searchVO) throws Exception {
    	return cnsltInBoundMngDAO.selectCnsltInBoundMgrProcList(searchVO);
    }


    /*
     * 매니저처리 목록 카운트
     */
    @Override
    public int selectCnsltInBoundMgrProcListCnt(CnsltInBoundMngVO searchVO) throws Exception {
    	return cnsltInBoundMngDAO.selectCnsltInBoundMgrProcListCnt(searchVO);
    }

    /*
     * 상담내용 매니저처리
     */
    @Override
    public EgovMap selectCnsltInBoundMgrProcLoad(CnsltInBoundMngVO cnsltInBoundMngVO) throws Exception {
    	return cnsltInBoundMngDAO.selectCnsltInBoundMgrProcLoad(cnsltInBoundMngVO);
    }




    /*
     * 고객정보 load select
     */
    @Override
    public EgovMap loadCstmrLastInfo(CnsltInBoundMngVO cnsltInBoundMngVO) throws Exception {

        return cnsltInBoundMngDAO.loadCstmrLastInfo(cnsltInBoundMngVO);
    }


    /*
     * 리콜내역 목록
     */
    @Override
    public ArrayList<EgovMap> selectCallCarRecallList(CnsltInBoundMngVO searchVO) throws Exception {
    	return cnsltInBoundMngDAO.selectCallCarRecallList(searchVO);
    }


    /*
     * 리콜내역 목록 카운트
     */
    @Override
    public int selectCallCarRecallListCnt(CnsltInBoundMngVO searchVO) throws Exception {
    	return cnsltInBoundMngDAO.selectCallCarRecallListCnt(searchVO);
    }


    /*
     * 개인소모품교환 목록
     */
    @Override
    public ArrayList<EgovMap> selectCallCarPeriodList(CnsltInBoundMngVO searchVO) throws Exception {
    	return cnsltInBoundMngDAO.selectCallCarPeriodList(searchVO);
    }


    /*
     * 개인소모품교환 목록 카운트
     */
    @Override
    public int selectCallCarPeriodListCnt(CnsltInBoundMngVO searchVO) throws Exception {
    	return cnsltInBoundMngDAO.selectCallCarPeriodListCnt(searchVO);
    }
}
