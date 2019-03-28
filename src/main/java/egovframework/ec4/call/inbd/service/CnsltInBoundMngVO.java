package egovframework.ec4.call.inbd.service;

import java.util.ArrayList;
import java.util.List;

import egovframework.ec4.call.outbd.hpcl.service.HpclVO;
import egovframework.ec4.cmm.cbase.cmt.service.DetailCodeVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 인바운드콜 상담에 대한 Vo 클래스를 정의한다.
 * @author 최재중
 * @since 2018.04.13
 * @version 1.0
 * @see
 *
 * <pre>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2018.04.13  최재중          최초 생성
 *
 * </pre>
 */

public class CnsltInBoundMngVO extends DetailCodeVO{

	private static final long serialVersionUID = 1L;

    private String vocKnd = "";
    private String recptKnd = "";
	private String recptRoot = "";
    private String cnsltCategory = "";
    private String cstmrProtectKnd = "";
    private String cstmrDemand = "";
    private String cmplSittnCd = "";
    private String accidentYnCd = "";
    private String processSttus = "";
    private String cnsltIncallNo = "";                  /* 인바운드콜번호 */
    private String cnsltUserId = "";                    /* 상담원아이디 */
    private String cstmrCd = "";                        /* 콜고객코드 */
    private String cnsltDt = "";                        /* 상담일자 */
    private String cnsltTime = "";                      /* 상담시간 */
    private String callType = "";                       /* 통화유형 */
    private String cstmrRel = "";                       /* 고객관계 */
    private String callerNm = "";                       /* 통화자명 */
    private String callerHpno = "";                       /* 통화자핸드폰 */
    private String cnsltTyKey = "";                     /* 상담유형KEY */
    private String cnsltTyKeySn = "";                     /* 상담유형KEY */
    private String cnsltTyCn = "";                      /* 상담유형내용 */
    private String cnsltTyCnCode = "";                      /* 상담유형내용 */
    private String cnsltKnd = "";                       /* 상담구분 */
    private String cnsltRslt = "";                      /* 상담결과 */
    private String cnsltDscr = "";                      /* 상담내용 */
    private String cnsltSttDscr = "";                   /* 상담STT내용 */
    private String cnsltMemo = "";                   	/* 상담메모 */
    private String actDscr = "";                   		/* 조치내용 */
    private String recordCd = "";                       /* 녹취코드 */
    private String callBackYn = "";                     /* 콜백여부 */
    private String relCnsltIncallNo = "";               /* 참조콜번호 */
    private String registDe = "";                       /* 등록일자 */
    private String register = "";                       /* 등록자 */
    private String updtDe = "";                         /* 수정일자 */
    private String updusr = "";                         /* 수정자 */
    private String codeIdLv2 = "";
    private String codeIdLv3 = "";
    private String codeIdLv4 = "";
    private String codeNmLv2 = "";
    private String codeNmLv3 = "";
    private String codeNmLv4 = "";
    private String cnsltTyCd1 = "";
    private String cnsltTyCd2 = "";
    private String cnsltTyCd3 = "";
    private String cnsltTyCd4 = "";
    private String bndryTrgtCstmrYn = "";
    private String brthdy = "";
    private String sexKnd = "";

    private String bussplcCd1 = "";
    private String bussplcCd2 = "";
    private String bussplcCd3 = "";
    private String bussplcCd4 = "";
    
    private String vmcd = "";
    private String vhctCd = "";
    private String vhclMdl = "";
    private String vhclDetlMdl = "";
    private String custVmcd = "";
    private String custVhctCd = "";
    private String custVhclMdl = "";
    private String custVhclDetlMdl = "";
    
    private String vmcdNm = "";
    private String vhctCdNm = "";
    private String vhclMdlNm = "";
    private String vhclDetlMdlNm = "";
    private String custVmcdNm = "";
    private String custVhctCdNm = "";
    private String custVhclMdlNm = "";
    private String custVhclDetlMdlNm = "";

    
    private String codeId1 = "";
    private String codeId2 = "";
    private String codeId3 = "";
    private String codeId4 = "";
    
    private String cstmrNm = "";
    private String hpno = "";
    private String emailAdres = "";
    private String emailDomain = "";
    private String adres = "";
    private String adresDetl = "";
    private String vhcleNo = "";
    private String vin = "";
    
    private String houseZip = "";
    private String houseAdres = "";
    private String houseAdresDetail = "";
    
    private String recptKndNm = "";
    private String cnsltCategoryNm = "";
    private String recptRootNm = "";
    private String cstmrProtectKndNm = "";
    private String cstmrDemandNm = "";
    private String cmplSittnCdNm = "";
    private String accidentYnCdNm = "";
    private String processSttusNm = "";
    
    private String cnsltTitle = "";
    private String recptDscr = "";
    private String recpterOpinion = "";
    
	private String cmplCdNm = "";
	private String cmplCd = "";
	private String cmplCd1No = "";
	private String cmplCd2No = "";
	private String cmplCd3No = "";
	private String cmplCd4No = "";
	private String cmplCdLvl = "";
	private String cmplCd1Nm = "";
	private String cmplCd2Nm = "";
	private String cmplCd3Nm = "";
	private String cmplCd4Nm = "";
	private String oneselfAppntKnd = "";
	
	private String bussplcCd1Nm = "";
	private String bussplcCd2Nm = "";
	private String bussplcCd3Nm = "";
	private String bussplcCd4Nm = "";
	
	private String cmplMngNo = "";
	private String cmplRecptDt = "";
	private String cmplRecptSeq = "";
	
	private String lastRcptDate = "";
	private String lastReadKm = "";
	private String lastVhclMdl = "";
	private String typeYear = "";
	private String lastCustCode = "";
	private String lastcustNm = "";
	
	private String cnsltCustKnd = "";
	private String partNoReason = "";
	private String cnsltBussplcKnd = "";
	private String cnsltBussplcCd = "";
	private String cnsltBussplcCd1 = "";
	private String cnsltBussplcCd2 = "";
	private String cnsltBussplcCd3 = "";
	private String cnsltBussplcCd4 = "";
	private String cnsltBussplcKndNm = "";
	private String cnsltBussplcCd1Nm = "";
	private String cnsltBussplcCd2Nm = "";
	private String cnsltBussplcCd3Nm = "";
	private String cnsltBussplcCd4Nm = "";
	
	private String cstmrMktAgreeFlag = "";
	private String smsFileAttachFlag = "";
	private String salesLeadFlag = "";
	private String mgrCnfmReqFlag = "";
	private String mgrProcModeYn = "";
	private String actDscrBefore = "";
	private String vocCnsltTitle = "";
	private String vocRecptDscr = "";
	private String vocRecpterOpinion = "";
	private String newCustMode = "";
	private String custVin = "";
	private String custVhcleNo = "";
	private String cstmrEsntlId = "";
	private String cstmrVhcleSeq = "";
	
	
	/* 차량별캠페인 */
	private String vinComp = "";                        /* 차대번호1 */
	private String vinType = "";                        /* 차대번호2 */
	private String vinCheck = "";                       /* 차대번호3 */
	private String vinMdlYear = "";                     /* 차대번호4 */
	private String vinPlan = "";                        /* 차대번호5 */
	private String vinBodyNo = "";                      /* 차대번호6 */
	private String vinDup = "";                         /* 차대번호7 */
	private String maker = "";                          /* 메이커 */
	private String campNo = "";                         /* 캠패인번호 */
	private String custType = "";                       /* 공장타입 */
	private String custCode = "";                       /* 공장코드 */
	private String stat1 = "";                          /* 캠패인상태1 */
	private String stat2 = "";                          /* 캠패인상태2  1작업전, 3작업완료 */
	private String statDttm = "";                       /* 상태변경일시 */
	private String rcptMark = "";                       /* 캠패인완료상태 */
	private String regiDate = "";                       /* 등록일 */
	private String wcrNo = "";                          /*   */
	private String memo = "";                           /*   */
	private String contactShopCode = "";                /*  */
	private String contactDate = "";                    /*  */
	private String gmContactDate = "";                  /*  */
	private String interStatus = "";                    /*  */
	private String exprDate = "";                       /*  */
	private String claimId = "";                        /*  */
	private String releaseDate = "";                    /*  */
	private String releaseBu = "";                      /*  */
	private String sendMailYn = "";                     /*  */

	/* 캠페인 */
	private String docuNo = "";                         /* 문서번호 */
	private String jobMaker = "";                       /* 작업메이커 */
	private String jobCode = "";                        /* 작업코드 */
	private String campFromDate = "";                   /* 캠패인시작일 */
	private String campEndDate = "";                    /* 캠패인종료일 */
	private String stat = "";                           /* 상태 */
	private String statDate = "";                       /* 상태변경일 */
	private String exptCnt = "";                        /*   */
	private String trgtCnt = "";                        /*   */
	private String rcptCnt = "";                        /* 접수횟수 */
	private String reprCnt = "";                        /*   */
	private String mdlFlag = "";                        /* 차종구분 */
	private String saleMdl = "";                        /* 차종코드 */
	private String dateFlag = "";                       /* 날짜구분 */
	private String fromDate = "";                       /* 캠패인시작일 */
	private String toDate = "";                         /* 캠패인종료일 */
	private String optnFlag = "";                       /* 옵션구분 */
	private String optn01 = "";                         /* 옵션1 */
	private String optn02 = "";                         /* 옵션2 */
	private String optn03 = "";                         /* 옵션3 */
	private String rmrk = "";                           /* 캠패인명 */
	private String docuDate = "";                       /* 문서등록일 */
	private String cbGubn = "";                         /*   */
	private String causMaker = "";                      /* 보증작업메이커 */
	private String causPartNo = "";                     /* 보증부품번호 */
	private String causVndrType = "";                   /* 주원인거래처구분 */
	private String causVndr = "";                       /* 주원인거래처코드 */
	private String chngPartNo = "";                     /* 변경부품번호 */
	private String carDfct = "";                        /* 차량상황 */
	private String partDfct = "";                       /* 부품결함 */
	private String campGubnt = "";                      /* 보증구분 */
	private String campCheck = "";                      /* 캠패인확인 */
	private String dfctResn = "";                       /* 결함원인 */
	private String chrgRetnCase = "";                   /*   */
	private String autoRecallFlag = "";                 /*   */
	private String techRptNo = "";                      /*   */
	private String extraRmrk = "";                      /*   */
	private String mileage = "";                        /*   */
	private String regVinFromDate = "";                 /*   */
	private String regVinToDate = "";                   /*   */
	private String faType = "";                         /* Global Field Action Type PSR for Product Safety Recall  NCR for Noncompliance Recall  CSP for Customer Satisfaction Program PER for Product Emission Recall  SPP for Special Policy  SUB for Yellow Top Bulletin */
	private String engDesc = "";                        /*   */
	private String faNo = "";                           /*   */
	private String compCatCd = "";                      /* COMPLAINT CATEGORY CODE - Interface 데이터<사용안함> */
	private String compCd = "";                         /* COMPLAINT CODE - Interface 데이터 */
	private String causCd = "";                         /* CAUSE CODE - Interface 데이터 */
	private String readKmFr = "";                       /* 시작 주행거리 */
	private String readKmTo = "";                       /* 종료 주행거리 */
	private String safeRiskDesc = "";                   /*  */
	private String remedyDesc = "";                     /*  */
	private String customerAction = "";                 /*  */
	private String partAvailability = "";               /*  */
	private String notes = "";                          /*  */
	private String gfaStatus = "";                      /*  */
	private String version = "";                        /*  */	
	
	
	/* 개인소모품교환 */
    //private String jobCode = "";                        /* 작업코드 */
    //private String maker = "";                          /* 메이커 */
    private String mdlCode = "";                        /* 모델코드 */
    private String deliDate = "";                       /* 출고일자 */
    private String expRcptDate = "";                    /* 예상입고일자 */
    private String expReadKm = "";                      /* 예상주행거리 */
    private String expCustType = "";                    /*   */
    private String expCustCode = "";                    /* 사업소코드 */
    private String lstReadKm = "";                      /* 마지막주행거리 */
    private String lstRcptDate = "";                    /*   */
    private String lstRcptSeq = "";                     /*   */
    private String lstCustType = "";                    /*   */
    private String lstCustCode = "";                    /*   */
    private String lstCustId = "";                      /*   */
    private String lstReadKmAvg = "";                   /*   */
    private String smsyn = "";                          /* SMS수신여부 */
    private String emlyn = "";                          /* E-MAIL수신여부 */
    private String histDate = "";                       /* 최근교환일자 */
    private String histDistance = "";                   /* 최근교환주행거리 */
    private String smsSendYn = "";                      /* SMS발송여부 */
    private String regCd = "";                          /*   */
    private String modCd = "";                          /*   */
    private String modDt = "";                          /*   */
    private String jobPeriod = "";                      /*   */
    private String lstReadKmAvgFg = "";                 /*   */
    private String lstCustIdOld = "";                   /* 마지막 본인인증값 */

    
    /* 계약/판매 */
    private String dealerCd = "";                       /* 딜러코드 */
    private String contractNo = "";                     /* 계약번호 */
    private String businessId = "";                     /* 사업구분 */
    private String brchCd = "";                         /* 영업소코드 */
    private String centerCd = "";                       /* 본부코드 */
    private String brchNm = "";                         /* 영업소명 */
    private String saleManCd = "";                      /* 사원코드 */
    private String saleManNm = "";                      /* 영업사원명 */
    private String customerCd = "";                     /* 고객코드 */
    private String outPlaceCd = "";                     /* 출하장 */
    private String businessType = "";                   /* 업태 */
    private String industryType = "";                   /* 업종 */
    private String assignReqDt = "";                    /* 배정요청일 */
    private String assignDt = "";                       /* 배정일자 */
    private String cancelDt = "";                       /* 해약일자 */
    private String statusCd = "";                       /* STATUS */
    private String modelCd = "";                        /* 모델코드 */
    private String specCd = "";                         /* 스펙코드 */
    private String carCd = "";                          /* 차종코드 */
    private String outBasicCnt = "";                    /* 출고대수 */
    private String saleAmt = "";                        /* 공급가액 */
    private String colorCd = "";                        /* 컬러코드 */
    private String paymentDt = "";                      /* 납기일자 */
    private String totalSaleAmt = "";                   /* 총판매가 */
    private String saleCd = "";                         /* 판매조건 */
    private String instPerd = "";                       /* 할부기간 */
    private String outDt = "";                          /* 출고일자 */
    private String contAmt = "";                        /* 계약금 */
    private String indoAmt = "";                        /* 인도금 */
    private String initRate = "";                       /* 선수율 */
    private String allotmentAmt = "";                   /* 할부원금 */
    private String ijaRate = "";                        /* 자체이자율 */
    private String lossCollectionAmt = "";              /* 기타비용 */
    private String nonmoveEstateAmt = "";               /* CMS견적 SEQ */
    private String contDt = "";                         /* 계약일자 */
    private String businessNo = "";                     /* 사업자번호 */
    private String residentNo = "";                     /* 주민등록번호 */
    private String residentNm = "";                     /* 고객명 */
    private String businessNm = "";                     /* 상호명 */
    private String residentAddr = "";                   /* 실거주지고객주소 */
    private String businessAddr = "";                   /* 회사주소 */
    private String residentTelNo = "";                  /* 고객전화번호 */
    private String businessTelNo = "";                  /* 상호전화번호 */
    private String residentPostCd = "";                 /* 실거주지우편번호 */
    private String businessPostCd = "";                 /* 회사 우편번호 */
    private String dlvyPrmsDt1 = "";                    /* 인도금약정일1 */
    private String dlvyPrmsAmt1 = "";                   /* 인도금약정액1 */
    private String dlvyPrmsDt2 = "";                    /* 인도금약정일2 */
    private String dlvyPrmsAmt2 = "";                   /* 인도금약정액2 */
    private String dlvyPrmsDt3 = "";                    /* 인도금약정일3 */
    private String dlvyPrmsAmt3 = "";                   /* 인도금약정액3 */
    private String dlvyPrmsDt4 = "";                    /* 인도금약정일4 */
    private String dlvyPrmsAmt4 = "";                   /* 인도금약정액4 */
    private String dlvyPrmsDt5 = "";                    /* 인도금약정일5 */
    private String dlvyPrmsAmt5 = "";                   /* 인도금약정액5 */
    private String stampAmt = "";                       /* 인지대 */
    private String fixedDcAmt = "";                     /* 정액DC금액 */
    private String fixedDcRate = "";                    /* 정율 DC율 */
    private String unfixedDcAmt = "";                   /* DC 금액 */
    private String dlvyPrmsYn1 = "";                    /* 인도금약정구분1 */
    private String dlvyPrmsYn2 = "";                    /* 인도금약정구분2 */
    private String dlvyPrmsYn3 = "";                    /* 인도금약정구분3 */
    private String dlvyPrmsYn4 = "";                    /* 인도금약정구분4 */
    private String dlvyPrmsYn5 = "";                    /* 인도금약정구분5 */
    private String spSaleAmt = "";                      /* 판매단가 */
    private String establePayGu = "";                   /* 설정구분 */
    private String consignAmt = "";                     /* 배송료 */
    private String finaAmt = "";                        /* 금융수수료 */
    private String consignCd = "";                      /* 대표지역코드 */
    private String establePayRate = "";                 /* 설정가입비율 */
    private String guaranteeAmt = "";                   /* 보증보험가입액 */
    private String estableAmt = "";                     /* 차량설정가액 */
    private String saleTypeCd = "";                     /* 판매형태 */
    private String optionCd = "";                       /* OPTION코드 */
    private String optionAmt = "";                      /* 옵션대 */
    private String allotmentEnd = "";                   /* 할부종료 FLAG */
    private String guaranteeRate = "";                  /* 보증보험 할인율 */
    private String newIjaRate = "";                     /* 유예이자율 */
    private String salesPromotionCd = "";               /* 판매형태2 */
    private String graceAmt1 = "";                      /* 할부 유예금액 */
    private String graceIjaRate1 = "";                  /* 할부 유예이자율 */
    private String graceCompRate1 = "";                 /* 할부 유예구성비율 */
    private String carNo = "";                          /* 배정요청 차대번호 */
    private String contCnt = "";                        /* 계약대수 */
    private String cancelCnt = "";                      /* 해약대수 */
    private String selfIjaAmt = "";                     /* 자체할부이자 */
    private String bankIjaAmt = "";                     /* 은행할부이자 */
    private String carSaleAmt = "";                     /* 차량판매단가 */
    private String colorAmt = "";                       /* 컬러단가 */
    private String buyTypeCd = "";                      /* 구입용도코드 */
    private String useTypeCd = "";                      /* 용도분류코드 */
    private String handPersonCd = "";                   /* 장애등급코드 */
    private String remark = "";                         /* 비고 */
    private String tukTp = "";                          /* 개소세적용여부 */
    private String vatTp = "";                          /* 부가세적용여부 */
    private String tukAmt = "";                         /* 개소세 */
    private String edkAmt = "";                         /* 교육세 */
    private String vatAmt = "";                         /* 부가세 */
    private String assignBasisDate = "";                /* 배정선정기준일시 */
    private String regDate = "";                        /* 등록일 */
    private String updtDate = "";                       /* 수정일 */
    private String updtUserCd = "";                     /* 수정자 */
    private String juminPostCd = "";                    /* 주민등록상우편번호 */
    private String juminPostAddr = "";                  /* 주민등록상주소 */
    private String chassisNo = "";                      /* 배정확정 차대번호 */
    private String expectDt = "";                       /* 출고희망일 */
    private String fleetCustMk = "";                    /* Fleet업체여부 */
    private String outPlaceType = "";                   /* 배송유형 */
    private String outToArea = "";                      /* 도착구간코드 */
    private String transAmt = "";                       /* 운송료 */
    private String outPlaceAmt = "";                    /* 탁송료 */
    private String trustCd = "";                        /* 신용등급 */
    private String specialDcAmt = "";                   /* 특별할인금액 */
    private String onceDcAmt = "";                      /* 일시불할인금액 */
    private String empDcAmt = "";                       /* 임직원할인금액 */
    private String flawDcAmt = "";                      /* 등급차할인금액 */
    private String longDcAmt = "";                      /* 장기재고할인금액 */
    private String displayDcAmt = "";                   /* 전시차할인금액 */
    private String fleetDcAmt = "";                     /* FLEET업체할인금액 */
    private String campaignDcAmt = "";                  /* 캠페인할인금액 */
    private String proDcAmt = "";                       /* 조달할인금액 */
    private String addDcAmt = "";                       /* 추가할인금액 */
    private String cardDcAmt = "";                      /* 선할인카드금액 */
    private String autoDcAmt = "";                      /* 오토카드포인트 */
    private String etcDcAmt = "";                       /* 기타할인 */
    private String payCd = "";                          /* 할부코드 */
    private String capitalCd = "";                      /* 캐피탈사코드 */
    private String beginAcceptDt = "";                  /* 초회납입일자 */
    private String payKeepTerm = "";                    /* 거치기간 */
    private String payKeepRate = "";                    /* 거치이율 */
    private String delayTerm = "";                      /* 유예기간 */
    private String delayRate = "";                      /* 유예이율 */
    private String delayUseRate = "";                   /* 유예가능율 */
    private String payType = "";                        /* 상황방식 */
    private String payUseGrade = "";                    /* 가능신용등급 */
    private String offtaxStat = "";                     /* 면과세승인상태 */
    private String offtaxApprDttm = "";                 /* 면과세승인일시 */
    private String offtaxUserCd = "";                   /* 면과세승인자 */
    private String reductCd = "";                       /* 감면코드 */
    private String reductTukAmt = "";                   /* 감면세액 */
    private String reductTukRate = "";                  /* 감면적용세율 */
    private String apprDt = "";                         /* 결재요청일자 */
    private String apprSeq = "";                        /* 결재요청번호 */
    private String contractStatus = "";                 /* 계약상태 */
    private String regUserCd = "";                      /* 등록자 */
    private String receiptNo = "";                      /* ASP/STP접수번호 */
    private String receiptStat = "";                    /* ASP/STP상태 */
    private String receiptApprDttm = "";                /* ASP/STP승인일시 */
    private String receiptApprNo = "";                  /* ASP/STP승인번호 */
    private String handPhoneNo = "";                    /* 고객휴대폰번호 */
    private String payStatus = "";                      /* 할부승인상태 */
    private String payApprDttm = "";                    /* 할부승인일시 */
    private String payApprNo = "";                      /* 할부승인번호 */
    private String befSignoffDt = "";                   /* 이전차량 등록일자 */
    private String befChassisNo = "";                   /* 이전차량 차대번호 */
    private String remark2 = "";                        /* 비고2 */
    private String payCrdtRate = "";                    /* 금융수수료율 */
    private String stockAmt = "";                       /* 책임보험료 */
    private String contractNoO = "";                    /* 원계약번호 */
    private String email = "";                          /* 이메일 */
    private String oldCarPlan = "";                     /* 이전차량 */
    private String oldCarMaker = "";                    /* 이전차량 매이커 */
    private String oldCarModel = "";                    /* 이전차량 모델 */
    private String oldCarMy = "";                       /* 이전차량 년식 */
    private String residentPostRegNo = "";              /* RESIDENT_POST_REG_NO */
    private String businessPostRegNo = "";              /* BUSINESS_POST_REG_NO */
    private String juminPostRegNo = "";                 /* JUMIN_POST_REG_NO */
    private String salesModlCd = "";                    /* SALES_MODL_CD */
    private String indoDt = "";                         /* INDO_DT */
    private String ewItemCd = "";                       /* 보증연장상품코드 */
    private String ewItemAmt = "";                      /* 보증연장상품금액 */

    
    
    
	
	
    
    private String searchCnsltIncallNo = "";                  /* 인바운드콜번호 */
    private String searchCnsltUserId = "";                    /* 상담원아이디 */
    private String searchCstmrCd = "";                        /* 콜고객코드 */
    private String searchCnsltSeCode = "";
    private String searchParntsCodeId = "";
    private String searchCnsltUserNm= "";                    /* 상담원명 */
    private String searchCstmrNm = "";
    private String searchHpno = "";
    private String searchEmailAdres = "";
    private String searchCnsltTyCn = "";
    private String searchCnsltTyCnCode = "";
    private String searchCnsltBeginDe = "";
    private String searchCnsltEndDe = "";
    private String searchBeginDe = "";
    private String searchEndDe = "";
    private String searchCarNo = "";
    private String searchCnsltKnd = "";
    private String searchEmailDomain = "";
    private String searchHomeZip = "";
    private String searchHomeAdres = "";
    private String searchHomeAdresDetl = "";
    private String selectEmailDomain = "";
    
    private String searchVocKnd = "";
    private String searchBussplcCd1 = "";
    private String searchBussplcCd2 = "";
    private String searchBussplcCd3 = "";
    private String searchBussplcCd4 = "";
    private String searchCnsltCategory = "";
    private String searchCmplCdNm = "";
    private String searchCmplCd = "";
    private String searchCmplCd1No = "";
    private String searchCmplCd2No = "";
    private String searchCmplCd3No = "";
    private String searchCmplCd4No = "";
    private String searchCmplCdLvl = "";
    private String searchCmplCd1Nm = "";
    private String searchCmplCd2Nm = "";
    private String searchCmplCd3Nm = "";
    private String searchCmplCd4Nm = "";
    private String searchCnsltTitle = "";
    private String searchCmplSittnCd = "";
    private String searchVmcd = "";
    private String searchVhctCd = "";
    private String searchVhclMdl = "";
    private String searchVhclDetlMdl = "";
	private String searchLastReadKm = "";
	private String searchTypeYear = "";
	private String searchCstmrMktAgreeFlag = "";
	private String searchSmsFileAttachFlag = "";
	private String searchSalesLeadFlag = "";
	private String searchMgrCnfmReqFlag = "";
	private String searchVin = "";



    private ArrayList<CnsltInBoundMngVO> listCnsltTypeTable = null;
	
    
    
    
    

	public String getDealerCd() {
		return dealerCd;
	}

	public void setDealerCd(String dealerCd) {
		this.dealerCd = dealerCd;
	}

	public String getContractNo() {
		return contractNo;
	}

	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}

	public String getBusinessId() {
		return businessId;
	}

	public void setBusinessId(String businessId) {
		this.businessId = businessId;
	}

	public String getBrchCd() {
		return brchCd;
	}

	public void setBrchCd(String brchCd) {
		this.brchCd = brchCd;
	}

	public String getCenterCd() {
		return centerCd;
	}

	public void setCenterCd(String centerCd) {
		this.centerCd = centerCd;
	}

	public String getBrchNm() {
		return brchNm;
	}

	public void setBrchNm(String brchNm) {
		this.brchNm = brchNm;
	}

	public String getSaleManCd() {
		return saleManCd;
	}

	public void setSaleManCd(String saleManCd) {
		this.saleManCd = saleManCd;
	}

	public String getSaleManNm() {
		return saleManNm;
	}

	public void setSaleManNm(String saleManNm) {
		this.saleManNm = saleManNm;
	}

	public String getCustomerCd() {
		return customerCd;
	}

	public void setCustomerCd(String customerCd) {
		this.customerCd = customerCd;
	}

	public String getOutPlaceCd() {
		return outPlaceCd;
	}

	public void setOutPlaceCd(String outPlaceCd) {
		this.outPlaceCd = outPlaceCd;
	}

	public String getBusinessType() {
		return businessType;
	}

	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}

	public String getIndustryType() {
		return industryType;
	}

	public void setIndustryType(String industryType) {
		this.industryType = industryType;
	}

	public String getAssignReqDt() {
		return assignReqDt;
	}

	public void setAssignReqDt(String assignReqDt) {
		this.assignReqDt = assignReqDt;
	}

	public String getAssignDt() {
		return assignDt;
	}

	public void setAssignDt(String assignDt) {
		this.assignDt = assignDt;
	}

	public String getCancelDt() {
		return cancelDt;
	}

	public void setCancelDt(String cancelDt) {
		this.cancelDt = cancelDt;
	}

	public String getStatusCd() {
		return statusCd;
	}

	public void setStatusCd(String statusCd) {
		this.statusCd = statusCd;
	}

	public String getModelCd() {
		return modelCd;
	}

	public void setModelCd(String modelCd) {
		this.modelCd = modelCd;
	}

	public String getSpecCd() {
		return specCd;
	}

	public void setSpecCd(String specCd) {
		this.specCd = specCd;
	}

	public String getCarCd() {
		return carCd;
	}

	public void setCarCd(String carCd) {
		this.carCd = carCd;
	}

	public String getOutBasicCnt() {
		return outBasicCnt;
	}

	public void setOutBasicCnt(String outBasicCnt) {
		this.outBasicCnt = outBasicCnt;
	}

	public String getSaleAmt() {
		return saleAmt;
	}

	public void setSaleAmt(String saleAmt) {
		this.saleAmt = saleAmt;
	}

	public String getColorCd() {
		return colorCd;
	}

	public void setColorCd(String colorCd) {
		this.colorCd = colorCd;
	}

	public String getPaymentDt() {
		return paymentDt;
	}

	public void setPaymentDt(String paymentDt) {
		this.paymentDt = paymentDt;
	}

	public String getTotalSaleAmt() {
		return totalSaleAmt;
	}

	public void setTotalSaleAmt(String totalSaleAmt) {
		this.totalSaleAmt = totalSaleAmt;
	}

	public String getSaleCd() {
		return saleCd;
	}

	public void setSaleCd(String saleCd) {
		this.saleCd = saleCd;
	}

	public String getInstPerd() {
		return instPerd;
	}

	public void setInstPerd(String instPerd) {
		this.instPerd = instPerd;
	}

	public String getOutDt() {
		return outDt;
	}

	public void setOutDt(String outDt) {
		this.outDt = outDt;
	}

	public String getContAmt() {
		return contAmt;
	}

	public void setContAmt(String contAmt) {
		this.contAmt = contAmt;
	}

	public String getIndoAmt() {
		return indoAmt;
	}

	public void setIndoAmt(String indoAmt) {
		this.indoAmt = indoAmt;
	}

	public String getInitRate() {
		return initRate;
	}

	public void setInitRate(String initRate) {
		this.initRate = initRate;
	}

	public String getAllotmentAmt() {
		return allotmentAmt;
	}

	public void setAllotmentAmt(String allotmentAmt) {
		this.allotmentAmt = allotmentAmt;
	}

	public String getIjaRate() {
		return ijaRate;
	}

	public void setIjaRate(String ijaRate) {
		this.ijaRate = ijaRate;
	}

	public String getLossCollectionAmt() {
		return lossCollectionAmt;
	}

	public void setLossCollectionAmt(String lossCollectionAmt) {
		this.lossCollectionAmt = lossCollectionAmt;
	}

	public String getNonmoveEstateAmt() {
		return nonmoveEstateAmt;
	}

	public void setNonmoveEstateAmt(String nonmoveEstateAmt) {
		this.nonmoveEstateAmt = nonmoveEstateAmt;
	}

	public String getContDt() {
		return contDt;
	}

	public void setContDt(String contDt) {
		this.contDt = contDt;
	}

	public String getBusinessNo() {
		return businessNo;
	}

	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}

	public String getResidentNo() {
		return residentNo;
	}

	public void setResidentNo(String residentNo) {
		this.residentNo = residentNo;
	}

	public String getResidentNm() {
		return residentNm;
	}

	public void setResidentNm(String residentNm) {
		this.residentNm = residentNm;
	}

	public String getBusinessNm() {
		return businessNm;
	}

	public void setBusinessNm(String businessNm) {
		this.businessNm = businessNm;
	}

	public String getResidentAddr() {
		return residentAddr;
	}

	public void setResidentAddr(String residentAddr) {
		this.residentAddr = residentAddr;
	}

	public String getBusinessAddr() {
		return businessAddr;
	}

	public void setBusinessAddr(String businessAddr) {
		this.businessAddr = businessAddr;
	}

	public String getResidentTelNo() {
		return residentTelNo;
	}

	public void setResidentTelNo(String residentTelNo) {
		this.residentTelNo = residentTelNo;
	}

	public String getBusinessTelNo() {
		return businessTelNo;
	}

	public void setBusinessTelNo(String businessTelNo) {
		this.businessTelNo = businessTelNo;
	}

	public String getResidentPostCd() {
		return residentPostCd;
	}

	public void setResidentPostCd(String residentPostCd) {
		this.residentPostCd = residentPostCd;
	}

	public String getBusinessPostCd() {
		return businessPostCd;
	}

	public void setBusinessPostCd(String businessPostCd) {
		this.businessPostCd = businessPostCd;
	}

	public String getDlvyPrmsDt1() {
		return dlvyPrmsDt1;
	}

	public void setDlvyPrmsDt1(String dlvyPrmsDt1) {
		this.dlvyPrmsDt1 = dlvyPrmsDt1;
	}

	public String getDlvyPrmsAmt1() {
		return dlvyPrmsAmt1;
	}

	public void setDlvyPrmsAmt1(String dlvyPrmsAmt1) {
		this.dlvyPrmsAmt1 = dlvyPrmsAmt1;
	}

	public String getDlvyPrmsDt2() {
		return dlvyPrmsDt2;
	}

	public void setDlvyPrmsDt2(String dlvyPrmsDt2) {
		this.dlvyPrmsDt2 = dlvyPrmsDt2;
	}

	public String getDlvyPrmsAmt2() {
		return dlvyPrmsAmt2;
	}

	public void setDlvyPrmsAmt2(String dlvyPrmsAmt2) {
		this.dlvyPrmsAmt2 = dlvyPrmsAmt2;
	}

	public String getDlvyPrmsDt3() {
		return dlvyPrmsDt3;
	}

	public void setDlvyPrmsDt3(String dlvyPrmsDt3) {
		this.dlvyPrmsDt3 = dlvyPrmsDt3;
	}

	public String getDlvyPrmsAmt3() {
		return dlvyPrmsAmt3;
	}

	public void setDlvyPrmsAmt3(String dlvyPrmsAmt3) {
		this.dlvyPrmsAmt3 = dlvyPrmsAmt3;
	}

	public String getDlvyPrmsDt4() {
		return dlvyPrmsDt4;
	}

	public void setDlvyPrmsDt4(String dlvyPrmsDt4) {
		this.dlvyPrmsDt4 = dlvyPrmsDt4;
	}

	public String getDlvyPrmsAmt4() {
		return dlvyPrmsAmt4;
	}

	public void setDlvyPrmsAmt4(String dlvyPrmsAmt4) {
		this.dlvyPrmsAmt4 = dlvyPrmsAmt4;
	}

	public String getDlvyPrmsDt5() {
		return dlvyPrmsDt5;
	}

	public void setDlvyPrmsDt5(String dlvyPrmsDt5) {
		this.dlvyPrmsDt5 = dlvyPrmsDt5;
	}

	public String getDlvyPrmsAmt5() {
		return dlvyPrmsAmt5;
	}

	public void setDlvyPrmsAmt5(String dlvyPrmsAmt5) {
		this.dlvyPrmsAmt5 = dlvyPrmsAmt5;
	}

	public String getStampAmt() {
		return stampAmt;
	}

	public void setStampAmt(String stampAmt) {
		this.stampAmt = stampAmt;
	}

	public String getFixedDcAmt() {
		return fixedDcAmt;
	}

	public void setFixedDcAmt(String fixedDcAmt) {
		this.fixedDcAmt = fixedDcAmt;
	}

	public String getFixedDcRate() {
		return fixedDcRate;
	}

	public void setFixedDcRate(String fixedDcRate) {
		this.fixedDcRate = fixedDcRate;
	}

	public String getUnfixedDcAmt() {
		return unfixedDcAmt;
	}

	public void setUnfixedDcAmt(String unfixedDcAmt) {
		this.unfixedDcAmt = unfixedDcAmt;
	}

	public String getDlvyPrmsYn1() {
		return dlvyPrmsYn1;
	}

	public void setDlvyPrmsYn1(String dlvyPrmsYn1) {
		this.dlvyPrmsYn1 = dlvyPrmsYn1;
	}

	public String getDlvyPrmsYn2() {
		return dlvyPrmsYn2;
	}

	public void setDlvyPrmsYn2(String dlvyPrmsYn2) {
		this.dlvyPrmsYn2 = dlvyPrmsYn2;
	}

	public String getDlvyPrmsYn3() {
		return dlvyPrmsYn3;
	}

	public void setDlvyPrmsYn3(String dlvyPrmsYn3) {
		this.dlvyPrmsYn3 = dlvyPrmsYn3;
	}

	public String getDlvyPrmsYn4() {
		return dlvyPrmsYn4;
	}

	public void setDlvyPrmsYn4(String dlvyPrmsYn4) {
		this.dlvyPrmsYn4 = dlvyPrmsYn4;
	}

	public String getDlvyPrmsYn5() {
		return dlvyPrmsYn5;
	}

	public void setDlvyPrmsYn5(String dlvyPrmsYn5) {
		this.dlvyPrmsYn5 = dlvyPrmsYn5;
	}

	public String getSpSaleAmt() {
		return spSaleAmt;
	}

	public void setSpSaleAmt(String spSaleAmt) {
		this.spSaleAmt = spSaleAmt;
	}

	public String getEstablePayGu() {
		return establePayGu;
	}

	public void setEstablePayGu(String establePayGu) {
		this.establePayGu = establePayGu;
	}

	public String getConsignAmt() {
		return consignAmt;
	}

	public void setConsignAmt(String consignAmt) {
		this.consignAmt = consignAmt;
	}

	public String getFinaAmt() {
		return finaAmt;
	}

	public void setFinaAmt(String finaAmt) {
		this.finaAmt = finaAmt;
	}

	public String getConsignCd() {
		return consignCd;
	}

	public void setConsignCd(String consignCd) {
		this.consignCd = consignCd;
	}

	public String getEstablePayRate() {
		return establePayRate;
	}

	public void setEstablePayRate(String establePayRate) {
		this.establePayRate = establePayRate;
	}

	public String getGuaranteeAmt() {
		return guaranteeAmt;
	}

	public void setGuaranteeAmt(String guaranteeAmt) {
		this.guaranteeAmt = guaranteeAmt;
	}

	public String getEstableAmt() {
		return estableAmt;
	}

	public void setEstableAmt(String estableAmt) {
		this.estableAmt = estableAmt;
	}

	public String getSaleTypeCd() {
		return saleTypeCd;
	}

	public void setSaleTypeCd(String saleTypeCd) {
		this.saleTypeCd = saleTypeCd;
	}

	public String getOptionCd() {
		return optionCd;
	}

	public void setOptionCd(String optionCd) {
		this.optionCd = optionCd;
	}

	public String getOptionAmt() {
		return optionAmt;
	}

	public void setOptionAmt(String optionAmt) {
		this.optionAmt = optionAmt;
	}

	public String getAllotmentEnd() {
		return allotmentEnd;
	}

	public void setAllotmentEnd(String allotmentEnd) {
		this.allotmentEnd = allotmentEnd;
	}

	public String getGuaranteeRate() {
		return guaranteeRate;
	}

	public void setGuaranteeRate(String guaranteeRate) {
		this.guaranteeRate = guaranteeRate;
	}

	public String getNewIjaRate() {
		return newIjaRate;
	}

	public void setNewIjaRate(String newIjaRate) {
		this.newIjaRate = newIjaRate;
	}

	public String getSalesPromotionCd() {
		return salesPromotionCd;
	}

	public void setSalesPromotionCd(String salesPromotionCd) {
		this.salesPromotionCd = salesPromotionCd;
	}

	public String getGraceAmt1() {
		return graceAmt1;
	}

	public void setGraceAmt1(String graceAmt1) {
		this.graceAmt1 = graceAmt1;
	}

	public String getGraceIjaRate1() {
		return graceIjaRate1;
	}

	public void setGraceIjaRate1(String graceIjaRate1) {
		this.graceIjaRate1 = graceIjaRate1;
	}

	public String getGraceCompRate1() {
		return graceCompRate1;
	}

	public void setGraceCompRate1(String graceCompRate1) {
		this.graceCompRate1 = graceCompRate1;
	}

	public String getCarNo() {
		return carNo;
	}

	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}

	public String getContCnt() {
		return contCnt;
	}

	public void setContCnt(String contCnt) {
		this.contCnt = contCnt;
	}

	public String getCancelCnt() {
		return cancelCnt;
	}

	public void setCancelCnt(String cancelCnt) {
		this.cancelCnt = cancelCnt;
	}

	public String getSelfIjaAmt() {
		return selfIjaAmt;
	}

	public void setSelfIjaAmt(String selfIjaAmt) {
		this.selfIjaAmt = selfIjaAmt;
	}

	public String getBankIjaAmt() {
		return bankIjaAmt;
	}

	public void setBankIjaAmt(String bankIjaAmt) {
		this.bankIjaAmt = bankIjaAmt;
	}

	public String getCarSaleAmt() {
		return carSaleAmt;
	}

	public void setCarSaleAmt(String carSaleAmt) {
		this.carSaleAmt = carSaleAmt;
	}

	public String getColorAmt() {
		return colorAmt;
	}

	public void setColorAmt(String colorAmt) {
		this.colorAmt = colorAmt;
	}

	public String getBuyTypeCd() {
		return buyTypeCd;
	}

	public void setBuyTypeCd(String buyTypeCd) {
		this.buyTypeCd = buyTypeCd;
	}

	public String getUseTypeCd() {
		return useTypeCd;
	}

	public void setUseTypeCd(String useTypeCd) {
		this.useTypeCd = useTypeCd;
	}

	public String getHandPersonCd() {
		return handPersonCd;
	}

	public void setHandPersonCd(String handPersonCd) {
		this.handPersonCd = handPersonCd;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getTukTp() {
		return tukTp;
	}

	public void setTukTp(String tukTp) {
		this.tukTp = tukTp;
	}

	public String getVatTp() {
		return vatTp;
	}

	public void setVatTp(String vatTp) {
		this.vatTp = vatTp;
	}

	public String getTukAmt() {
		return tukAmt;
	}

	public void setTukAmt(String tukAmt) {
		this.tukAmt = tukAmt;
	}

	public String getEdkAmt() {
		return edkAmt;
	}

	public void setEdkAmt(String edkAmt) {
		this.edkAmt = edkAmt;
	}

	public String getVatAmt() {
		return vatAmt;
	}

	public void setVatAmt(String vatAmt) {
		this.vatAmt = vatAmt;
	}

	public String getAssignBasisDate() {
		return assignBasisDate;
	}

	public void setAssignBasisDate(String assignBasisDate) {
		this.assignBasisDate = assignBasisDate;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getUpdtDate() {
		return updtDate;
	}

	public void setUpdtDate(String updtDate) {
		this.updtDate = updtDate;
	}

	public String getUpdtUserCd() {
		return updtUserCd;
	}

	public void setUpdtUserCd(String updtUserCd) {
		this.updtUserCd = updtUserCd;
	}

	public String getJuminPostCd() {
		return juminPostCd;
	}

	public void setJuminPostCd(String juminPostCd) {
		this.juminPostCd = juminPostCd;
	}

	public String getJuminPostAddr() {
		return juminPostAddr;
	}

	public void setJuminPostAddr(String juminPostAddr) {
		this.juminPostAddr = juminPostAddr;
	}

	public String getChassisNo() {
		return chassisNo;
	}

	public void setChassisNo(String chassisNo) {
		this.chassisNo = chassisNo;
	}

	public String getExpectDt() {
		return expectDt;
	}

	public void setExpectDt(String expectDt) {
		this.expectDt = expectDt;
	}

	public String getFleetCustMk() {
		return fleetCustMk;
	}

	public void setFleetCustMk(String fleetCustMk) {
		this.fleetCustMk = fleetCustMk;
	}

	public String getOutPlaceType() {
		return outPlaceType;
	}

	public void setOutPlaceType(String outPlaceType) {
		this.outPlaceType = outPlaceType;
	}

	public String getOutToArea() {
		return outToArea;
	}

	public void setOutToArea(String outToArea) {
		this.outToArea = outToArea;
	}

	public String getTransAmt() {
		return transAmt;
	}

	public void setTransAmt(String transAmt) {
		this.transAmt = transAmt;
	}

	public String getOutPlaceAmt() {
		return outPlaceAmt;
	}

	public void setOutPlaceAmt(String outPlaceAmt) {
		this.outPlaceAmt = outPlaceAmt;
	}

	public String getTrustCd() {
		return trustCd;
	}

	public void setTrustCd(String trustCd) {
		this.trustCd = trustCd;
	}

	public String getSpecialDcAmt() {
		return specialDcAmt;
	}

	public void setSpecialDcAmt(String specialDcAmt) {
		this.specialDcAmt = specialDcAmt;
	}

	public String getOnceDcAmt() {
		return onceDcAmt;
	}

	public void setOnceDcAmt(String onceDcAmt) {
		this.onceDcAmt = onceDcAmt;
	}

	public String getEmpDcAmt() {
		return empDcAmt;
	}

	public void setEmpDcAmt(String empDcAmt) {
		this.empDcAmt = empDcAmt;
	}

	public String getFlawDcAmt() {
		return flawDcAmt;
	}

	public void setFlawDcAmt(String flawDcAmt) {
		this.flawDcAmt = flawDcAmt;
	}

	public String getLongDcAmt() {
		return longDcAmt;
	}

	public void setLongDcAmt(String longDcAmt) {
		this.longDcAmt = longDcAmt;
	}

	public String getDisplayDcAmt() {
		return displayDcAmt;
	}

	public void setDisplayDcAmt(String displayDcAmt) {
		this.displayDcAmt = displayDcAmt;
	}

	public String getFleetDcAmt() {
		return fleetDcAmt;
	}

	public void setFleetDcAmt(String fleetDcAmt) {
		this.fleetDcAmt = fleetDcAmt;
	}

	public String getCampaignDcAmt() {
		return campaignDcAmt;
	}

	public void setCampaignDcAmt(String campaignDcAmt) {
		this.campaignDcAmt = campaignDcAmt;
	}

	public String getProDcAmt() {
		return proDcAmt;
	}

	public void setProDcAmt(String proDcAmt) {
		this.proDcAmt = proDcAmt;
	}

	public String getAddDcAmt() {
		return addDcAmt;
	}

	public void setAddDcAmt(String addDcAmt) {
		this.addDcAmt = addDcAmt;
	}

	public String getCardDcAmt() {
		return cardDcAmt;
	}

	public void setCardDcAmt(String cardDcAmt) {
		this.cardDcAmt = cardDcAmt;
	}

	public String getAutoDcAmt() {
		return autoDcAmt;
	}

	public void setAutoDcAmt(String autoDcAmt) {
		this.autoDcAmt = autoDcAmt;
	}

	public String getEtcDcAmt() {
		return etcDcAmt;
	}

	public void setEtcDcAmt(String etcDcAmt) {
		this.etcDcAmt = etcDcAmt;
	}

	public String getPayCd() {
		return payCd;
	}

	public void setPayCd(String payCd) {
		this.payCd = payCd;
	}

	public String getCapitalCd() {
		return capitalCd;
	}

	public void setCapitalCd(String capitalCd) {
		this.capitalCd = capitalCd;
	}

	public String getBeginAcceptDt() {
		return beginAcceptDt;
	}

	public void setBeginAcceptDt(String beginAcceptDt) {
		this.beginAcceptDt = beginAcceptDt;
	}

	public String getPayKeepTerm() {
		return payKeepTerm;
	}

	public void setPayKeepTerm(String payKeepTerm) {
		this.payKeepTerm = payKeepTerm;
	}

	public String getPayKeepRate() {
		return payKeepRate;
	}

	public void setPayKeepRate(String payKeepRate) {
		this.payKeepRate = payKeepRate;
	}

	public String getDelayTerm() {
		return delayTerm;
	}

	public void setDelayTerm(String delayTerm) {
		this.delayTerm = delayTerm;
	}

	public String getDelayRate() {
		return delayRate;
	}

	public void setDelayRate(String delayRate) {
		this.delayRate = delayRate;
	}

	public String getDelayUseRate() {
		return delayUseRate;
	}

	public void setDelayUseRate(String delayUseRate) {
		this.delayUseRate = delayUseRate;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getPayUseGrade() {
		return payUseGrade;
	}

	public void setPayUseGrade(String payUseGrade) {
		this.payUseGrade = payUseGrade;
	}

	public String getOfftaxStat() {
		return offtaxStat;
	}

	public void setOfftaxStat(String offtaxStat) {
		this.offtaxStat = offtaxStat;
	}

	public String getOfftaxApprDttm() {
		return offtaxApprDttm;
	}

	public void setOfftaxApprDttm(String offtaxApprDttm) {
		this.offtaxApprDttm = offtaxApprDttm;
	}

	public String getOfftaxUserCd() {
		return offtaxUserCd;
	}

	public void setOfftaxUserCd(String offtaxUserCd) {
		this.offtaxUserCd = offtaxUserCd;
	}

	public String getReductCd() {
		return reductCd;
	}

	public void setReductCd(String reductCd) {
		this.reductCd = reductCd;
	}

	public String getReductTukAmt() {
		return reductTukAmt;
	}

	public void setReductTukAmt(String reductTukAmt) {
		this.reductTukAmt = reductTukAmt;
	}

	public String getReductTukRate() {
		return reductTukRate;
	}

	public void setReductTukRate(String reductTukRate) {
		this.reductTukRate = reductTukRate;
	}

	public String getApprDt() {
		return apprDt;
	}

	public void setApprDt(String apprDt) {
		this.apprDt = apprDt;
	}

	public String getApprSeq() {
		return apprSeq;
	}

	public void setApprSeq(String apprSeq) {
		this.apprSeq = apprSeq;
	}

	public String getContractStatus() {
		return contractStatus;
	}

	public void setContractStatus(String contractStatus) {
		this.contractStatus = contractStatus;
	}

	public String getRegUserCd() {
		return regUserCd;
	}

	public void setRegUserCd(String regUserCd) {
		this.regUserCd = regUserCd;
	}

	public String getReceiptNo() {
		return receiptNo;
	}

	public void setReceiptNo(String receiptNo) {
		this.receiptNo = receiptNo;
	}

	public String getReceiptStat() {
		return receiptStat;
	}

	public void setReceiptStat(String receiptStat) {
		this.receiptStat = receiptStat;
	}

	public String getReceiptApprDttm() {
		return receiptApprDttm;
	}

	public void setReceiptApprDttm(String receiptApprDttm) {
		this.receiptApprDttm = receiptApprDttm;
	}

	public String getReceiptApprNo() {
		return receiptApprNo;
	}

	public void setReceiptApprNo(String receiptApprNo) {
		this.receiptApprNo = receiptApprNo;
	}

	public String getHandPhoneNo() {
		return handPhoneNo;
	}

	public void setHandPhoneNo(String handPhoneNo) {
		this.handPhoneNo = handPhoneNo;
	}

	public String getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	public String getPayApprDttm() {
		return payApprDttm;
	}

	public void setPayApprDttm(String payApprDttm) {
		this.payApprDttm = payApprDttm;
	}

	public String getPayApprNo() {
		return payApprNo;
	}

	public void setPayApprNo(String payApprNo) {
		this.payApprNo = payApprNo;
	}

	public String getBefSignoffDt() {
		return befSignoffDt;
	}

	public void setBefSignoffDt(String befSignoffDt) {
		this.befSignoffDt = befSignoffDt;
	}

	public String getBefChassisNo() {
		return befChassisNo;
	}

	public void setBefChassisNo(String befChassisNo) {
		this.befChassisNo = befChassisNo;
	}

	public String getRemark2() {
		return remark2;
	}

	public void setRemark2(String remark2) {
		this.remark2 = remark2;
	}

	public String getPayCrdtRate() {
		return payCrdtRate;
	}

	public void setPayCrdtRate(String payCrdtRate) {
		this.payCrdtRate = payCrdtRate;
	}

	public String getStockAmt() {
		return stockAmt;
	}

	public void setStockAmt(String stockAmt) {
		this.stockAmt = stockAmt;
	}

	public String getContractNoO() {
		return contractNoO;
	}

	public void setContractNoO(String contractNoO) {
		this.contractNoO = contractNoO;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getOldCarPlan() {
		return oldCarPlan;
	}

	public void setOldCarPlan(String oldCarPlan) {
		this.oldCarPlan = oldCarPlan;
	}

	public String getOldCarMaker() {
		return oldCarMaker;
	}

	public void setOldCarMaker(String oldCarMaker) {
		this.oldCarMaker = oldCarMaker;
	}

	public String getOldCarModel() {
		return oldCarModel;
	}

	public void setOldCarModel(String oldCarModel) {
		this.oldCarModel = oldCarModel;
	}

	public String getOldCarMy() {
		return oldCarMy;
	}

	public void setOldCarMy(String oldCarMy) {
		this.oldCarMy = oldCarMy;
	}

	public String getResidentPostRegNo() {
		return residentPostRegNo;
	}

	public void setResidentPostRegNo(String residentPostRegNo) {
		this.residentPostRegNo = residentPostRegNo;
	}

	public String getBusinessPostRegNo() {
		return businessPostRegNo;
	}

	public void setBusinessPostRegNo(String businessPostRegNo) {
		this.businessPostRegNo = businessPostRegNo;
	}

	public String getJuminPostRegNo() {
		return juminPostRegNo;
	}

	public void setJuminPostRegNo(String juminPostRegNo) {
		this.juminPostRegNo = juminPostRegNo;
	}

	public String getSalesModlCd() {
		return salesModlCd;
	}

	public void setSalesModlCd(String salesModlCd) {
		this.salesModlCd = salesModlCd;
	}

	public String getIndoDt() {
		return indoDt;
	}

	public void setIndoDt(String indoDt) {
		this.indoDt = indoDt;
	}

	public String getEwItemCd() {
		return ewItemCd;
	}

	public void setEwItemCd(String ewItemCd) {
		this.ewItemCd = ewItemCd;
	}

	public String getEwItemAmt() {
		return ewItemAmt;
	}

	public void setEwItemAmt(String ewItemAmt) {
		this.ewItemAmt = ewItemAmt;
	}

	public String getMdlCode() {
		return mdlCode;
	}

	public void setMdlCode(String mdlCode) {
		this.mdlCode = mdlCode;
	}

	public String getDeliDate() {
		return deliDate;
	}

	public void setDeliDate(String deliDate) {
		this.deliDate = deliDate;
	}

	public String getExpRcptDate() {
		return expRcptDate;
	}

	public void setExpRcptDate(String expRcptDate) {
		this.expRcptDate = expRcptDate;
	}

	public String getExpReadKm() {
		return expReadKm;
	}

	public void setExpReadKm(String expReadKm) {
		this.expReadKm = expReadKm;
	}

	public String getExpCustType() {
		return expCustType;
	}

	public void setExpCustType(String expCustType) {
		this.expCustType = expCustType;
	}

	public String getExpCustCode() {
		return expCustCode;
	}

	public void setExpCustCode(String expCustCode) {
		this.expCustCode = expCustCode;
	}

	public String getLstReadKm() {
		return lstReadKm;
	}

	public void setLstReadKm(String lstReadKm) {
		this.lstReadKm = lstReadKm;
	}

	public String getLstRcptDate() {
		return lstRcptDate;
	}

	public void setLstRcptDate(String lstRcptDate) {
		this.lstRcptDate = lstRcptDate;
	}

	public String getLstRcptSeq() {
		return lstRcptSeq;
	}

	public void setLstRcptSeq(String lstRcptSeq) {
		this.lstRcptSeq = lstRcptSeq;
	}

	public String getLstCustType() {
		return lstCustType;
	}

	public void setLstCustType(String lstCustType) {
		this.lstCustType = lstCustType;
	}

	public String getLstCustCode() {
		return lstCustCode;
	}

	public void setLstCustCode(String lstCustCode) {
		this.lstCustCode = lstCustCode;
	}

	public String getLstCustId() {
		return lstCustId;
	}

	public void setLstCustId(String lstCustId) {
		this.lstCustId = lstCustId;
	}

	public String getLstReadKmAvg() {
		return lstReadKmAvg;
	}

	public void setLstReadKmAvg(String lstReadKmAvg) {
		this.lstReadKmAvg = lstReadKmAvg;
	}

	public String getSmsyn() {
		return smsyn;
	}

	public void setSmsyn(String smsyn) {
		this.smsyn = smsyn;
	}

	public String getEmlyn() {
		return emlyn;
	}

	public void setEmlyn(String emlyn) {
		this.emlyn = emlyn;
	}

	public String getHistDate() {
		return histDate;
	}

	public void setHistDate(String histDate) {
		this.histDate = histDate;
	}

	public String getHistDistance() {
		return histDistance;
	}

	public void setHistDistance(String histDistance) {
		this.histDistance = histDistance;
	}

	public String getSmsSendYn() {
		return smsSendYn;
	}

	public void setSmsSendYn(String smsSendYn) {
		this.smsSendYn = smsSendYn;
	}

	public String getRegCd() {
		return regCd;
	}

	public void setRegCd(String regCd) {
		this.regCd = regCd;
	}

	public String getModCd() {
		return modCd;
	}

	public void setModCd(String modCd) {
		this.modCd = modCd;
	}

	public String getModDt() {
		return modDt;
	}

	public void setModDt(String modDt) {
		this.modDt = modDt;
	}

	public String getJobPeriod() {
		return jobPeriod;
	}

	public void setJobPeriod(String jobPeriod) {
		this.jobPeriod = jobPeriod;
	}

	public String getLstReadKmAvgFg() {
		return lstReadKmAvgFg;
	}

	public void setLstReadKmAvgFg(String lstReadKmAvgFg) {
		this.lstReadKmAvgFg = lstReadKmAvgFg;
	}

	public String getLstCustIdOld() {
		return lstCustIdOld;
	}

	public void setLstCustIdOld(String lstCustIdOld) {
		this.lstCustIdOld = lstCustIdOld;
	}

	public String getCstmrMktAgreeFlag() {
		return cstmrMktAgreeFlag;
	}

	public void setCstmrMktAgreeFlag(String cstmrMktAgreeFlag) {
		this.cstmrMktAgreeFlag = cstmrMktAgreeFlag;
	}

	public String getSearchCstmrMktAgreeFlag() {
		return searchCstmrMktAgreeFlag;
	}

	public void setSearchCstmrMktAgreeFlag(String searchCstmrMktAgreeFlag) {
		this.searchCstmrMktAgreeFlag = searchCstmrMktAgreeFlag;
	}

	public String getSmsFileAttachFlag() {
		return smsFileAttachFlag;
	}

	public void setSmsFileAttachFlag(String smsFileAttachFlag) {
		this.smsFileAttachFlag = smsFileAttachFlag;
	}

	public String getSearchSmsFileAttachFlag() {
		return searchSmsFileAttachFlag;
	}

	public void setSearchSmsFileAttachFlag(String searchSmsFileAttachFlag) {
		this.searchSmsFileAttachFlag = searchSmsFileAttachFlag;
	}

	public String getSearchSalesLeadFlag() {
		return searchSalesLeadFlag;
	}

	public void setSearchSalesLeadFlag(String searchSalesLeadFlag) {
		this.searchSalesLeadFlag = searchSalesLeadFlag;
	}

	public String getSalesLeadFlag() {
		return salesLeadFlag;
	}

	public void setSalesLeadFlag(String salesLeadFlag) {
		this.salesLeadFlag = salesLeadFlag;
	}

	public String getSearchVin() {
		return searchVin;
	}

	public void setSearchVin(String searchVin) {
		this.searchVin = searchVin;
	}

	public String getVinComp() {
		return vinComp;
	}

	public void setVinComp(String vinComp) {
		this.vinComp = vinComp;
	}

	public String getVinType() {
		return vinType;
	}

	public void setVinType(String vinType) {
		this.vinType = vinType;
	}

	public String getVinCheck() {
		return vinCheck;
	}

	public void setVinCheck(String vinCheck) {
		this.vinCheck = vinCheck;
	}

	public String getVinMdlYear() {
		return vinMdlYear;
	}

	public void setVinMdlYear(String vinMdlYear) {
		this.vinMdlYear = vinMdlYear;
	}

	public String getVinPlan() {
		return vinPlan;
	}

	public void setVinPlan(String vinPlan) {
		this.vinPlan = vinPlan;
	}

	public String getVinBodyNo() {
		return vinBodyNo;
	}

	public void setVinBodyNo(String vinBodyNo) {
		this.vinBodyNo = vinBodyNo;
	}

	public String getVinDup() {
		return vinDup;
	}

	public void setVinDup(String vinDup) {
		this.vinDup = vinDup;
	}

	public String getMaker() {
		return maker;
	}

	public void setMaker(String maker) {
		this.maker = maker;
	}

	public String getCampNo() {
		return campNo;
	}

	public void setCampNo(String campNo) {
		this.campNo = campNo;
	}

	public String getCustType() {
		return custType;
	}

	public void setCustType(String custType) {
		this.custType = custType;
	}

	public String getCustCode() {
		return custCode;
	}

	public void setCustCode(String custCode) {
		this.custCode = custCode;
	}

	public String getStat1() {
		return stat1;
	}

	public void setStat1(String stat1) {
		this.stat1 = stat1;
	}

	public String getStat2() {
		return stat2;
	}

	public void setStat2(String stat2) {
		this.stat2 = stat2;
	}

	public String getStatDttm() {
		return statDttm;
	}

	public void setStatDttm(String statDttm) {
		this.statDttm = statDttm;
	}

	public String getRcptMark() {
		return rcptMark;
	}

	public void setRcptMark(String rcptMark) {
		this.rcptMark = rcptMark;
	}

	public String getRegiDate() {
		return regiDate;
	}

	public void setRegiDate(String regiDate) {
		this.regiDate = regiDate;
	}

	public String getWcrNo() {
		return wcrNo;
	}

	public void setWcrNo(String wcrNo) {
		this.wcrNo = wcrNo;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getContactShopCode() {
		return contactShopCode;
	}

	public void setContactShopCode(String contactShopCode) {
		this.contactShopCode = contactShopCode;
	}

	public String getContactDate() {
		return contactDate;
	}

	public void setContactDate(String contactDate) {
		this.contactDate = contactDate;
	}

	public String getGmContactDate() {
		return gmContactDate;
	}

	public void setGmContactDate(String gmContactDate) {
		this.gmContactDate = gmContactDate;
	}

	public String getInterStatus() {
		return interStatus;
	}

	public void setInterStatus(String interStatus) {
		this.interStatus = interStatus;
	}

	public String getExprDate() {
		return exprDate;
	}

	public void setExprDate(String exprDate) {
		this.exprDate = exprDate;
	}

	public String getClaimId() {
		return claimId;
	}

	public void setClaimId(String claimId) {
		this.claimId = claimId;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getReleaseBu() {
		return releaseBu;
	}

	public void setReleaseBu(String releaseBu) {
		this.releaseBu = releaseBu;
	}

	public String getSendMailYn() {
		return sendMailYn;
	}

	public void setSendMailYn(String sendMailYn) {
		this.sendMailYn = sendMailYn;
	}

	public String getDocuNo() {
		return docuNo;
	}

	public void setDocuNo(String docuNo) {
		this.docuNo = docuNo;
	}

	public String getJobMaker() {
		return jobMaker;
	}

	public void setJobMaker(String jobMaker) {
		this.jobMaker = jobMaker;
	}

	public String getJobCode() {
		return jobCode;
	}

	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}

	public String getCampFromDate() {
		return campFromDate;
	}

	public void setCampFromDate(String campFromDate) {
		this.campFromDate = campFromDate;
	}

	public String getCampEndDate() {
		return campEndDate;
	}

	public void setCampEndDate(String campEndDate) {
		this.campEndDate = campEndDate;
	}

	public String getStat() {
		return stat;
	}

	public void setStat(String stat) {
		this.stat = stat;
	}

	public String getStatDate() {
		return statDate;
	}

	public void setStatDate(String statDate) {
		this.statDate = statDate;
	}

	public String getExptCnt() {
		return exptCnt;
	}

	public void setExptCnt(String exptCnt) {
		this.exptCnt = exptCnt;
	}

	public String getTrgtCnt() {
		return trgtCnt;
	}

	public void setTrgtCnt(String trgtCnt) {
		this.trgtCnt = trgtCnt;
	}

	public String getRcptCnt() {
		return rcptCnt;
	}

	public void setRcptCnt(String rcptCnt) {
		this.rcptCnt = rcptCnt;
	}

	public String getReprCnt() {
		return reprCnt;
	}

	public void setReprCnt(String reprCnt) {
		this.reprCnt = reprCnt;
	}

	public String getMdlFlag() {
		return mdlFlag;
	}

	public void setMdlFlag(String mdlFlag) {
		this.mdlFlag = mdlFlag;
	}

	public String getSaleMdl() {
		return saleMdl;
	}

	public void setSaleMdl(String saleMdl) {
		this.saleMdl = saleMdl;
	}

	public String getDateFlag() {
		return dateFlag;
	}

	public void setDateFlag(String dateFlag) {
		this.dateFlag = dateFlag;
	}

	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	public String getOptnFlag() {
		return optnFlag;
	}

	public void setOptnFlag(String optnFlag) {
		this.optnFlag = optnFlag;
	}

	public String getOptn01() {
		return optn01;
	}

	public void setOptn01(String optn01) {
		this.optn01 = optn01;
	}

	public String getOptn02() {
		return optn02;
	}

	public void setOptn02(String optn02) {
		this.optn02 = optn02;
	}

	public String getOptn03() {
		return optn03;
	}

	public void setOptn03(String optn03) {
		this.optn03 = optn03;
	}

	public String getRmrk() {
		return rmrk;
	}

	public void setRmrk(String rmrk) {
		this.rmrk = rmrk;
	}

	public String getDocuDate() {
		return docuDate;
	}

	public void setDocuDate(String docuDate) {
		this.docuDate = docuDate;
	}

	public String getCbGubn() {
		return cbGubn;
	}

	public void setCbGubn(String cbGubn) {
		this.cbGubn = cbGubn;
	}

	public String getCausMaker() {
		return causMaker;
	}

	public void setCausMaker(String causMaker) {
		this.causMaker = causMaker;
	}

	public String getCausPartNo() {
		return causPartNo;
	}

	public void setCausPartNo(String causPartNo) {
		this.causPartNo = causPartNo;
	}

	public String getCausVndrType() {
		return causVndrType;
	}

	public void setCausVndrType(String causVndrType) {
		this.causVndrType = causVndrType;
	}

	public String getCausVndr() {
		return causVndr;
	}

	public void setCausVndr(String causVndr) {
		this.causVndr = causVndr;
	}

	public String getChngPartNo() {
		return chngPartNo;
	}

	public void setChngPartNo(String chngPartNo) {
		this.chngPartNo = chngPartNo;
	}

	public String getCarDfct() {
		return carDfct;
	}

	public void setCarDfct(String carDfct) {
		this.carDfct = carDfct;
	}

	public String getPartDfct() {
		return partDfct;
	}

	public void setPartDfct(String partDfct) {
		this.partDfct = partDfct;
	}

	public String getCampGubnt() {
		return campGubnt;
	}

	public void setCampGubnt(String campGubnt) {
		this.campGubnt = campGubnt;
	}

	public String getCampCheck() {
		return campCheck;
	}

	public void setCampCheck(String campCheck) {
		this.campCheck = campCheck;
	}

	public String getDfctResn() {
		return dfctResn;
	}

	public void setDfctResn(String dfctResn) {
		this.dfctResn = dfctResn;
	}

	public String getChrgRetnCase() {
		return chrgRetnCase;
	}

	public void setChrgRetnCase(String chrgRetnCase) {
		this.chrgRetnCase = chrgRetnCase;
	}

	public String getAutoRecallFlag() {
		return autoRecallFlag;
	}

	public void setAutoRecallFlag(String autoRecallFlag) {
		this.autoRecallFlag = autoRecallFlag;
	}

	public String getTechRptNo() {
		return techRptNo;
	}

	public void setTechRptNo(String techRptNo) {
		this.techRptNo = techRptNo;
	}

	public String getExtraRmrk() {
		return extraRmrk;
	}

	public void setExtraRmrk(String extraRmrk) {
		this.extraRmrk = extraRmrk;
	}

	public String getMileage() {
		return mileage;
	}

	public void setMileage(String mileage) {
		this.mileage = mileage;
	}

	public String getRegVinFromDate() {
		return regVinFromDate;
	}

	public void setRegVinFromDate(String regVinFromDate) {
		this.regVinFromDate = regVinFromDate;
	}

	public String getRegVinToDate() {
		return regVinToDate;
	}

	public void setRegVinToDate(String regVinToDate) {
		this.regVinToDate = regVinToDate;
	}

	public String getFaType() {
		return faType;
	}

	public void setFaType(String faType) {
		this.faType = faType;
	}

	public String getEngDesc() {
		return engDesc;
	}

	public void setEngDesc(String engDesc) {
		this.engDesc = engDesc;
	}

	public String getFaNo() {
		return faNo;
	}

	public void setFaNo(String faNo) {
		this.faNo = faNo;
	}

	public String getCompCatCd() {
		return compCatCd;
	}

	public void setCompCatCd(String compCatCd) {
		this.compCatCd = compCatCd;
	}

	public String getCompCd() {
		return compCd;
	}

	public void setCompCd(String compCd) {
		this.compCd = compCd;
	}

	public String getCausCd() {
		return causCd;
	}

	public void setCausCd(String causCd) {
		this.causCd = causCd;
	}

	public String getReadKmFr() {
		return readKmFr;
	}

	public void setReadKmFr(String readKmFr) {
		this.readKmFr = readKmFr;
	}

	public String getReadKmTo() {
		return readKmTo;
	}

	public void setReadKmTo(String readKmTo) {
		this.readKmTo = readKmTo;
	}

	public String getSafeRiskDesc() {
		return safeRiskDesc;
	}

	public void setSafeRiskDesc(String safeRiskDesc) {
		this.safeRiskDesc = safeRiskDesc;
	}

	public String getRemedyDesc() {
		return remedyDesc;
	}

	public void setRemedyDesc(String remedyDesc) {
		this.remedyDesc = remedyDesc;
	}

	public String getCustomerAction() {
		return customerAction;
	}

	public void setCustomerAction(String customerAction) {
		this.customerAction = customerAction;
	}

	public String getPartAvailability() {
		return partAvailability;
	}

	public void setPartAvailability(String partAvailability) {
		this.partAvailability = partAvailability;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public String getGfaStatus() {
		return gfaStatus;
	}

	public void setGfaStatus(String gfaStatus) {
		this.gfaStatus = gfaStatus;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public List<CnsltInBoundMngVO> getEc4CnsltInBoundMngList() {
		return ec4CnsltInBoundMngList;
	}

	public void setEc4CnsltInBoundMngList(List<CnsltInBoundMngVO> ec4CnsltInBoundMngList) {
		this.ec4CnsltInBoundMngList = ec4CnsltInBoundMngList;
	}

	public String getCnsltTyCnCode() {
		return cnsltTyCnCode;
	}

	public void setCnsltTyCnCode(String cnsltTyCnCode) {
		this.cnsltTyCnCode = cnsltTyCnCode;
	}

	public String getSearchCnsltTyCnCode() {
		return searchCnsltTyCnCode;
	}

	public void setSearchCnsltTyCnCode(String searchCnsltTyCnCode) {
		this.searchCnsltTyCnCode = searchCnsltTyCnCode;
	}

	public String getCustVin() {
		return custVin;
	}

	public void setCustVin(String custVin) {
		this.custVin = custVin;
	}

	public String getCustVhcleNo() {
		return custVhcleNo;
	}

	public void setCustVhcleNo(String custVhcleNo) {
		this.custVhcleNo = custVhcleNo;
	}

	public String getCstmrEsntlId() {
		return cstmrEsntlId;
	}

	public void setCstmrEsntlId(String cstmrEsntlId) {
		this.cstmrEsntlId = cstmrEsntlId;
	}

	public String getCstmrVhcleSeq() {
		return cstmrVhcleSeq;
	}

	public void setCstmrVhcleSeq(String cstmrVhcleSeq) {
		this.cstmrVhcleSeq = cstmrVhcleSeq;
	}

	public String getVin() {
		return vin;
	}

	public void setVin(String vin) {
		this.vin = vin;
	}

	public String getCallerHpno() {
		return callerHpno;
	}

	public void setCallerHpno(String callerHpno) {
		this.callerHpno = callerHpno;
	}

	public String getNewCustMode() {
		return newCustMode;
	}

	public void setNewCustMode(String newCustMode) {
		this.newCustMode = newCustMode;
	}

	public String getVhcleNo() {
		return vhcleNo;
	}

	public void setVhcleNo(String vhcleNo) {
		this.vhcleNo = vhcleNo;
	}

	public String getCustVmcd() {
		return custVmcd;
	}

	public void setCustVmcd(String custVmcd) {
		this.custVmcd = custVmcd;
	}

	public String getCustVhctCd() {
		return custVhctCd;
	}

	public void setCustVhctCd(String custVhctCd) {
		this.custVhctCd = custVhctCd;
	}

	public String getCustVhclDetlMdl() {
		return custVhclDetlMdl;
	}

	public void setCustVhclDetlMdl(String custVhclDetlMdl) {
		this.custVhclDetlMdl = custVhclDetlMdl;
	}

	public String getCustVmcdNm() {
		return custVmcdNm;
	}

	public void setCustVmcdNm(String custVmcdNm) {
		this.custVmcdNm = custVmcdNm;
	}

	public String getCustVhctCdNm() {
		return custVhctCdNm;
	}

	public void setCustVhctCdNm(String custVhctCdNm) {
		this.custVhctCdNm = custVhctCdNm;
	}

	public String getCustVhclDetlMdlNm() {
		return custVhclDetlMdlNm;
	}

	public void setCustVhclDetlMdlNm(String custVhclDetlMdlNm) {
		this.custVhclDetlMdlNm = custVhclDetlMdlNm;
	}

	public String getVocCnsltTitle() {
		return vocCnsltTitle;
	}

	public void setVocCnsltTitle(String vocCnsltTitle) {
		this.vocCnsltTitle = vocCnsltTitle;
	}

	public String getVocRecptDscr() {
		return vocRecptDscr;
	}

	public void setVocRecptDscr(String vocRecptDscr) {
		this.vocRecptDscr = vocRecptDscr;
	}

	public String getVocRecpterOpinion() {
		return vocRecpterOpinion;
	}

	public void setVocRecpterOpinion(String vocRecpterOpinion) {
		this.vocRecpterOpinion = vocRecpterOpinion;
	}

	public String getActDscrBefore() {
		return actDscrBefore;
	}

	public void setActDscrBefore(String actDscrBefore) {
		this.actDscrBefore = actDscrBefore;
	}

	public String getMgrProcModeYn() {
		return mgrProcModeYn;
	}

	public void setMgrProcModeYn(String mgrProcModeYn) {
		this.mgrProcModeYn = mgrProcModeYn;
	}

	public String getMgrCnfmReqFlag() {
		return mgrCnfmReqFlag;
	}

	public void setMgrCnfmReqFlag(String mgrCnfmReqFlag) {
		this.mgrCnfmReqFlag = mgrCnfmReqFlag;
	}

	public String getSearchMgrCnfmReqFlag() {
		return searchMgrCnfmReqFlag;
	}

	public void setSearchMgrCnfmReqFlag(String searchMgrCnfmReqFlag) {
		this.searchMgrCnfmReqFlag = searchMgrCnfmReqFlag;
	}

	public String getCnsltBussplcKndNm() {
		return cnsltBussplcKndNm;
	}

	public void setCnsltBussplcKndNm(String cnsltBussplcKndNm) {
		this.cnsltBussplcKndNm = cnsltBussplcKndNm;
	}

	public String getCnsltBussplcCd1Nm() {
		return cnsltBussplcCd1Nm;
	}

	public void setCnsltBussplcCd1Nm(String cnsltBussplcCd1Nm) {
		this.cnsltBussplcCd1Nm = cnsltBussplcCd1Nm;
	}

	public String getCnsltBussplcCd2Nm() {
		return cnsltBussplcCd2Nm;
	}

	public void setCnsltBussplcCd2Nm(String cnsltBussplcCd2Nm) {
		this.cnsltBussplcCd2Nm = cnsltBussplcCd2Nm;
	}

	public String getCnsltBussplcCd3Nm() {
		return cnsltBussplcCd3Nm;
	}

	public void setCnsltBussplcCd3Nm(String cnsltBussplcCd3Nm) {
		this.cnsltBussplcCd3Nm = cnsltBussplcCd3Nm;
	}

	public String getCnsltBussplcCd4Nm() {
		return cnsltBussplcCd4Nm;
	}

	public void setCnsltBussplcCd4Nm(String cnsltBussplcCd4Nm) {
		this.cnsltBussplcCd4Nm = cnsltBussplcCd4Nm;
	}

	public String getOneselfAppntKnd() {
		return oneselfAppntKnd;
	}

	public void setOneselfAppntKnd(String oneselfAppntKnd) {
		this.oneselfAppntKnd = oneselfAppntKnd;
	}

	public String getCnsltBussplcCd1() {
		return cnsltBussplcCd1;
	}

	public void setCnsltBussplcCd1(String cnsltBussplcCd1) {
		this.cnsltBussplcCd1 = cnsltBussplcCd1;
	}

	public String getCnsltBussplcCd2() {
		return cnsltBussplcCd2;
	}

	public void setCnsltBussplcCd2(String cnsltBussplcCd2) {
		this.cnsltBussplcCd2 = cnsltBussplcCd2;
	}

	public String getCnsltBussplcCd3() {
		return cnsltBussplcCd3;
	}

	public void setCnsltBussplcCd3(String cnsltBussplcCd3) {
		this.cnsltBussplcCd3 = cnsltBussplcCd3;
	}

	public String getCnsltBussplcCd4() {
		return cnsltBussplcCd4;
	}

	public void setCnsltBussplcCd4(String cnsltBussplcCd4) {
		this.cnsltBussplcCd4 = cnsltBussplcCd4;
	}

	public String getCnsltCustKnd() {
		return cnsltCustKnd;
	}

	public void setCnsltCustKnd(String cnsltCustKnd) {
		this.cnsltCustKnd = cnsltCustKnd;
	}

	public String getPartNoReason() {
		return partNoReason;
	}

	public void setPartNoReason(String partNoReason) {
		this.partNoReason = partNoReason;
	}

	public String getCnsltBussplcKnd() {
		return cnsltBussplcKnd;
	}

	public void setCnsltBussplcKnd(String cnsltBussplcKnd) {
		this.cnsltBussplcKnd = cnsltBussplcKnd;
	}

	public String getCnsltBussplcCd() {
		return cnsltBussplcCd;
	}

	public void setCnsltBussplcCd(String cnsltBussplcCd) {
		this.cnsltBussplcCd = cnsltBussplcCd;
	}

	public String getSearchTypeYear() {
		return searchTypeYear;
	}

	public void setSearchTypeYear(String searchTypeYear) {
		this.searchTypeYear = searchTypeYear;
	}

	public String getSearchLastReadKm() {
		return searchLastReadKm;
	}

	public void setSearchLastReadKm(String searchLastReadKm) {
		this.searchLastReadKm = searchLastReadKm;
	}

	public String getLastRcptDate() {
		return lastRcptDate;
	}

	public void setLastRcptDate(String lastRcptDate) {
		this.lastRcptDate = lastRcptDate;
	}

	public String getLastReadKm() {
		return lastReadKm;
	}

	public void setLastReadKm(String lastReadKm) {
		this.lastReadKm = lastReadKm;
	}

	public String getLastVhclMdl() {
		return lastVhclMdl;
	}

	public void setLastVhclMdl(String lastVhclMdl) {
		this.lastVhclMdl = lastVhclMdl;
	}

	public String getTypeYear() {
		return typeYear;
	}

	public void setTypeYear(String typeYear) {
		this.typeYear = typeYear;
	}

	public String getLastCustCode() {
		return lastCustCode;
	}

	public void setLastCustCode(String lastCustCode) {
		this.lastCustCode = lastCustCode;
	}

	public String getLastcustNm() {
		return lastcustNm;
	}

	public void setLastcustNm(String lastcustNm) {
		this.lastcustNm = lastcustNm;
	}

	public String getBrthdy() {
		return brthdy;
	}

	public void setBrthdy(String brthdy) {
		this.brthdy = brthdy;
	}

	public String getSexKnd() {
		return sexKnd;
	}

	public void setSexKnd(String sexKnd) {
		this.sexKnd = sexKnd;
	}

	public String getCustVhclMdl() {
		return custVhclMdl;
	}

	public void setCustVhclMdl(String custVhclMdl) {
		this.custVhclMdl = custVhclMdl;
	}

	public String getCustVhclMdlNm() {
		return custVhclMdlNm;
	}

	public void setCustVhclMdlNm(String custVhclMdlNm) {
		this.custVhclMdlNm = custVhclMdlNm;
	}

	public String getCmplMngNo() {
		return cmplMngNo;
	}

	public void setCmplMngNo(String cmplMngNo) {
		this.cmplMngNo = cmplMngNo;
	}

	public String getCmplRecptDt() {
		return cmplRecptDt;
	}

	public void setCmplRecptDt(String cmplRecptDt) {
		this.cmplRecptDt = cmplRecptDt;
	}

	public String getCmplRecptSeq() {
		return cmplRecptSeq;
	}

	public void setCmplRecptSeq(String cmplRecptSeq) {
		this.cmplRecptSeq = cmplRecptSeq;
	}

	public String getSearchVmcd() {
		return searchVmcd;
	}

	public void setSearchVmcd(String searchVmcd) {
		this.searchVmcd = searchVmcd;
	}

	public String getSearchVhctCd() {
		return searchVhctCd;
	}

	public void setSearchVhctCd(String searchVhctCd) {
		this.searchVhctCd = searchVhctCd;
	}

	public String getSearchVhclMdl() {
		return searchVhclMdl;
	}

	public void setSearchVhclMdl(String searchVhclMdl) {
		this.searchVhclMdl = searchVhclMdl;
	}

	public String getSearchVhclDetlMdl() {
		return searchVhclDetlMdl;
	}

	public void setSearchVhclDetlMdl(String searchVhclDetlMdl) {
		this.searchVhclDetlMdl = searchVhclDetlMdl;
	}

	public String getBussplcCd1Nm() {
		return bussplcCd1Nm;
	}

	public void setBussplcCd1Nm(String bussplcCd1Nm) {
		this.bussplcCd1Nm = bussplcCd1Nm;
	}

	public String getBussplcCd2Nm() {
		return bussplcCd2Nm;
	}

	public void setBussplcCd2Nm(String bussplcCd2Nm) {
		this.bussplcCd2Nm = bussplcCd2Nm;
	}

	public String getBussplcCd3Nm() {
		return bussplcCd3Nm;
	}

	public void setBussplcCd3Nm(String bussplcCd3Nm) {
		this.bussplcCd3Nm = bussplcCd3Nm;
	}

	public String getBussplcCd4Nm() {
		return bussplcCd4Nm;
	}

	public void setBussplcCd4Nm(String bussplcCd4Nm) {
		this.bussplcCd4Nm = bussplcCd4Nm;
	}

	public String getCmplCdNm() {
		return cmplCdNm;
	}

	public void setCmplCdNm(String cmplCdNm) {
		this.cmplCdNm = cmplCdNm;
	}

	public String getCmplCd() {
		return cmplCd;
	}

	public void setCmplCd(String cmplCd) {
		this.cmplCd = cmplCd;
	}

	public String getCmplCd1No() {
		return cmplCd1No;
	}

	public void setCmplCd1No(String cmplCd1No) {
		this.cmplCd1No = cmplCd1No;
	}

	public String getCmplCd2No() {
		return cmplCd2No;
	}

	public void setCmplCd2No(String cmplCd2No) {
		this.cmplCd2No = cmplCd2No;
	}

	public String getCmplCd3No() {
		return cmplCd3No;
	}

	public void setCmplCd3No(String cmplCd3No) {
		this.cmplCd3No = cmplCd3No;
	}

	public String getCmplCd4No() {
		return cmplCd4No;
	}

	public void setCmplCd4No(String cmplCd4No) {
		this.cmplCd4No = cmplCd4No;
	}

	public String getCmplCdLvl() {
		return cmplCdLvl;
	}

	public void setCmplCdLvl(String cmplCdLvl) {
		this.cmplCdLvl = cmplCdLvl;
	}

	public String getCmplCd1Nm() {
		return cmplCd1Nm;
	}

	public void setCmplCd1Nm(String cmplCd1Nm) {
		this.cmplCd1Nm = cmplCd1Nm;
	}

	public String getCmplCd2Nm() {
		return cmplCd2Nm;
	}

	public void setCmplCd2Nm(String cmplCd2Nm) {
		this.cmplCd2Nm = cmplCd2Nm;
	}

	public String getCmplCd3Nm() {
		return cmplCd3Nm;
	}

	public void setCmplCd3Nm(String cmplCd3Nm) {
		this.cmplCd3Nm = cmplCd3Nm;
	}

	public String getCmplCd4Nm() {
		return cmplCd4Nm;
	}

	public void setCmplCd4Nm(String cmplCd4Nm) {
		this.cmplCd4Nm = cmplCd4Nm;
	}

	public String getCnsltTitle() {
		return cnsltTitle;
	}

	public void setCnsltTitle(String cnsltTitle) {
		this.cnsltTitle = cnsltTitle;
	}

	public String getRecptDscr() {
		return recptDscr;
	}

	public void setRecptDscr(String recptDscr) {
		this.recptDscr = recptDscr;
	}

	public String getRecpterOpinion() {
		return recpterOpinion;
	}

	public void setRecpterOpinion(String recpterOpinion) {
		this.recpterOpinion = recpterOpinion;
	}

	public String getRecptKndNm() {
		return recptKndNm;
	}

	public void setRecptKndNm(String recptKndNm) {
		this.recptKndNm = recptKndNm;
	}

	public String getCnsltCategoryNm() {
		return cnsltCategoryNm;
	}

	public void setCnsltCategoryNm(String cnsltCategoryNm) {
		this.cnsltCategoryNm = cnsltCategoryNm;
	}

	public String getRecptRootNm() {
		return recptRootNm;
	}

	public void setRecptRootNm(String recptRootNm) {
		this.recptRootNm = recptRootNm;
	}

	public String getCstmrProtectKndNm() {
		return cstmrProtectKndNm;
	}

	public void setCstmrProtectKndNm(String cstmrProtectKndNm) {
		this.cstmrProtectKndNm = cstmrProtectKndNm;
	}

	public String getCstmrDemandNm() {
		return cstmrDemandNm;
	}

	public void setCstmrDemandNm(String cstmrDemandNm) {
		this.cstmrDemandNm = cstmrDemandNm;
	}

	public String getCmplSittnCdNm() {
		return cmplSittnCdNm;
	}

	public void setCmplSittnCdNm(String cmplSittnCdNm) {
		this.cmplSittnCdNm = cmplSittnCdNm;
	}

	public String getAccidentYnCdNm() {
		return accidentYnCdNm;
	}

	public void setAccidentYnCdNm(String accidentYnCdNm) {
		this.accidentYnCdNm = accidentYnCdNm;
	}

	public String getProcessSttusNm() {
		return processSttusNm;
	}

	public void setProcessSttusNm(String processSttusNm) {
		this.processSttusNm = processSttusNm;
	}

	public String getVmcdNm() {
		return vmcdNm;
	}

	public void setVmcdNm(String vmcdNm) {
		this.vmcdNm = vmcdNm;
	}

	public String getVhctCdNm() {
		return vhctCdNm;
	}

	public void setVhctCdNm(String vhctCdNm) {
		this.vhctCdNm = vhctCdNm;
	}

	public String getVhclMdlNm() {
		return vhclMdlNm;
	}

	public void setVhclMdlNm(String vhclMdlNm) {
		this.vhclMdlNm = vhclMdlNm;
	}

	public String getVhclDetlMdlNm() {
		return vhclDetlMdlNm;
	}

	public void setVhclDetlMdlNm(String vhclDetlMdlNm) {
		this.vhclDetlMdlNm = vhclDetlMdlNm;
	}

	public String getSearchCmplSittnCd() {
		return searchCmplSittnCd;
	}

	public void setSearchCmplSittnCd(String searchCmplSittnCd) {
		this.searchCmplSittnCd = searchCmplSittnCd;
	}

	public String getSearchVocKnd() {
		return searchVocKnd;
	}

	public void setSearchVocKnd(String searchVocKnd) {
		this.searchVocKnd = searchVocKnd;
	}

	public String getSearchBussplcCd1() {
		return searchBussplcCd1;
	}

	public void setSearchBussplcCd1(String searchBussplcCd1) {
		this.searchBussplcCd1 = searchBussplcCd1;
	}

	public String getSearchBussplcCd2() {
		return searchBussplcCd2;
	}

	public void setSearchBussplcCd2(String searchBussplcCd2) {
		this.searchBussplcCd2 = searchBussplcCd2;
	}

	public String getSearchBussplcCd3() {
		return searchBussplcCd3;
	}

	public void setSearchBussplcCd3(String searchBussplcCd3) {
		this.searchBussplcCd3 = searchBussplcCd3;
	}

	public String getSearchBussplcCd4() {
		return searchBussplcCd4;
	}

	public void setSearchBussplcCd4(String searchBussplcCd4) {
		this.searchBussplcCd4 = searchBussplcCd4;
	}

	public String getSearchCnsltCategory() {
		return searchCnsltCategory;
	}

	public void setSearchCnsltCategory(String searchCnsltCategory) {
		this.searchCnsltCategory = searchCnsltCategory;
	}

	public String getSearchCmplCdNm() {
		return searchCmplCdNm;
	}

	public void setSearchCmplCdNm(String searchCmplCdNm) {
		this.searchCmplCdNm = searchCmplCdNm;
	}

	public String getSearchCmplCd() {
		return searchCmplCd;
	}

	public void setSearchCmplCd(String searchCmplCd) {
		this.searchCmplCd = searchCmplCd;
	}

	public String getSearchCmplCd1No() {
		return searchCmplCd1No;
	}

	public void setSearchCmplCd1No(String searchCmplCd1No) {
		this.searchCmplCd1No = searchCmplCd1No;
	}

	public String getSearchCmplCd2No() {
		return searchCmplCd2No;
	}

	public void setSearchCmplCd2No(String searchCmplCd2No) {
		this.searchCmplCd2No = searchCmplCd2No;
	}

	public String getSearchCmplCd3No() {
		return searchCmplCd3No;
	}

	public void setSearchCmplCd3No(String searchCmplCd3No) {
		this.searchCmplCd3No = searchCmplCd3No;
	}

	public String getSearchCmplCd4No() {
		return searchCmplCd4No;
	}

	public void setSearchCmplCd4No(String searchCmplCd4No) {
		this.searchCmplCd4No = searchCmplCd4No;
	}

	public String getSearchCmplCdLvl() {
		return searchCmplCdLvl;
	}

	public void setSearchCmplCdLvl(String searchCmplCdLvl) {
		this.searchCmplCdLvl = searchCmplCdLvl;
	}

	public String getSearchCmplCd1Nm() {
		return searchCmplCd1Nm;
	}

	public void setSearchCmplCd1Nm(String searchCmplCd1Nm) {
		this.searchCmplCd1Nm = searchCmplCd1Nm;
	}

	public String getSearchCmplCd2Nm() {
		return searchCmplCd2Nm;
	}

	public void setSearchCmplCd2Nm(String searchCmplCd2Nm) {
		this.searchCmplCd2Nm = searchCmplCd2Nm;
	}

	public String getSearchCmplCd3Nm() {
		return searchCmplCd3Nm;
	}

	public void setSearchCmplCd3Nm(String searchCmplCd3Nm) {
		this.searchCmplCd3Nm = searchCmplCd3Nm;
	}

	public String getSearchCmplCd4Nm() {
		return searchCmplCd4Nm;
	}

	public void setSearchCmplCd4Nm(String searchCmplCd4Nm) {
		this.searchCmplCd4Nm = searchCmplCd4Nm;
	}

	public String getSearchCnsltTitle() {
		return searchCnsltTitle;
	}

	public void setSearchCnsltTitle(String searchCnsltTitle) {
		this.searchCnsltTitle = searchCnsltTitle;
	}

	public String getHouseZip() {
		return houseZip;
	}

	public void setHouseZip(String houseZip) {
		this.houseZip = houseZip;
	}

	public String getHouseAdres() {
		return houseAdres;
	}

	public void setHouseAdres(String houseAdres) {
		this.houseAdres = houseAdres;
	}

	public String getHouseAdresDetail() {
		return houseAdresDetail;
	}

	public void setHouseAdresDetail(String houseAdresDetail) {
		this.houseAdresDetail = houseAdresDetail;
	}

	public String getSearchHomeZip() {
		return searchHomeZip;
	}

	public void setSearchHomeZip(String searchHomeZip) {
		this.searchHomeZip = searchHomeZip;
	}

	public String getSelectEmailDomain() {
		return selectEmailDomain;
	}

	public void setSelectEmailDomain(String selectEmailDomain) {
		this.selectEmailDomain = selectEmailDomain;
	}

	public String getCstmrNm() {
		return cstmrNm;
	}

	public void setCstmrNm(String cstmrNm) {
		this.cstmrNm = cstmrNm;
	}

	public String getHpno() {
		return hpno;
	}

	public void setHpno(String hpno) {
		this.hpno = hpno;
	}

	public String getEmailAdres() {
		return emailAdres;
	}

	public void setEmailAdres(String emailAdres) {
		this.emailAdres = emailAdres;
	}

	public String getEmailDomain() {
		return emailDomain;
	}

	public void setEmailDomain(String emailDomain) {
		this.emailDomain = emailDomain;
	}

	public String getAdres() {
		return adres;
	}

	public void setAdres(String adres) {
		this.adres = adres;
	}

	public String getAdresDetl() {
		return adresDetl;
	}

	public void setAdresDetl(String adresDetl) {
		this.adresDetl = adresDetl;
	}

	public String getSearchEmailDomain() {
		return searchEmailDomain;
	}

	public void setSearchEmailDomain(String searchEmailDomain) {
		this.searchEmailDomain = searchEmailDomain;
	}

	public String getSearchHomeAdres() {
		return searchHomeAdres;
	}

	public void setSearchHomeAdres(String searchHomeAdres) {
		this.searchHomeAdres = searchHomeAdres;
	}

	public String getSearchHomeAdresDetl() {
		return searchHomeAdresDetl;
	}

	public void setSearchHomeAdresDetl(String searchHomeAdresDetl) {
		this.searchHomeAdresDetl = searchHomeAdresDetl;
	}

	public String getSearchCnsltKnd() {
		return searchCnsltKnd;
	}

	public void setSearchCnsltKnd(String searchCnsltKnd) {
		this.searchCnsltKnd = searchCnsltKnd;
	}

	public String getSearchCarNo() {
		return searchCarNo;
	}

	public void setSearchCarNo(String searchCarNo) {
		this.searchCarNo = searchCarNo;
	}

	public String getSearchCnsltUserNm() {
		return searchCnsltUserNm;
	}

	public void setSearchCnsltUserNm(String searchCnsltUserNm) {
		this.searchCnsltUserNm = searchCnsltUserNm;
	}

	public String getCodeId1() {
		return codeId1;
	}

	public void setCodeId1(String codeId1) {
		this.codeId1 = codeId1;
	}

	public String getCodeId2() {
		return codeId2;
	}

	public void setCodeId2(String codeId2) {
		this.codeId2 = codeId2;
	}

	public String getCodeId3() {
		return codeId3;
	}

	public void setCodeId3(String codeId3) {
		this.codeId3 = codeId3;
	}

	public String getCodeId4() {
		return codeId4;
	}

	public void setCodeId4(String codeId4) {
		this.codeId4 = codeId4;
	}

	public String getSearchBeginDe() {
		return searchBeginDe;
	}

	public void setSearchBeginDe(String searchBeginDe) {
		this.searchBeginDe = searchBeginDe;
	}

	public String getSearchEndDe() {
		return searchEndDe;
	}

	public void setSearchEndDe(String searchEndDe) {
		this.searchEndDe = searchEndDe;
	}

	public String getSearchCnsltBeginDe() {
		return searchCnsltBeginDe;
	}

	public void setSearchCnsltBeginDe(String searchCnsltBeginDe) {
		this.searchCnsltBeginDe = searchCnsltBeginDe;
	}

	public String getSearchCnsltEndDe() {
		return searchCnsltEndDe;
	}

	public void setSearchCnsltEndDe(String searchCnsltEndDe) {
		this.searchCnsltEndDe = searchCnsltEndDe;
	}

	public String getSearchCnsltTyCn() {
		return searchCnsltTyCn;
	}

	public void setSearchCnsltTyCn(String searchCnsltTyCn) {
		this.searchCnsltTyCn = searchCnsltTyCn;
	}

	public String getVhctCd() {
		return vhctCd;
	}

	public void setVhctCd(String vhctCd) {
		this.vhctCd = vhctCd;
	}

	public String getVmcd() {
		return vmcd;
	}

	public void setVmcd(String vmcd) {
		this.vmcd = vmcd;
	}

	public String getVhclMdl() {
		return vhclMdl;
	}

	public void setVhclMdl(String vhclMdl) {
		this.vhclMdl = vhclMdl;
	}

	public String getVhclDetlMdl() {
		return vhclDetlMdl;
	}

	public void setVhclDetlMdl(String vhclDetlMdl) {
		this.vhclDetlMdl = vhclDetlMdl;
	}

	public String getCnsltMemo() {
		return cnsltMemo;
	}

	public void setCnsltMemo(String cnsltMemo) {
		this.cnsltMemo = cnsltMemo;
	}

	public String getActDscr() {
		return actDscr;
	}

	public void setActDscr(String actDscr) {
		this.actDscr = actDscr;
	}

	public String getSearchCstmrNm() {
		return searchCstmrNm;
	}

	public void setSearchCstmrNm(String searchCstmrNm) {
		this.searchCstmrNm = searchCstmrNm;
	}

	public String getSearchHpno() {
		return searchHpno;
	}

	public void setSearchHpno(String searchHpno) {
		this.searchHpno = searchHpno;
	}

	public String getSearchEmailAdres() {
		return searchEmailAdres;
	}

	public void setSearchEmailAdres(String searchEmailAdres) {
		this.searchEmailAdres = searchEmailAdres;
	}

	public String getBussplcCd1() {
		return bussplcCd1;
	}

	public void setBussplcCd1(String bussplcCd1) {
		this.bussplcCd1 = bussplcCd1;
	}

	public String getBussplcCd2() {
		return bussplcCd2;
	}

	public void setBussplcCd2(String bussplcCd2) {
		this.bussplcCd2 = bussplcCd2;
	}

	public String getBussplcCd3() {
		return bussplcCd3;
	}

	public void setBussplcCd3(String bussplcCd3) {
		this.bussplcCd3 = bussplcCd3;
	}

	public String getBussplcCd4() {
		return bussplcCd4;
	}

	public void setBussplcCd4(String bussplcCd4) {
		this.bussplcCd4 = bussplcCd4;
	}

	public String getBndryTrgtCstmrYn() {
		return bndryTrgtCstmrYn;
	}

	public void setBndryTrgtCstmrYn(String bndryTrgtCstmrYn) {
		this.bndryTrgtCstmrYn = bndryTrgtCstmrYn;
	}

	public String getSearchCnsltSeCode() {
		return searchCnsltSeCode;
	}

	public void setSearchCnsltSeCode(String searchCnsltSeCode) {
		this.searchCnsltSeCode = searchCnsltSeCode;
	}

	public String getSearchParntsCodeId() {
		return searchParntsCodeId;
	}

	public void setSearchParntsCodeId(String searchParntsCodeId) {
		this.searchParntsCodeId = searchParntsCodeId;
	}

	public String getSearchCnsltIncallNo() {
		return searchCnsltIncallNo;
	}

	public void setSearchCnsltIncallNo(String searchCnsltIncallNo) {
		this.searchCnsltIncallNo = searchCnsltIncallNo;
	}

	public String getSearchCnsltUserId() {
		return searchCnsltUserId;
	}

	public void setSearchCnsltUserId(String searchCnsltUserId) {
		this.searchCnsltUserId = searchCnsltUserId;
	}

	public String getSearchCstmrCd() {
		return searchCstmrCd;
	}

	public void setSearchCstmrCd(String searchCstmrCd) {
		this.searchCstmrCd = searchCstmrCd;
	}

	public String getCnsltTyCd1() {
		return cnsltTyCd1;
	}

	public void setCnsltTyCd1(String cnsltTyCd1) {
		this.cnsltTyCd1 = cnsltTyCd1;
	}

	public String getCnsltTyCd2() {
		return cnsltTyCd2;
	}

	public void setCnsltTyCd2(String cnsltTyCd2) {
		this.cnsltTyCd2 = cnsltTyCd2;
	}

	public String getCnsltTyCd3() {
		return cnsltTyCd3;
	}

	public void setCnsltTyCd3(String cnsltTyCd3) {
		this.cnsltTyCd3 = cnsltTyCd3;
	}

	public String getCnsltTyCd4() {
		return cnsltTyCd4;
	}

	public void setCnsltTyCd4(String cnsltTyCd4) {
		this.cnsltTyCd4 = cnsltTyCd4;
	}

	public String getCnsltTyKeySn() {
		return cnsltTyKeySn;
	}

	public void setCnsltTyKeySn(String cnsltTyKeySn) {
		this.cnsltTyKeySn = cnsltTyKeySn;
	}

	public ArrayList<CnsltInBoundMngVO> getListCnsltTypeTable() {
		return listCnsltTypeTable;
	}

	public void setListCnsltTypeTable(ArrayList<CnsltInBoundMngVO> listCnsltTypeTable) {
		this.listCnsltTypeTable = listCnsltTypeTable;
	}

	public String getCodeIdLv2() {
		return codeIdLv2;
	}

	public void setCodeIdLv2(String codeIdLv2) {
		this.codeIdLv2 = codeIdLv2;
	}

	public String getCodeIdLv3() {
		return codeIdLv3;
	}

	public void setCodeIdLv3(String codeIdLv3) {
		this.codeIdLv3 = codeIdLv3;
	}

	public String getCodeIdLv4() {
		return codeIdLv4;
	}

	public void setCodeIdLv4(String codeIdLv4) {
		this.codeIdLv4 = codeIdLv4;
	}

	public String getCodeNmLv2() {
		return codeNmLv2;
	}

	public void setCodeNmLv2(String codeNmLv2) {
		this.codeNmLv2 = codeNmLv2;
	}

	public String getCodeNmLv3() {
		return codeNmLv3;
	}

	public void setCodeNmLv3(String codeNmLv3) {
		this.codeNmLv3 = codeNmLv3;
	}

	public String getCodeNmLv4() {
		return codeNmLv4;
	}

	public void setCodeNmLv4(String codeNmLv4) {
		this.codeNmLv4 = codeNmLv4;
	}

	public String getCnsltIncallNo() {
		return cnsltIncallNo;
	}

	public void setCnsltIncallNo(String cnsltIncallNo) {
		this.cnsltIncallNo = cnsltIncallNo;
	}

	public String getCnsltUserId() {
		return cnsltUserId;
	}

	public void setCnsltUserId(String cnsltUserId) {
		this.cnsltUserId = cnsltUserId;
	}

	public String getCstmrCd() {
		return cstmrCd;
	}

	public void setCstmrCd(String cstmrCd) {
		this.cstmrCd = cstmrCd;
	}

	public String getCnsltDt() {
		return cnsltDt;
	}

	public void setCnsltDt(String cnsltDt) {
		this.cnsltDt = cnsltDt;
	}

	public String getCnsltTime() {
		return cnsltTime;
	}

	public void setCnsltTime(String cnsltTime) {
		this.cnsltTime = cnsltTime;
	}

	public String getCallerNm() {
		return callerNm;
	}

	public void setCallerNm(String callerNm) {
		this.callerNm = callerNm;
	}

	public String getCnsltTyKey() {
		return cnsltTyKey;
	}

	public void setCnsltTyKey(String cnsltTyKey) {
		this.cnsltTyKey = cnsltTyKey;
	}

	public String getCnsltTyCn() {
		return cnsltTyCn;
	}

	public void setCnsltTyCn(String cnsltTyCn) {
		this.cnsltTyCn = cnsltTyCn;
	}

	public String getCnsltDscr() {
		return cnsltDscr;
	}

	public void setCnsltDscr(String cnsltDscr) {
		this.cnsltDscr = cnsltDscr;
	}

	public String getCnsltSttDscr() {
		return cnsltSttDscr;
	}

	public void setCnsltSttDscr(String cnsltSttDscr) {
		this.cnsltSttDscr = cnsltSttDscr;
	}

	public String getRecordCd() {
		return recordCd;
	}

	public void setRecordCd(String recordCd) {
		this.recordCd = recordCd;
	}

	public String getCallBackYn() {
		return callBackYn;
	}

	public void setCallBackYn(String callBackYn) {
		this.callBackYn = callBackYn;
	}

	public String getRelCnsltIncallNo() {
		return relCnsltIncallNo;
	}

	public void setRelCnsltIncallNo(String relCnsltIncallNo) {
		this.relCnsltIncallNo = relCnsltIncallNo;
	}

	public String getRegistDe() {
		return registDe;
	}

	public void setRegistDe(String registDe) {
		this.registDe = registDe;
	}

	public String getRegister() {
		return register;
	}

	public void setRegister(String register) {
		this.register = register;
	}

	public String getUpdtDe() {
		return updtDe;
	}

	public void setUpdtDe(String updtDe) {
		this.updtDe = updtDe;
	}

	public String getUpdusr() {
		return updusr;
	}

	public void setUpdusr(String updusr) {
		this.updusr = updusr;
	}

	public String getVocKnd() {
		return vocKnd;
	}

	public void setVocKnd(String vocKnd) {
		this.vocKnd = vocKnd;
	}

	public String getRecptKnd() {
		return recptKnd;
	}

	public void setRecptKnd(String recptKnd) {
		this.recptKnd = recptKnd;
	}

	public String getRecptRoot() {
		return recptRoot;
	}

	public void setRecptRoot(String recptRoot) {
		this.recptRoot = recptRoot;
	}

	public String getCnsltCategory() {
		return cnsltCategory;
	}

	public void setCnsltCategory(String cnsltCategory) {
		this.cnsltCategory = cnsltCategory;
	}

	public String getCstmrProtectKnd() {
		return cstmrProtectKnd;
	}

	public void setCstmrProtectKnd(String cstmrProtectKnd) {
		this.cstmrProtectKnd = cstmrProtectKnd;
	}

	public String getCstmrDemand() {
		return cstmrDemand;
	}

	public void setCstmrDemand(String cstmrDemand) {
		this.cstmrDemand = cstmrDemand;
	}

	public String getCmplSittnCd() {
		return cmplSittnCd;
	}

	public void setCmplSittnCd(String cmplSittnCd) {
		this.cmplSittnCd = cmplSittnCd;
	}

	public String getAccidentYnCd() {
		return accidentYnCd;
	}

	public void setAccidentYnCd(String accidentYnCd) {
		this.accidentYnCd = accidentYnCd;
	}

	public String getProcessSttus() {
		return processSttus;
	}

	public void setProcessSttus(String processSttus) {
		this.processSttus = processSttus;
	}

	public String getCstmrRel() {
		return cstmrRel;
	}

	public void setCstmrRel(String cstmrRel) {
		this.cstmrRel = cstmrRel;
	}

	public String getCallType() {
		return callType;
	}

	public void setCallType(String callType) {
		this.callType = callType;
	}

	public String getCnsltRslt() {
		return cnsltRslt;
	}

	public void setCnsltRslt(String cnsltRslt) {
		this.cnsltRslt = cnsltRslt;
	}

	public String getCnsltKnd() {
		return cnsltKnd;
	}

	public void setCnsltKnd(String cnsltKnd) {
		this.cnsltKnd = cnsltKnd;
	}

	List <CnsltInBoundMngVO> ec4CnsltInBoundMngList;


	/**
	 * ec4CnsltInBoundMngList attribute 를 리턴한다.
	 * @return List<EC4CnsltInBoundMngVO>
	 */
	public List<CnsltInBoundMngVO> getEC4CnsltInBoundMngList() {
		return ec4CnsltInBoundMngList;
	}

	/**
	 * ec4CnsltInBoundMngList attribute 값을 설정한다.
	 * @param ec4CnsltInBoundMngList List<EC4CnsltInBoundMngVO>
	 */
	public void setEC4CnsltInBoundMngList(List<CnsltInBoundMngVO> ec4CnsltInBoundMngList) {
		this.ec4CnsltInBoundMngList = ec4CnsltInBoundMngList;
	}





    /**
     * EgovMap에서 VO셋팅
     *
     * @param egovMap
     */
    public void setValuesFromEgovMap(EgovMap egovMap) {

	    this.vocKnd = (String)egovMap.get("vocKnd");
	    this.recptKnd = (String)egovMap.get("recptKnd");
		this.recptRoot = (String)egovMap.get("recptRoot");
	    this.cnsltCategory = (String)egovMap.get("cnsltCategory");
	    this.cstmrProtectKnd = (String)egovMap.get("cstmrProtectKnd");
	    this.cstmrDemand = (String)egovMap.get("cstmrDemand");
	    this.cmplSittnCd = (String)egovMap.get("cmplSittnCd");
	    this.accidentYnCd = (String)egovMap.get("accidentYnCd");
	    this.processSttus = (String)egovMap.get("processSttus");
	    this.cnsltIncallNo = (String)egovMap.get("cnsltIncallNo");                  /* 인바운드콜번호 */
	    this.cnsltUserId = (String)egovMap.get("cnsltUserId");                    /* 상담원아이디 */
	    this.cstmrCd = (String)egovMap.get("cstmrCd");                        /* 콜고객코드 */
	    this.cnsltDt = (String)egovMap.get("cnsltDt");                        /* 상담일자 */
	    this.cnsltTime = (String)egovMap.get("cnsltTime");                      /* 상담시간 */
	    this.callType = (String)egovMap.get("callType");                       /* 통화유형 */
	    this.cstmrRel = (String)egovMap.get("cstmrRel");                       /* 고객관계 */
	    this.callerNm = (String)egovMap.get("callerNm");                       /* 통화자명 */
		this.callerHpno = (String)egovMap.get("callerHpno");
	    this.cnsltTyKey = (String)egovMap.get("cnsltTyKey");                     /* 상담유형KEY */
	    this.cnsltTyKeySn = (String)egovMap.get("cnsltTyKeySn");                     /* 상담유형KEY */
	    this.cnsltTyCn = (String)egovMap.get("cnsltTyCn");                      /* 상담유형내용 */
	    this.cnsltTyCnCode = (String)egovMap.get("cnsltTyCnCode");                      /* 상담유형내용 */
	    this.cnsltKnd = (String)egovMap.get("cnsltKnd");                       /* 상담구분 */
	    this.cnsltRslt = (String)egovMap.get("cnsltRslt");                      /* 상담결과 */
	    this.cnsltDscr = (String)egovMap.get("cnsltDscr");                      /* 상담내용 */
	    this.cnsltSttDscr = (String)egovMap.get("cnsltSttDscr");                   /* 상담STT내용 */
	    this.cnsltMemo = (String)egovMap.get("cnsltMemo");                   	/* 상담메모 */
	    this.actDscr = (String)egovMap.get("actDscr");                   		/* 조치내용 */
	    this.recordCd = (String)egovMap.get("recordCd");                       /* 녹취코드 */
	    this.callBackYn = (String)egovMap.get("callBackYn");                     /* 콜백여부 */
	    this.relCnsltIncallNo = (String)egovMap.get("relCnsltIncallNo");               /* 참조콜번호 */
	    this.registDe = (String)egovMap.get("registDe");                       /* 등록일자 */
	    this.register = (String)egovMap.get("register");                       /* 등록자 */
	    this.updtDe = (String)egovMap.get("updtDe");                         /* 수정일자 */
	    this.updusr = (String)egovMap.get("updusr");                         /* 수정자 */
	    this.codeIdLv2 = (String)egovMap.get("codeIdLv2");
	    this.codeIdLv3 = (String)egovMap.get("codeIdLv3");
	    this.codeIdLv4 = (String)egovMap.get("codeIdLv4");
	    this.codeNmLv2 = (String)egovMap.get("codeNmLv2");
	    this.codeNmLv3 = (String)egovMap.get("codeNmLv3");
	    this.codeNmLv4 = (String)egovMap.get("codeNmLv4");
	    this.cnsltTyCd1 = (String)egovMap.get("cnsltTyCd1");
	    this.cnsltTyCd2 = (String)egovMap.get("cnsltTyCd2");
	    this.cnsltTyCd3 = (String)egovMap.get("cnsltTyCd3");
	    this.cnsltTyCd4 = (String)egovMap.get("cnsltTyCd4");
	    this.bndryTrgtCstmrYn = (String)egovMap.get("bndryTrgtCstmrYn");
        
	    this.bussplcCd1 = (String)egovMap.get("bussplcCd1");
	    this.bussplcCd2 = (String)egovMap.get("bussplcCd2");
	    this.bussplcCd3 = (String)egovMap.get("bussplcCd3");
	    this.bussplcCd4 = (String)egovMap.get("bussplcCd4");
	    
	    this.vmcd = (String)egovMap.get("vmcd");
	    this.vhctCd = (String)egovMap.get("vhctCd");
	    this.vhclMdl = (String)egovMap.get("vhclMdl");
	    this.vhclDetlMdl = (String)egovMap.get("vhclDetlMdl");
	    this.custVmcd = (String)egovMap.get("custVmcd");
	    this.custVhctCd = (String)egovMap.get("custVhctCd");
	    this.custVhclMdl = (String)egovMap.get("custVhclMdl");
	    this.custVhclDetlMdl = (String)egovMap.get("custVhclDetlMdl");
	    
	    this.vmcdNm = (String)egovMap.get("vmcdNm");
	    this.vhctCdNm = (String)egovMap.get("vhctCdNm");
	    this.vhclMdlNm = (String)egovMap.get("vhclMdlNm");
	    this.vhclDetlMdlNm = (String)egovMap.get("vhclDetlMdlNm");
	    this.custVmcdNm = (String)egovMap.get("custVmcdNm");
	    this.custVhctCdNm = (String)egovMap.get("custVhctCdNm");
	    this.custVhclMdlNm = (String)egovMap.get("custVhclMdlNm");
	    this.custVhclDetlMdlNm = (String)egovMap.get("custVhclDetlMdlNm");
	    
	    this.codeId1 = (String)egovMap.get("codeId1");
	    this.codeId2 = (String)egovMap.get("codeId2");
	    this.codeId3 = (String)egovMap.get("codeId3");
	    this.codeId4 = (String)egovMap.get("codeId4");

	    this.cstmrNm = (String)egovMap.get("cstmrNm");
	    this.hpno = (String)egovMap.get("hpno");
	    this.emailAdres = (String)egovMap.get("emailAdres");
	    this.emailDomain = (String)egovMap.get("emailDomain");
	    this.adres = (String)egovMap.get("adres");
	    this.adresDetl = (String)egovMap.get("adresDetl");
	    
	    this.houseZip = (String)egovMap.get("houseZip");
	    this.houseAdres = (String)egovMap.get("houseAdres");
	    this.houseAdresDetail = (String)egovMap.get("houseAdresDetail");
	    
	    this.selectEmailDomain = (String)egovMap.get("selectEmailDomain");
	    
	    this.recptKndNm = (String)egovMap.get("recptKndNm");
	    this.cnsltCategoryNm = (String)egovMap.get("cnsltCategoryNm");
	    this.recptRootNm = (String)egovMap.get("recptRootNm");
	    this.cstmrProtectKndNm = (String)egovMap.get("cstmrProtectKndNm");
	    this.cstmrDemandNm = (String)egovMap.get("cstmrDemandNm");
	    this.cmplSittnCdNm = (String)egovMap.get("cmplSittnCdNm");
	    this.accidentYnCdNm = (String)egovMap.get("accidentYnCdNm");
	    this.processSttusNm = (String)egovMap.get("processSttusNm");
	    
	    this.cnsltTitle = (String)egovMap.get("cnsltTitle");
	    this.recptDscr = (String)egovMap.get("recptDscr");
	    this.recpterOpinion = (String)egovMap.get("recpterOpinion");
	    
    	this.cmplCdNm = (String)egovMap.get("cmplCdNm");
    	this.cmplCd = (String)egovMap.get("cmplCd");
		this.cmplCd1No = (String)egovMap.get("cmplCd1No");
		this.cmplCd2No = (String)egovMap.get("cmplCd2No");
		this.cmplCd3No = (String)egovMap.get("cmplCd3No");
		this.cmplCd4No = (String)egovMap.get("cmplCd4No");
		this.cmplCdLvl = (String)egovMap.get("cmplCdLvl");
		this.cmplCd1Nm = (String)egovMap.get("cmplCd1Nm");
		this.cmplCd2Nm = (String)egovMap.get("cmplCd2Nm");
		this.cmplCd3Nm = (String)egovMap.get("cmplCd3Nm");
		this.cmplCd4Nm = (String)egovMap.get("cmplCd4Nm");
		this.oneselfAppntKnd = (String)egovMap.get("oneselfAppntKnd");
		this.cstmrMktAgreeFlag = (String)egovMap.get("cstmrMktAgreeFlag");
		this.smsFileAttachFlag = (String)egovMap.get("smsFileAttachFlag");
		this.salesLeadFlag = (String)egovMap.get("salesLeadFlag");
		this.mgrCnfmReqFlag = (String)egovMap.get("mgrCnfmReqFlag");
		this.actDscrBefore = (String)egovMap.get("actDscrBefore");
		this.vocCnsltTitle = (String)egovMap.get("vocCnsltTitle");
		this.vocRecptDscr = (String)egovMap.get("vocRecptDscr");
		this.vocRecpterOpinion = (String)egovMap.get("vocRecpterOpinion");
		
		this.bussplcCd1Nm = (String)egovMap.get("bussplcCd1Nm");
		this.bussplcCd2Nm = (String)egovMap.get("bussplcCd2Nm");
		this.bussplcCd3Nm = (String)egovMap.get("bussplcCd3Nm");
		this.bussplcCd4Nm = (String)egovMap.get("bussplcCd4Nm");
		
		this.cmplMngNo 		= (String)egovMap.get("cmplMngNo");
		this.cmplRecptDt 	= (String)egovMap.get("cmplRecptDt");
		this.cmplRecptSeq = "null".equals(String.valueOf(egovMap.get("cmplRecptSeq")))?"":String.valueOf(egovMap.get("cmplRecptSeq"));

		this.lastRcptDate = (String)egovMap.get("lastRcptDate");
		this.lastReadKm = (String)egovMap.get("lastReadKm");
		this.lastVhclMdl = (String)egovMap.get("lastVhclMdl");
		this.typeYear = (String)egovMap.get("typeYear");
		this.lastCustCode = (String)egovMap.get("lastCustCode");
		this.lastcustNm = (String)egovMap.get("lastcustNm");

		this.cnsltCustKnd = (String)egovMap.get("cnsltCustKnd");
		this.partNoReason = (String)egovMap.get("partNoReason");
		this.cnsltBussplcKnd = (String)egovMap.get("cnsltBussplcKnd");
		this.cnsltBussplcCd = (String)egovMap.get("cnsltBussplcCd");
		this.cnsltBussplcCd1 = (String)egovMap.get("cnsltBussplcCd1");
		this.cnsltBussplcCd2 = (String)egovMap.get("cnsltBussplcCd2");
		this.cnsltBussplcCd3 = (String)egovMap.get("cnsltBussplcCd3");
		this.cnsltBussplcCd4 = (String)egovMap.get("cnsltBussplcCd4");

		this.vhcleNo = (String)egovMap.get("vhcleNo");
		this.vin = (String)egovMap.get("vin");
		this.custVin = (String)egovMap.get("custVin");
		this.custVhcleNo = (String)egovMap.get("custVhcleNo");
		this.cstmrEsntlId = (String)egovMap.get("cstmrEsntlId");
		this.cstmrVhcleSeq = "null".equals(String.valueOf(egovMap.get("cstmrVhcleSeq")))?"":String.valueOf(egovMap.get("cstmrVhcleSeq"));
   }



}